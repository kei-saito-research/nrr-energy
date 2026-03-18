#!/usr/bin/env python3
"""Build E-2 sensitivity summaries from E-1 delta-U table v1.1."""

from __future__ import annotations

import csv
from pathlib import Path
from typing import Dict, Iterable, List, Tuple


PROFILES = ["q80_c20", "q50_c50", "q20_c80"]
COST_MODES = ["gross", "net"]


def read_rows(path: Path) -> List[dict]:
    with path.open(newline="", encoding="utf-8") as f:
        return [r for r in csv.DictReader(f) if r["split_role"] == "test"]


def parse_int(v: str) -> int:
    if v == "":
        return 0
    return int(float(v))


def summarize(rows: List[dict], mode: str, profile: str) -> Dict[str, float]:
    n = len(rows)
    if n == 0:
        return {
            "n_test": 0,
            "tie_count": 0,
            "tie_rate": 0.0,
            "coverage_count": 0,
            "coverage_rate": 0.0,
            "disagree_count": 0,
            "disagree_rate_all": 0.0,
            "disagree_rate_covered": 0.0,
        }
    dcol = f"decision_{mode}_{profile}"
    ccol = f"coverage_{mode}_{profile}"
    xcol = f"disagree_{mode}_{profile}"
    tie = sum(1 for r in rows if r[dcol] == "tie")
    coverage = sum(parse_int(r[ccol]) for r in rows)
    disagree = sum(parse_int(r[xcol]) for r in rows)
    return {
        "n_test": n,
        "tie_count": tie,
        "tie_rate": tie / n,
        "coverage_count": coverage,
        "coverage_rate": coverage / n,
        "disagree_count": disagree,
        "disagree_rate_all": disagree / n,
        "disagree_rate_covered": (disagree / coverage) if coverage else 0.0,
    }


def combo_order_family(pattern: str) -> str:
    left, right = pattern.split("_", 1)
    a, b = sorted([left, right])
    return f"{a}|{b}"


def groups_for_dataset(rows: List[dict], dataset: str) -> List[Tuple[str, str, List[dict]]]:
    ds_rows = [r for r in rows if r["dataset"] == dataset]
    out: List[Tuple[str, str, List[dict]]] = []
    out.append(("overall", "all", ds_rows))

    providers = sorted({r["provider"] for r in ds_rows})
    for provider in providers:
        out.append(("provider", provider, [r for r in ds_rows if r["provider"] == provider]))

    temperatures = sorted({r["temperature"] for r in ds_rows}, key=float)
    for temp in temperatures:
        out.append(("temperature", temp, [r for r in ds_rows if r["temperature"] == temp]))

    patterns = sorted({r["pattern"] for r in ds_rows})
    for pattern in patterns:
        out.append(("pattern", pattern, [r for r in ds_rows if r["pattern"] == pattern]))

    if dataset == "combo":
        families = sorted({combo_order_family(r["pattern"]) for r in ds_rows})
        for fam in families:
            out.append(
                (
                    "order_family",
                    fam,
                    [r for r in ds_rows if combo_order_family(r["pattern"]) == fam],
                )
            )
        directions = sorted({r["pattern"] for r in ds_rows})
        for direction in directions:
            out.append(
                ("order_direction", direction, [r for r in ds_rows if r["pattern"] == direction])
            )

    return out


def build_summary(rows: List[dict]) -> List[dict]:
    out: List[dict] = []
    for dataset in sorted({r["dataset"] for r in rows}):
        for segment_type, segment_value, sub in groups_for_dataset(rows, dataset):
            for profile in PROFILES:
                gross = summarize(sub, "gross", profile)
                net = summarize(sub, "net", profile)
                for mode, stats in [("gross", gross), ("net", net)]:
                    out.append(
                        {
                            "dataset": dataset,
                            "profile": profile,
                            "cost_mode": mode,
                            "segment_type": segment_type,
                            "segment_value": segment_value,
                            **stats,
                        }
                    )
                out.append(
                    {
                        "dataset": dataset,
                        "profile": profile,
                        "cost_mode": "delta_net_minus_gross",
                        "segment_type": segment_type,
                        "segment_value": segment_value,
                        "n_test": gross["n_test"],
                        "tie_count": net["tie_count"] - gross["tie_count"],
                        "tie_rate": net["tie_rate"] - gross["tie_rate"],
                        "coverage_count": net["coverage_count"] - gross["coverage_count"],
                        "coverage_rate": net["coverage_rate"] - gross["coverage_rate"],
                        "disagree_count": net["disagree_count"] - gross["disagree_count"],
                        "disagree_rate_all": net["disagree_rate_all"] - gross["disagree_rate_all"],
                        "disagree_rate_covered": (
                            net["disagree_rate_covered"] - gross["disagree_rate_covered"]
                        ),
                    }
                )
    return out


def write_csv(path: Path, rows: Iterable[dict]) -> None:
    rows = list(rows)
    if not rows:
        raise ValueError("no rows")
    fieldnames = list(rows[0].keys())
    with path.open("w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=fieldnames)
        w.writeheader()
        w.writerows(rows)


def main() -> None:
    evidence_dir = Path(__file__).resolve().parent
    in_path = evidence_dir / "energy_e1_delta_u_table_v1_1.csv"
    out_path = evidence_dir / "energy_e2_sensitivity_summary_v1.csv"

    rows = read_rows(in_path)
    summary = build_summary(rows)
    write_csv(out_path, summary)

    print(f"Wrote: {out_path}")
    print(f"Rows: {len(summary)}")


if __name__ == "__main__":
    main()
