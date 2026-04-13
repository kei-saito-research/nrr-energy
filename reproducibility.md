# Reproducibility (NRR-Energy)

## Scope

This repository surface bundles the current Energy manuscript package together with
the calibration evidence tables, vendored paired inputs, and bundled downstream
reference artifacts needed to reproduce the current Energy snapshot.

## Stable package commands

- Build the current manuscript to temp output:
  - `bash scripts/build_current_manuscript.sh`
  - default output: `/tmp/nrr-energy_current_build/nrr-energy_manuscript_v32.pdf`
- Verify the active manuscript surface:
  - `bash scripts/verify_active_review_surface.sh`
- Verify the current package checksum manifest:
  - `bash scripts/verify_current_package.sh`
- Verify the Step 3 closure contract on the repo surface:
  - `bash scripts/verify_step3_closure_contract.sh`
- Verify the Step 3 closure contract on an unpacked package:
  - `bash scripts/verify_step3_closure_contract.sh /path/to/unpacked_package_root`
- Build the current package bundle with explicit allowlisted contents:
  - `bash scripts/build_current_review_package.sh`
- Recompute the bundled Energy evidence tables:
  - `bash scripts/recompute_evidence.sh`

## Current snapshot

- Main TeX: `manuscript/current/nrr-energy_manuscript_v32.tex`
- Current PDF snapshot: `manuscript/current/nrr-energy_manuscript_v32.pdf`
- Active manuscript checksum manifest: `manuscript/checksums_active_review_surface_sha256.txt`
- Current package checksum manifest: `manuscript/checksums_current_package_sha256.txt`
- `manuscript/current/` is latest-only and contains only the active manuscript `.tex` / `.pdf` pair.

## Checksum policy

- `manuscript/checksums_active_review_surface_sha256.txt` covers the active manuscript
  surface and is limited to the committed current `.tex` / `.pdf` pair in
  `manuscript/current/`.
- `manuscript/checksums_current_package_sha256.txt` covers the repo-surface package
  needed to verify the current manuscript line and its stable entrypoints.
- Older manuscript versions and local working drafts are not retained in
  `manuscript/current/`; version history is tracked through git history.

## Bundled evidence surface

- Calibration tables and rebuild scripts:
  - `stats/evidence/energy_e1_delta_u_table_v1_1.csv`
  - `stats/evidence/energy_e1_cost_variant_audit_v1.csv`
  - `stats/evidence/energy_e1_tau_summary_v1_1.csv`
  - `stats/evidence/energy_e2_sensitivity_summary_v1.csv`
  - `stats/evidence/recompute_energy_e1_tables.py`
  - `stats/evidence/recompute_energy_e2_sensitivity.py`
- Frozen Boundary-derived physical paired inputs:
  - `stats/stageb_all/`
  - `stats/combo_rep3_all/`
  - `stats/raw_stageb_all/`
  - `stats/raw_combo_rep3_all/`
- Current manuscript-facing calibration and transfer anchors:
  - `results/analysis/energy_stagea_v2_impltrial_anthropic_gemini_summary_v1_2026-03-12.md`
  - `results/analysis/energy_forward_main_batch_results_v1_2026-03-12.md`
  - `results/analysis/energy_forward_main_batch_gemini_results_v1_2026-03-12.md`
  - `results/analysis/energy_forward_combo_two_direction_anthropic_results_v1_2026-03-13.md`
  - `results/analysis/energy_forward_combo_two_direction_gemini_results_v1_2026-03-13.md`
  - `results/analysis/energy_upstream_paper7_fixed_reference_note_v2_2026-04-01.md`
  - plus the directly linked Stage A audit, package-local condition-metadata CSVs, freeze-gate, freeze-manifest, and calibration-bundle artifacts for the four routed implementation-trial runs
- Bundled downstream references for later `Policy-Verification` work:
  - summary-level comparison notes for the shipped priority-resolution, downstream-boundary, and side-topic/quarantine follow-up surfaces
  - plus the downstream support layer:
    - side-topic/quarantine minispec and repair notes
    - repaired and superseded side-topic/quarantine run-input CSVs
    - linked run-annotation CSVs
    - authorized run-output directories for the frozen 2026-03-17 priority-resolution, downstream-boundary, and repaired side-topic/quarantine provider slices

## Vendored upstream note

The vendored paired inputs in this workspace were copied from the historical
`Boundary` workspace on 2026-03-07 JST.

Source snapshot at copy time:
- workspace: `nrr-boundary`
- branch: `main`
- HEAD: `4cbb80c`
- copied stats paths had no local diffs at copy time

Physical origin:
- the files under `stats/stageb_all/`, `stats/combo_rep3_all/`, `stats/raw_stageb_all/`,
  and `stats/raw_combo_rep3_all/` are the fixed vendored 2026-03-07 copy of the
  historical `Boundary` snapshot listed above

Current series-role split:
- the fixed `NRR-Patterns` reference snapshot anchors the upstream
  family-benchmark plus selected Stage B boundary-honesty role for the current
  `NRR-Patterns -> Energy` transition
- the carried-forward Stage B slice is the overlap between that fixed upstream
  reference snapshot and the frozen Boundary-derived physical input snapshot
- the ordered-combo slice is reused from the same frozen Boundary-derived input
  snapshot as an Energy-side calibration extension and is not part of the fixed
  upstream reference contract

Series-path context note:
- `Coupled` is cited in the current Energy manuscript as a fixed-tree context reference
  for the dependency-propagation layer
- `Coupled` is not a direct evidentiary input to this package

Fixed upstream reference note:
- the current upstream reference surface for the `NRR-Patterns -> Energy`
  transition is fixed to `paper7_integrated_manuscript_v0_29_2026-04-01.tex`
- exact upstream artifact names and checksums are recorded in
  `results/analysis/energy_upstream_paper7_fixed_reference_note_v2_2026-04-01.md`
- the shipped `upstream_reference/paper7_v0_29/` snapshot includes the PNG support
  files referenced by `paper7_integrated_checksums_sha256.txt`, so the bundled
  upstream checksum manifest is package-verifiable inside the review drop

These vendored inputs are the frozen upstream snapshot for the current Energy rebuild surface.
If they are intentionally revised later, record a new source note rather than silently replacing them.

## Forward Summary Surface Note

- The repository current package ships the Stage A implementation-trial summary together
  with its directly linked audit, freeze-gate, freeze-manifest, and calibration-bundle
  artifacts for the four routed runs.
- The shipped Stage A audit memos reference package-local condition-metadata CSVs and
  the shipped `energy_e1_tau_summary_v1_1.csv` via relative paths only.
- Later forward evidence is shipped at the summary-memo level.
- Some historical forward raw payload, audit, bundle, and decision-context files referenced during
  the original execution are not retained in the repository current package.
- In the shipped surface, later forward-package closure is therefore defined at the
  summary-memo layer rather than as a complete raw rerun or audit export.

## Fixed rebuild surface

The current reproducible Energy rebuild surface is limited to:
- E-1 calibration table recomputation
- E-2 sensitivity table recomputation

Current stable outputs:
- `stats/evidence/energy_e1_delta_u_table_v1_1.csv`
- `stats/evidence/energy_e1_cost_variant_audit_v1.csv`
- `stats/evidence/energy_e1_tau_summary_v1_1.csv`
- `stats/evidence/energy_e2_sensitivity_summary_v1.csv`

Legacy `energy_e1_*_v1.csv` files may remain on the repo surface for local history,
but they are not part of the current package surface.

## Artifact map

| Artifact | Command | Output |
|---|---|---|
| Current manuscript build | `bash scripts/build_current_manuscript.sh` | `/tmp/nrr-energy_current_build/nrr-energy_manuscript_v32.pdf` |
| Active manuscript surface verification | `bash scripts/verify_active_review_surface.sh` | stdout verification for `manuscript/checksums_active_review_surface_sha256.txt` plus latest-only checks on `manuscript/current/` |
| Current package checksum verification | `bash scripts/verify_current_package.sh` | stdout verification for `manuscript/checksums_current_package_sha256.txt` |
| Step 3 closure contract verification | `bash scripts/verify_step3_closure_contract.sh` | stdout pass/fail for repo-side Step 3 closure preflight |
| Current package bundle build | `bash scripts/build_current_review_package.sh` | zip path for the current allowlisted package |
| Energy evidence recomputation | `bash scripts/recompute_evidence.sh` | refreshed `stats/evidence/energy_e1_*` and `stats/evidence/energy_e2_sensitivity_summary_v1.csv` |
| Current manuscript source snapshot | N/A (tracked artifact) | `manuscript/current/nrr-energy_manuscript_v32.tex` |

## Scope caveat

- This package is closed as a calibration and boundary package at the shipped manuscript-plus-summary-memo level.
- Broader prospective `baseline vs Energy policy` validation is downstream-owned by `Policy-Verification`.
- Shipped downstream `Policy-Verification` materials are bundled references for later validation work; they are not core manuscript evidence claims of the Energy paper.
- The linked run-annotation CSVs and authorized 2026-03-17 run-output directories for the shipped downstream comparison memos, including the repaired side-topic/quarantine reruns, are included in the package.
- The repository current package is not a full rerun export for every historical forward execution file.
- Superseded malformed-input side-topic/quarantine `v1` readouts are archived out of
  the current manuscript-facing surface and should not be used as current evidence.
