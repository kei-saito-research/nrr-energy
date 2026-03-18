# Reproducibility (NRR-Energy)

## Scope

This repository surface bundles the current Energy manuscript package together with
the calibration evidence tables, vendored paired inputs, and bounded downstream
analysis artifacts needed to reproduce the current handoff-ready Energy line.

## Stable review-package commands

- Build the current manuscript to temp output:
  - `bash scripts/build_current_manuscript.sh`
  - default output: `/tmp/nrr-energy_current_build/nrr-energy_manuscript_v9.pdf`
- Verify the current review-package checksum manifest:
  - `bash scripts/verify_current_package.sh`
- Recompute the bundled Energy evidence tables:
  - `bash scripts/recompute_evidence.sh`

## Current review package

- Main TeX: `manuscript/current/nrr-energy_manuscript_v9.tex`
- Current PDF snapshot: `manuscript/current/nrr-energy_manuscript_v9.pdf`
- Current working markdown draft: `manuscript/current/nrr-energy_manuscript_draft_v0_5_2026-03-19.md`
- Checksum manifest: `manuscript/current/checksums_sha256.txt`

## Checksum policy

- `manuscript/current/checksums_sha256.txt` covers the tracked files that define the
  current review package for the latest manuscript line in `manuscript/current/`.
- Coverage includes the current main `.tex` file and the committed current `.pdf`.
- Coverage excludes `checksums_sha256.txt` itself, the working markdown draft,
  older manuscript versions that may remain for local continuity, and repo-specific
  artifacts outside `manuscript/current/` unless a separate manifest is provided.

## Bundled evidence surface

- Calibration tables and rebuild scripts:
  - `stats/evidence/energy_e1_delta_u_table_v1.csv`
  - `stats/evidence/energy_e1_delta_u_table_v1_1.csv`
  - `stats/evidence/energy_e1_cost_variant_audit_v1.csv`
  - `stats/evidence/energy_e1_tau_summary_v1.csv`
  - `stats/evidence/energy_e1_tau_summary_v1_1.csv`
  - `stats/evidence/energy_e2_sensitivity_summary_v1.csv`
  - `stats/evidence/recompute_energy_e1_tables.py`
  - `stats/evidence/recompute_energy_e2_sensitivity.py`
- Vendored upstream paired inputs:
  - `stats/stageb_all/`
  - `stats/combo_rep3_all/`
  - `stats/raw_stageb_all/`
  - `stats/raw_combo_rep3_all/`
- Current manuscript-facing downstream analysis anchors:
  - `results/analysis/energy_priority_resolution_branch_handoff_v3_2026-03-18.md`
  - `results/analysis/energy_priority_resolution_branch_synthesis_memo_v3_2026-03-18.md`
  - `results/analysis/energy_priority_resolution_package_map_v1_2026-03-18.md`
  - `results/analysis/energy_priority_resolution_manuscript_boundary_text_v2_2026-03-18.md`
  - `results/analysis/energy_priority_resolution_package_boundary_external_review_decision_memo_v1_2026-03-18.md`
  - `results/analysis/energy_to_policy_handoff_memo_v1_2026-03-18.md`

## Vendored upstream note

Boundary-derived calibration inputs were copied into this workspace on 2026-03-07 JST.

Source snapshot at copy time:
- workspace: `nrr-boundary`
- branch: `main`
- HEAD: `4cbb80c`
- copied stats paths had no local diffs at copy time

These vendored inputs are the frozen upstream snapshot for the current Energy rebuild surface.
If they are intentionally revised later, record a new source note rather than silently replacing them.

## Fixed rebuild surface

The current reproducible Energy rebuild surface is limited to:
- E-1 calibration table recomputation
- E-2 sensitivity table recomputation

Current stable outputs:
- `stats/evidence/energy_e1_delta_u_table_v1.csv`
- `stats/evidence/energy_e1_delta_u_table_v1_1.csv`
- `stats/evidence/energy_e1_cost_variant_audit_v1.csv`
- `stats/evidence/energy_e1_tau_summary_v1.csv`
- `stats/evidence/energy_e1_tau_summary_v1_1.csv`
- `stats/evidence/energy_e2_sensitivity_summary_v1.csv`

## Artifact map

| Artifact | Command | Output |
|---|---|---|
| Current manuscript build | `bash scripts/build_current_manuscript.sh` | `/tmp/nrr-energy_current_build/nrr-energy_manuscript_v9.pdf` |
| Current package checksum verification | `bash scripts/verify_current_package.sh` | stdout verification for `manuscript/current/checksums_sha256.txt` |
| Energy evidence recomputation | `bash scripts/recompute_evidence.sh` | refreshed `stats/evidence/energy_e1_*` and `stats/evidence/energy_e2_sensitivity_summary_v1.csv` |
| Current manuscript source snapshot | N/A (tracked artifact) | `manuscript/current/nrr-energy_manuscript_v9.tex` |

## Scope caveat

- The current Energy package is closed as a handoff-ready calibration and boundary package.
- Broader prospective `baseline vs Energy policy` validation is downstream-owned by `Policy-Verification`.
- Dialogue-side carryforward remains bounded to the tested provider pair and does not by itself authorize provider-universal or long-horizon claims.
