# Energy Forward Combo Two-Direction Results (Gemini t=0.0)

## Status
- Date: 2026-03-13
- Scope: Gemini extension of the branch-adjacent two-direction `combo` slice
- Directions:
  - `branch_conditional`
  - `conditional_branch`
- Not a manuscript claim memo

## Stage A route-probe freeze
- stable impltrial corpus:
  - `stats/decision_context_v2_impltrial_stable_combo_gemini_20260313T032743Z`
- context-drift impltrial corpus:
  - `stats/decision_context_v2_impltrial_context_drift_combo_gemini_20260313T033346Z`
- historical frozen-bundle reference (not shipped in the current review surface):
  - `results/analysis/forward_coverage_bundle_stagea_gemini_t00_combo_v1_2026-03-13.json`
- historical frozen-bundle checksum reference:
  - `c81e875c88c5bddbf09096c51eb31725c27d4e23f50676a80373e93c177bd46f`
- bundle rows:
  - `forward_coverage_v1|combo|gemini|gemini-2.0-flash|0.0|branch_conditional`
  - `forward_coverage_v1|combo|gemini|gemini-2.0-flash|0.0|conditional_branch`

## Shadow and pilot
- shadow pilot:
  - run label:
    - `energy_forward_shadow_pilot_gemini_combo_t00_20260313T034213Z`
  - audit:
    - `results/analysis/energy_forward_shadow_pilot_audit_energy_forward_shadow_pilot_gemini_combo_t00_20260313T034213Z_v1.json`
  - result:
    - `pass`
- online pilot:
  - run label:
    - `energy_forward_online_gemini_combo_t00_20260313T034520Z`
  - audit:
    - `results/analysis/energy_forward_online_pilot_audit_energy_forward_online_gemini_combo_t00_20260313T034520Z_v1.json`
  - result:
    - `pass`
  - exact replay:
    - `6/6`
  - energy policy decisions:
    - `prefer_pattern = 0`
    - `prefer_baseline = 6`
    - `tie = 0`

## Main batch
- run label:
  - `energy_forward_main_gemini_combo_t00_20260313T034744Z`
- historical exact-replay audit reference (not shipped in the current review surface):
  - `results/analysis/energy_forward_main_batch_audit_energy_forward_main_gemini_combo_t00_20260313T034744Z_v1.json`
- status:
  - `pass`
- exact replay:
  - `48/48`
- energy policy decisions:
  - `prefer_pattern = 0`
  - `prefer_baseline = 48`
  - `tie = 0`

## Per-scenario route choice
- `S_FORWARD_STABLE_01`
  - `baseline = 16/16`
  - interpretation:
    - both `branch_conditional` and `conditional_branch` remain baseline-side across all reps
  - stable-slice watch point:
    - one stable subgroup remains only mildly negative (`DeltaU_online` around `-0.53`)
    - the other stable subgroup is strongly negative because of very large negative `q_z` (`DeltaU_online` around `-17` to `-18`)
- `S_FORWARD_CONTEXT_DRIFT_01`
  - `baseline = 16/16`
  - `DeltaU_online` remains strongly negative throughout
- `S_FORWARD_DRIFT_RETURN_RECOVERY_01`
  - `baseline = 16/16`
  - `DeltaU_online` remains strongly negative throughout

## Outcome metrics
- baseline arm:
  - `misinterpretation_rate = 0.2562500000000002`
  - `trace_completeness = 0.9333333333333323`
  - `update_consistency = 0.8218750000000005`
  - `internal_coherence_error_rate = 0.06666666666666668`
  - `self_contradiction_rate = 0.0`
  - `rework_cost_tokens = 538.6458333333334`
- energy arm:
  - `misinterpretation_rate = 0.2562500000000002`
  - `trace_completeness = 0.9333333333333323`
  - `update_consistency = 0.8218750000000005`
  - `internal_coherence_error_rate = 0.06666666666666668`
  - `self_contradiction_rate = 0.0`
  - `rework_cost_tokens = 538.6458333333334`

## Watch point
- `c_z_dominant_count = 39/48`
- `|c_z_frozen| > 3` on `32/48` rows
- interpretation:
  - replay integrity is clean, so the issue is not logging or bundle addressing
  - unlike Anthropic, Gemini sends even the stable combo slice to baseline across both directions
  - the stable combo instability is not explained only by `c_z`; very large negative `q_z` remains the more informative watch point inside the stable rows
  - outcome metrics are not clean, although baseline and Energy remain matched

## Reading
- The branch-adjacent `combo` slice is operationally runnable on Gemini.
- But the provider contrast is now sharper than before:
  - Anthropic 2-direction combo stayed stable-side on `S_FORWARD_STABLE_01`
  - Gemini 2-direction combo moved the same stable slice fully to baseline
- In the current closed review surface, this memo functions as a bounded Gemini combo boundary read rather than as an open branch-planning note.
