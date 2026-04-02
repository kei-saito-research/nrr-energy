# Results Layout

This directory holds the Energy-line result bundles and derived analysis outputs
that support the current manuscript and handoff-ready package.

## Current structure

- `analysis/`
  - manuscript-facing calibration and transfer summary memos
  - upstream authority / input-role split notes
  - downstream handoff references for later `Policy-Verification` work
  - supporting audits and derived tables

## Current manuscript-facing calibration and transfer anchors

- `analysis/energy_stagea_v2_impltrial_anthropic_gemini_summary_v1_2026-03-12.md`
- `analysis/energy_forward_main_batch_results_v1_2026-03-12.md`
- `analysis/energy_forward_main_batch_gemini_results_v1_2026-03-12.md`
- `analysis/energy_forward_combo_two_direction_anthropic_results_v1_2026-03-13.md`
- `analysis/energy_forward_combo_two_direction_gemini_results_v1_2026-03-13.md`
- `analysis/energy_upstream_paper7_fixed_reference_note_v2_2026-04-01.md`
- the packaged Stage A implementation-trial surface also ships the directly linked audit, package-local condition-metadata CSVs, freeze-gate, freeze-manifest, and calibration-bundle artifacts for the four routed runs

## Bundled downstream handoff references

- `analysis/energy_policy_verification_priority_resolution_baseline_vs_energy_policy_comparison_memo_v1_2026-03-17.md`
- `analysis/energy_policy_verification_pilot_readout_external_review_decision_memo_v1_2026-03-17.md`
- `analysis/energy_policy_verification_downstream_boundary_baseline_vs_energy_policy_comparison_memo_v1_2026-03-17.md`
- `analysis/energy_policy_verification_downstream_boundary_readout_external_review_decision_memo_v1_2026-03-17.md`
- `analysis/energy_policy_verification_side_topic_quarantine_readout_external_review_decision_memo_v1_2026-03-18.md`
- `analysis/energy_policy_verification_side_topic_quarantine_annotation_minispec_v1_2026-03-17.md`
- `analysis/energy_policy_verification_side_topic_quarantine_input_artifact_repair_memo_v1_2026-03-18.md`
- `analysis/energy_policy_verification_side_topic_quarantine_run_annotation_anthropic_baseline_v2_2026-03-18.csv`
- `analysis/energy_policy_verification_side_topic_quarantine_run_annotation_anthropic_revised_energy_policy_v2_2026-03-18.csv`
- `analysis/energy_policy_verification_side_topic_quarantine_run_annotation_gemini_baseline_v2_2026-03-18.csv`
- `analysis/energy_policy_verification_side_topic_quarantine_run_annotation_gemini_revised_energy_policy_v2_2026-03-18.csv`
- `analysis/energy_policy_verification_side_topic_quarantine_baseline_vs_revised_energy_policy_comparison_memo_v2_2026-03-18.md`
- `analysis/energy_policy_verification_side_topic_quarantine_run_input_v1_2026-03-17.csv`
- `analysis/energy_policy_verification_side_topic_quarantine_run_input_gemini_v1_2026-03-17.csv`
- `analysis/energy_policy_verification_side_topic_quarantine_run_input_v2_2026-03-18.csv`
- `analysis/energy_policy_verification_side_topic_quarantine_run_input_gemini_v2_2026-03-18.csv`
- the packaged downstream handoff surface also ships the linked run-annotation CSVs and authorized run-output directories for the frozen 2026-03-17 priority-resolution, downstream-boundary, and repaired side-topic/quarantine provider slices

## Current scope note

- Calibration evidence tables remain under `../stats/evidence/`, with `energy_e1_*_v1_1.csv` as the current E-1 authority surface.
- The shipped Stage A implementation-trial surface includes the directly linked audit, freeze-gate, freeze-manifest, and calibration-bundle artifacts for the four routed runs.
- The Stage A audit memos in the package point only to shipped relative paths, not repo-local absolute paths.
- The later forward review surface still closes at summary memos rather than at a complete raw rerun or audit export.
- The current package keeps the fixed `paper7` authority surface separate from the
  frozen Boundary-derived physical input snapshot; the overlap is the carried-forward
  Stage B slice, while ordered-combo reuse is treated as an Energy-side extension.
- The current results surface includes bundled downstream handoff references for later
  `Policy-Verification` validation work, but those materials are not part of the core
  manuscript evidence claim that the Energy paper closes.
- The linked run-annotation CSVs and authorized 2026-03-17 run-output directories for the shipped downstream comparison memos, including the repaired side-topic/quarantine reruns, are included in the review package.
- Superseded malformed-input side-topic/quarantine `v1` readouts are shipped only as
  provenance under `analysis/archive/2026-04-01_superseded_side_topic_quarantine_v1/`
  and are not part of the active manuscript-facing surface.

## Archive note

- `analysis/archive/2026-04-01_superseded_side_topic_quarantine_v1/` is the only
  shipped archive subset in the current review package, retained for provenance only.
- The broader `analysis/archive/` tree remains repo-local history and is not fully shipped.
- The current package entry points are the files listed above rather than archived notes.
