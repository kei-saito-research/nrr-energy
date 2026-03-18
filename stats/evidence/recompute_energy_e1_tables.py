#!/usr/bin/env python3
"""Build E-1 Energy Delta-U tables from boundary artifacts.

Outputs:
- stats/evidence/energy_e1_delta_u_table_v1_1.csv
- stats/evidence/energy_e1_tau_summary_v1_1.csv
- stats/evidence/energy_e1_cost_variant_audit_v1.csv
"""

from __future__ import annotations

import csv
import glob
import json
import math
from dataclasses import dataclass
from pathlib import Path
from statistics import mean
from typing import Dict, Iterable, List, Optional, Tuple


EPS = 1e-12


@dataclass(frozen=True)
class DatasetSpec:
    name: str
    pair_metrics_csv: str
    raw_glob: str


DATASETS: List[DatasetSpec] = [
    DatasetSpec(
        name="stageb",
        pair_metrics_csv="stageb_all/mst_pair_metrics.csv",
        raw_glob="raw_stageb_all/*.json",
    ),
    DatasetSpec(
        name="combo",
        pair_metrics_csv="combo_rep3_all/mst_pair_metrics.csv",
        raw_glob="raw_combo_rep3_all/*.json",
    ),
]


PROFILES: List[Tuple[str, float, float]] = [
    ("q80_c20", 0.8, 0.2),
    ("q50_c50", 0.5, 0.5),
    ("q20_c80", 0.2, 0.8),
]


def decision_from_du(du: float, tau: float) -> str:
    if abs(du) <= tau:
        return "tie"
    return "prefer_pattern" if du > 0 else "prefer_baseline"


def temp_key(value: float | str) -> str:
    return f"{float(value):.1f}"


def row_key(
    dataset: str,
    provider: str,
    pattern: str,
    scenario_id: str,
    rep: int | str,
    temperature: float | str,
) -> Tuple[str, str, str, str, int, str]:
    return (dataset, provider, pattern, scenario_id, int(rep), temp_key(temperature))


def quantile(values: Iterable[float], q: float) -> float:
    xs = sorted(values)
    if not xs:
        raise ValueError("quantile() on empty sequence")
    if q <= 0:
        return xs[0]
    if q >= 1:
        return xs[-1]
    pos = (len(xs) - 1) * q
    lo = int(math.floor(pos))
    hi = int(math.ceil(pos))
    if lo == hi:
        return xs[lo]
    w = pos - lo
    return xs[lo] * (1 - w) + xs[hi] * w


def sign(x: float) -> int:
    if x > EPS:
        return 1
    if x < -EPS:
        return -1
    return 0


def zscore(x: float, mu: float, sd: float) -> float:
    return (x - mu) / (sd if sd > EPS else 1.0)


def load_pair_metrics(
    stats_dir: Path, spec: DatasetSpec
) -> Dict[Tuple[str, str, str, str, int, str], Dict[str, float]]:
    path = stats_dir / spec.pair_metrics_csv
    merged: Dict[Tuple[str, str, str, str, int, str], Dict[str, float]] = {}
    with path.open(newline="", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for r in reader:
            metric = r["metric"]
            if metric not in ("misinterpretation_rate", "rework_cost_tokens"):
                continue
            if r["tau_trace_pass"] != "True":
                continue
            key = row_key(
                spec.name,
                r["provider"],
                r["pattern"],
                r["scenario_id"],
                r["rep"],
                r["temperature"],
            )
            rec = merged.setdefault(key, {})
            if metric == "misinterpretation_rate":
                rec["q_improvement"] = float(r["improvement"])
            else:
                rec["c_gross"] = float(r["improvement"])
    return merged


def arm_output_tokens(arm: dict) -> Optional[int]:
    total = 0
    for turn in arm.get("turns", []):
        value = turn.get("output_tokens")
        if value is None:
            return None
        total += int(value)
    return total


def arm_input_tokens(arm: dict) -> Optional[int]:
    total = 0
    for turn in arm.get("turns", []):
        provider_response = turn.get("provider_response") or {}
        usage = provider_response.get("usage") or {}
        usage_metadata = provider_response.get("usageMetadata") or {}
        value = (
            usage.get("input_tokens")
            or usage.get("prompt_tokens")
            or usage_metadata.get("promptTokenCount")
        )
        if value is None:
            return None
        total += int(value)
    return total


def load_overheads(
    stats_dir: Path, spec: DatasetSpec
) -> Tuple[
    Dict[Tuple[str, str, str, str, int, str], float],
    Dict[Tuple[str, str, str, str, int, str], float],
]:
    output_overhead: Dict[Tuple[str, str, str, str, int, str], float] = {}
    total_overhead: Dict[Tuple[str, str, str, str, int, str], float] = {}
    for fp in sorted(glob.glob(str(stats_dir / spec.raw_glob))):
        with open(fp, encoding="utf-8") as f:
            data = json.load(f)
        for pair in data.get("pairs", []):
            provider = pair.get("provider")
            pattern = pair.get("pattern")
            scenario_id = pair.get("scenario_id")
            rep = int(pair.get("rep"))
            temp = pair.get("temperature")
            arms = pair.get("arms", {})
            if "baseline" not in arms or pattern not in arms:
                continue
            baseline_out = arm_output_tokens(arms["baseline"])
            pattern_out = arm_output_tokens(arms[pattern])
            baseline_in = arm_input_tokens(arms["baseline"])
            pattern_in = arm_input_tokens(arms[pattern])
            if (
                baseline_out is None
                or pattern_out is None
                or baseline_in is None
                or pattern_in is None
            ):
                continue
            key = row_key(spec.name, provider, pattern, scenario_id, rep, temp)
            output_overhead[key] = float(pattern_out - baseline_out)
            total_overhead[key] = float(
                (pattern_in + pattern_out) - (baseline_in + baseline_out)
            )
    return output_overhead, total_overhead


def stdev_population(values: List[float]) -> float:
    mu = mean(values)
    return math.sqrt(mean([(v - mu) ** 2 for v in values]))


def compute_tables(project_root: Path) -> Tuple[List[dict], List[dict], List[dict]]:
    stats_dir = project_root / "stats"

    base_rows: List[dict] = []
    summary_rows: List[dict] = []
    cost_variant_rows: List[dict] = []

    for spec in DATASETS:
        metric_map = load_pair_metrics(stats_dir, spec)
        output_overhead_map, total_overhead_map = load_overheads(stats_dir, spec)

        keys = sorted(
            set(metric_map.keys())
            & set(output_overhead_map.keys())
            & set(total_overhead_map.keys())
        )
        dataset_rows: List[dict] = []
        for k in keys:
            metric = metric_map[k]
            if "q_improvement" not in metric or "c_gross" not in metric:
                continue
            dataset, provider, pattern, scenario_id, rep, temp = k
            q_improvement = metric["q_improvement"]
            c_gross = metric["c_gross"]
            overhead_output = output_overhead_map[k]
            overhead_total = total_overhead_map[k]
            c_net_output = c_gross - overhead_output
            c_net_total = c_gross - overhead_total
            dataset_rows.append(
                {
                    "dataset": dataset,
                    "provider": provider,
                    "pattern": pattern,
                    "scenario_id": scenario_id,
                    "temperature": temp,
                    "rep": rep,
                    "split_role": "calibration" if rep in (1, 2) else "test",
                    "q_improvement": q_improvement,
                    "c_gross": c_gross,
                    "overhead_output": overhead_output,
                    "overhead_total": overhead_total,
                    "c_net_output": c_net_output,
                    "c_net_total": c_net_total,
                }
            )

        calibration_rows = [r for r in dataset_rows if r["rep"] in (1, 2)]
        if not calibration_rows:
            continue

        sign_flip_output_count = sum(
            1 for r in dataset_rows if sign(r["c_gross"]) != sign(r["c_net_output"])
        )
        sign_flip_total_count = sum(
            1 for r in dataset_rows if sign(r["c_gross"]) != sign(r["c_net_total"])
        )
        cost_variant_rows.append(
            {
                "dataset": spec.name,
                "n_rows": len(dataset_rows),
                "sign_flip_count_c_gross_vs_c_net_output": sign_flip_output_count,
                "sign_flip_rate_c_gross_vs_c_net_output": (
                    sign_flip_output_count / len(dataset_rows)
                ),
                "sign_flip_count_c_gross_vs_c_net_total": sign_flip_total_count,
                "sign_flip_rate_c_gross_vs_c_net_total": (
                    sign_flip_total_count / len(dataset_rows)
                ),
            }
        )

        for profile_name, wq, wc in PROFILES:
            q_vals = [r["q_improvement"] for r in calibration_rows]
            c_gross_vals = [r["c_gross"] for r in calibration_rows]
            c_net_vals = [r["c_net_output"] for r in calibration_rows]

            q_mu = mean(q_vals)
            q_sd = stdev_population(q_vals)
            cg_mu = mean(c_gross_vals)
            cg_sd = stdev_population(c_gross_vals)
            cn_mu = mean(c_net_vals)
            cn_sd = stdev_population(c_net_vals)

            abs_du_gross_cal: List[float] = []
            abs_du_net_cal: List[float] = []

            for r in dataset_rows:
                qz = zscore(r["q_improvement"], q_mu, q_sd)
                c_gross_z = zscore(r["c_gross"], cg_mu, cg_sd)
                c_net_z = zscore(r["c_net_output"], cn_mu, cn_sd)
                du_gross = wq * qz + wc * c_gross_z
                du_net = wq * qz + wc * c_net_z
                r[f"du_gross_{profile_name}"] = du_gross
                r[f"du_net_{profile_name}"] = du_net
                if r["rep"] in (1, 2):
                    abs_du_gross_cal.append(abs(du_gross))
                    abs_du_net_cal.append(abs(du_net))

            tau_gross = quantile(abs_du_gross_cal, 0.2)
            tau_net = quantile(abs_du_net_cal, 0.2)

            for r in dataset_rows:
                du_gross = r[f"du_gross_{profile_name}"]
                du_net = r[f"du_net_{profile_name}"]
                r[f"tau_gross_{profile_name}"] = tau_gross
                r[f"tau_net_{profile_name}"] = tau_net
                r[f"decision_gross_{profile_name}"] = decision_from_du(du_gross, tau_gross)
                r[f"decision_net_{profile_name}"] = decision_from_du(du_net, tau_net)

            # Oracle sign is derived from calibration-only mean DU for each condition.
            # This allows dis/coverage aggregation directly from the CSV rows.
            cond_key = lambda r: (
                r["provider"],
                r["pattern"],
                r["scenario_id"],
                r["temperature"],
            )
            oracle_gross: Dict[Tuple[str, str, str, str], str] = {}
            oracle_net: Dict[Tuple[str, str, str, str], str] = {}
            cal_groups: Dict[Tuple[str, str, str, str], List[dict]] = {}
            for r in calibration_rows:
                cal_groups.setdefault(cond_key(r), []).append(r)
            for k, rows in cal_groups.items():
                gross_mean = mean([x[f"du_gross_{profile_name}"] for x in rows])
                net_mean = mean([x[f"du_net_{profile_name}"] for x in rows])
                oracle_gross[k] = decision_from_du(gross_mean, 0.0)
                oracle_net[k] = decision_from_du(net_mean, 0.0)

            gross_test_n = 0
            gross_tie_n = 0
            gross_coverage_n = 0
            gross_disagree_n = 0
            net_test_n = 0
            net_tie_n = 0
            net_coverage_n = 0
            net_disagree_n = 0

            for r in dataset_rows:
                k = cond_key(r)
                og = oracle_gross.get(k, "tie")
                on = oracle_net.get(k, "tie")
                dg = r[f"decision_gross_{profile_name}"]
                dn = r[f"decision_net_{profile_name}"]
                r[f"oracle_sign_gross_{profile_name}"] = og
                r[f"oracle_sign_net_{profile_name}"] = on

                if r["split_role"] == "test":
                    gross_test_n += 1
                    net_test_n += 1

                    gross_is_tie = dg == "tie"
                    net_is_tie = dn == "tie"
                    gross_tie_n += int(gross_is_tie)
                    net_tie_n += int(net_is_tie)

                    gross_cov = int((not gross_is_tie) and og != "tie")
                    net_cov = int((not net_is_tie) and on != "tie")
                    gross_dis = int(gross_cov == 1 and dg != og)
                    net_dis = int(net_cov == 1 and dn != on)

                    gross_coverage_n += gross_cov
                    net_coverage_n += net_cov
                    gross_disagree_n += gross_dis
                    net_disagree_n += net_dis

                    r[f"coverage_gross_{profile_name}"] = gross_cov
                    r[f"coverage_net_{profile_name}"] = net_cov
                    r[f"disagree_gross_{profile_name}"] = gross_dis
                    r[f"disagree_net_{profile_name}"] = net_dis
                else:
                    r[f"coverage_gross_{profile_name}"] = ""
                    r[f"coverage_net_{profile_name}"] = ""
                    r[f"disagree_gross_{profile_name}"] = ""
                    r[f"disagree_net_{profile_name}"] = ""

            sign_flip_count = sum(
                1
                for r in dataset_rows
                if sign(r[f"du_gross_{profile_name}"]) != sign(r[f"du_net_{profile_name}"])
            )
            summary_rows.append(
                {
                    "dataset": spec.name,
                    "profile": profile_name,
                    "wq": wq,
                    "wc": wc,
                    "n_rows": len(dataset_rows),
                    "n_calibration": len(calibration_rows),
                    "n_test": sum(1 for r in dataset_rows if r["rep"] == 3),
                    "tau_gross_q20": tau_gross,
                    "tau_net_q20": tau_net,
                    "du_sign_flip_gross_vs_net_count": sign_flip_count,
                    "du_sign_flip_gross_vs_net_rate": sign_flip_count / len(dataset_rows),
                    "test_tie_rate_gross": (
                        gross_tie_n / gross_test_n if gross_test_n else float("nan")
                    ),
                    "test_coverage_rate_gross": (
                        gross_coverage_n / gross_test_n
                        if gross_test_n
                        else float("nan")
                    ),
                    "test_disagree_rate_all_gross": (
                        gross_disagree_n / gross_test_n
                        if gross_test_n
                        else float("nan")
                    ),
                    "test_disagree_rate_covered_gross": (
                        gross_disagree_n / gross_coverage_n
                        if gross_coverage_n
                        else float("nan")
                    ),
                    "test_tie_rate_net": (
                        net_tie_n / net_test_n if net_test_n else float("nan")
                    ),
                    "test_coverage_rate_net": (
                        net_coverage_n / net_test_n if net_test_n else float("nan")
                    ),
                    "test_disagree_rate_all_net": (
                        net_disagree_n / net_test_n if net_test_n else float("nan")
                    ),
                    "test_disagree_rate_covered_net": (
                        net_disagree_n / net_coverage_n
                        if net_coverage_n
                        else float("nan")
                    ),
                }
            )

        base_rows.extend(dataset_rows)

    return base_rows, summary_rows, cost_variant_rows


def write_csv(path: Path, rows: List[dict]) -> None:
    if not rows:
        raise ValueError(f"no rows to write: {path}")
    path.parent.mkdir(parents=True, exist_ok=True)
    fieldnames = sorted(rows[0].keys())
    with path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def main() -> None:
    project_root = Path(__file__).resolve().parents[2]
    evidence_dir = project_root / "stats" / "evidence"

    table_rows, summary_rows, cost_variant_rows = compute_tables(project_root)

    table_path = evidence_dir / "energy_e1_delta_u_table_v1_1.csv"
    summary_path = evidence_dir / "energy_e1_tau_summary_v1_1.csv"
    cost_variant_path = evidence_dir / "energy_e1_cost_variant_audit_v1.csv"

    write_csv(table_path, table_rows)
    write_csv(summary_path, summary_rows)
    write_csv(cost_variant_path, cost_variant_rows)

    print(f"Wrote: {table_path}")
    print(f"Wrote: {summary_path}")
    print(f"Wrote: {cost_variant_path}")
    print(
        f"Rows: table={len(table_rows)} summary={len(summary_rows)} "
        f"cost_audit={len(cost_variant_rows)}"
    )


if __name__ == "__main__":
    main()
