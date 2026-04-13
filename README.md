# NRR-Energy: Calibration of Commit/Defer Utility Under Existing Paired Inputs

NRR-Energy hosts the manuscript snapshot and reproducibility artifacts for the Energy line. The package focuses on calibration, quality measurement, and operational boundary control using paired inputs anchored by a fixed `NRR-Patterns` reference snapshot together with a frozen Boundary-derived vendored input snapshot.

NRR is not an anti-LLM framework.
NRR does not replace standard LLM use.
NRR optimizes when to commit and when to defer, under explicit conditions.

Part of the Non-Resolution Reasoning (NRR) research program.

## NRR Series Hub (Start here)

For the cross-paper map and current series links, start here:
- [NRR Series Hub](https://github.com/kei-saito-research/nrr-series-hub)

## Current manuscript snapshot

- Source: `manuscript/current/nrr-energy_manuscript_v31.tex`
- PDF: `manuscript/current/nrr-energy_manuscript_v31.pdf`
- Active manuscript checksum manifest: `manuscript/checksums_active_review_surface_sha256.txt`
- Current package checksum manifest: `manuscript/checksums_current_package_sha256.txt`
- `manuscript/current/` is latest-only and keeps only the active manuscript `.tex` / `.pdf` pair for this repo surface.

## Reproducibility entry points

- Reproducibility guide: `reproducibility.md`
- Build current manuscript package: `bash scripts/build_current_manuscript.sh`
- Verify active manuscript surface: `bash scripts/verify_active_review_surface.sh`
- Verify current manuscript checksum package: `bash scripts/verify_current_package.sh`
- Verify Step 3 closure contract on the repo surface: `bash scripts/verify_step3_closure_contract.sh`
- Verify Step 3 closure contract on an unpacked package: `bash scripts/verify_step3_closure_contract.sh /path/to/unpacked_review_root`
- Recompute bundled Energy evidence tables: `bash scripts/recompute_evidence.sh`

## Current Energy package

- Calibration evidence tables and rebuild scripts:
  - `stats/evidence/`
  - the current E-1 table set in this package is `energy_e1_*_v1_1.csv` plus `energy_e1_cost_variant_audit_v1.csv`
- Fixed Boundary-derived physical paired-input snapshot reused for current rebuilds:
  - `stats/stageb_all/`
  - `stats/combo_rep3_all/`
  - `stats/raw_stageb_all/`
  - `stats/raw_combo_rep3_all/`
- Physical origin note:
  - the fixed vendored paired-input snapshot was copied from the historical `Boundary` workspace on 2026-03-07 JST
  - the current Energy rebuild reuses that same frozen snapshot as its physical paired-input surface
- Series-path context note:
  - `Coupled` is cited in the current Energy manuscript as a fixed-tree context reference for the dependency-propagation layer
  - `Coupled` is not a direct evidentiary input to the current Energy calibration package
- Fixed upstream reference note:
  - the `NRR-Patterns -> Energy` transition is anchored to `paper7_integrated_manuscript_v0_29_2026-04-01.tex`
  - exact upstream artifact identity, checksums, and the boundary between the bundled `NRR-Patterns` snapshot and Boundary-derived physical inputs are recorded in `results/analysis/energy_upstream_paper7_fixed_reference_note_v2_2026-04-01.md`
  - the shipped `upstream_reference/paper7_v0_29/` snapshot includes the PNG support files referenced by `paper7_integrated_checksums_sha256.txt`, so the packaged upstream checksum surface is locally verifiable
- Upstream-role split:
  - the carried-forward Stage B slice is the overlap between the fixed upstream reference snapshot and the frozen Boundary-derived physical input snapshot
  - the ordered-combo slice is reused from the same frozen Boundary-derived snapshot as an Energy-side calibration extension and is not attributed to the fixed upstream reference snapshot
- Current manuscript-facing calibration and transfer anchors:
  - `results/analysis/energy_stagea_v2_impltrial_anthropic_gemini_summary_v1_2026-03-12.md`
  - `results/analysis/energy_forward_main_batch_results_v1_2026-03-12.md`
  - `results/analysis/energy_forward_main_batch_gemini_results_v1_2026-03-12.md`
  - `results/analysis/energy_forward_combo_two_direction_anthropic_results_v1_2026-03-13.md`
  - `results/analysis/energy_forward_combo_two_direction_gemini_results_v1_2026-03-13.md`
  - `results/analysis/energy_upstream_paper7_fixed_reference_note_v2_2026-04-01.md`
  - the shipped Stage A implementation-trial surface also includes the directly linked audit, package-local condition-metadata CSVs, freeze-gate, freeze-manifest, and calibration-bundle artifacts for the four routed runs
- Bundled downstream references for later `Policy-Verification` work:
  - `results/analysis/energy_policy_verification_priority_resolution_baseline_vs_energy_policy_comparison_memo_v1_2026-03-17.md`
  - `results/analysis/energy_policy_verification_pilot_readout_external_review_decision_memo_v1_2026-03-17.md`
  - `results/analysis/energy_policy_verification_downstream_boundary_baseline_vs_energy_policy_comparison_memo_v1_2026-03-17.md`
  - `results/analysis/energy_policy_verification_downstream_boundary_readout_external_review_decision_memo_v1_2026-03-17.md`
  - `results/analysis/energy_policy_verification_side_topic_quarantine_readout_external_review_decision_memo_v1_2026-03-18.md`
  - `results/analysis/energy_policy_verification_side_topic_quarantine_baseline_vs_revised_energy_policy_comparison_memo_v2_2026-03-18.md`
  - supporting downstream artifacts are also shipped:
    - minispec and repair memos for the repaired side-topic/quarantine line
    - repaired and superseded side-topic/quarantine run-input CSVs
    - linked run-annotation CSVs
    - authorized run-output directories for the frozen 2026-03-17 priority-resolution, downstream-boundary, and repaired side-topic/quarantine slices

## Scope boundary

This package is the current Energy snapshot at the level of the
shipped manuscript, vendored paired inputs, rebuild tables, and summary-level
boundary memos.

It supports:
- calibration evidence under the frozen Energy utility procedure
- implementation-gated forward boundary checks
- self-contained Stage A implementation-trial support artifacts for the routed four-run summary
- summary-memo review of the shipped forward boundary surface
- bundled downstream references for later `Policy-Verification` validation work
- shipped run-annotation CSVs and authorized run-output directories for the frozen 2026-03-17 downstream provider slices, including the repaired side-topic/quarantine reruns

It does not by itself authorize:
- broad prospective `baseline vs Energy policy` claims
- provider-universal policy claims
- `Guarantee` language
- a full rerun workspace for every historical forward execution file
- paper-level downstream carryforward closure
- package-supported later-horizon followthrough claims

Forward validation beyond this package is downstream-owned by `Policy-Verification`.
Shipped downstream `Policy-Verification` notes are bundled references rather than core manuscript evidence claims of the Energy paper.

Superseded malformed-input side-topic/quarantine `v1` readouts are shipped only as
provenance under `results/analysis/archive/2026-04-01_superseded_side_topic_quarantine_v1/`
and are not part of the current manuscript-facing surface.

## Repository structure

```text
nrr-energy/
|-- README.md
|-- LICENSE
|-- reproducibility.md
|-- manuscript/
|   |-- checksums_active_review_surface_sha256.txt
|   |-- checksums_current_package_sha256.txt
|   `-- current/
|       |-- nrr-energy_manuscript_v31.tex
|       `-- nrr-energy_manuscript_v31.pdf
|-- results/
|   `-- analysis/
|-- scripts/
|   |-- build_current_manuscript.sh
|   |-- verify_active_review_surface.sh
|   |-- verify_current_package.sh
|   `-- recompute_evidence.sh
`-- stats/
    |-- evidence/
    |-- stageb_all/
    |-- combo_rep3_all/
    |-- raw_stageb_all/
    `-- raw_combo_rep3_all/
```

## Stable package entrypoints

- `bash scripts/build_current_manuscript.sh`
- `bash scripts/verify_active_review_surface.sh`
- `bash scripts/verify_current_package.sh`
- `bash scripts/verify_step3_closure_contract.sh`
- `bash scripts/build_current_review_package.sh`
- `bash scripts/recompute_evidence.sh`

## License

CC BY 4.0. See `LICENSE`.

## Contact

Kei Saito
Independent Researcher, Japan
ORCID: https://orcid.org/0009-0006-4715-9176
Email: kei.saito.research@gmail.com
