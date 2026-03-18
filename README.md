# NRR-Energy: Calibration of Commit/Defer Utility Under Existing Paired Boundary Data

NRR-Energy is the Energy-line repository surface for the current manuscript package and reproducibility artifacts around calibration, forward boundary checks, and bounded downstream dialogue-side carryforward.

NRR is not an anti-LLM framework.
NRR does not replace standard LLM use.
NRR optimizes when to commit and when to defer, under explicit conditions.
Series numbering policy: `paper3` is permanently skipped and never reused.

Part of the Non-Resolution Reasoning (NRR) research program.

## NRR Series Hub (Start here)

For the cross-paper map and current series links, start here:
- [NRR Series Hub](https://github.com/kei-saito-research/nrr-series-hub)

## Current manuscript snapshot

- Source: `manuscript/current/nrr-energy_manuscript_v9.tex`
- PDF: `manuscript/current/nrr-energy_manuscript_v9.pdf`
- Working markdown draft: `manuscript/current/nrr-energy_manuscript_draft_v0_5_2026-03-19.md`
- Checksum manifest: `manuscript/current/checksums_sha256.txt`

## Reproducibility entry points

- Review-package guide: `reproducibility.md`
- Build current manuscript package: `bash scripts/build_current_manuscript.sh`
- Verify current manuscript package: `bash scripts/verify_current_package.sh`
- Recompute bundled Energy evidence tables: `bash scripts/recompute_evidence.sh`

## Current Energy package

- Calibration evidence tables and rebuild scripts:
  - `stats/evidence/`
- Vendored Boundary-derived paired inputs for current rebuilds:
  - `stats/stageb_all/`
  - `stats/combo_rep3_all/`
  - `stats/raw_stageb_all/`
  - `stats/raw_combo_rep3_all/`
- Current manuscript-facing analysis bundle:
  - `results/analysis/energy_priority_resolution_package_map_v1_2026-03-18.md`
  - `results/analysis/energy_priority_resolution_branch_handoff_v3_2026-03-18.md`
  - `results/analysis/energy_priority_resolution_branch_synthesis_memo_v3_2026-03-18.md`
  - `results/analysis/energy_priority_resolution_manuscript_boundary_text_v2_2026-03-18.md`
  - `results/analysis/energy_priority_resolution_package_boundary_external_review_decision_memo_v1_2026-03-18.md`
  - `results/analysis/energy_to_policy_handoff_memo_v1_2026-03-18.md`

## Scope boundary

This package is the current closed Energy handoff surface.

It supports:
- calibration evidence under the frozen Energy utility procedure
- implementation-gated forward boundary checks
- bounded dialogue-side carryforward on the tested provider pair

It does not by itself authorize:
- broad prospective `baseline vs Energy policy` claims
- provider-universal policy claims
- `Guarantee` language

Forward validation beyond the closed Energy package is downstream-owned by `Policy-Verification`.

## Repository structure

```text
nrr-energy/
|-- README.md
|-- LICENSE
|-- reproducibility.md
|-- manuscript/
|   `-- current/
|       |-- nrr-energy_manuscript_v9.tex
|       |-- nrr-energy_manuscript_v9.pdf
|       |-- nrr-energy_manuscript_draft_v0_5_2026-03-19.md
|       `-- checksums_sha256.txt
|-- results/
|   `-- analysis/
|-- scripts/
|   |-- build_current_manuscript.sh
|   |-- verify_current_package.sh
|   `-- recompute_evidence.sh
`-- stats/
    |-- evidence/
    |-- stageb_all/
    |-- combo_rep3_all/
    |-- raw_stageb_all/
    `-- raw_combo_rep3_all/
```

## Stable review-package entrypoints

- `bash scripts/build_current_manuscript.sh`
- `bash scripts/verify_current_package.sh`
- `bash scripts/recompute_evidence.sh`

## License

CC BY 4.0. See `LICENSE`.

## Contact

Kei Saito
Independent Researcher, Japan
ORCID: https://orcid.org/0009-0006-4715-9176
Email: kei.saito.research@gmail.com
