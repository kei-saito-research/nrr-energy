# Energy Forward Combo Two-Direction Results (Anthropic t=0.0)

## Status
- Date: 2026-03-13
- Scope: first `combo` opening on the branch-adjacent two-direction slice
- Directions:
  - `branch_conditional`
  - `conditional_branch`
- Not a manuscript claim memo

## Stage A route-probe freeze
- stable impltrial corpus:
  - `stats/decision_context_v2_impltrial_stable_combo_anthropic_20260312T154158Z`
- context-drift impltrial corpus:
  - `stats/decision_context_v2_impltrial_context_drift_combo_anthropic_20260313T023535Z`
- historical frozen-bundle reference (not shipped in the current review surface):
  - `results/analysis/forward_coverage_bundle_stagea_anthropic_t00_combo_v1_2026-03-13.json`
- historical frozen-bundle checksum reference:
  - `f4b42113b4cf88254bf3c8bb4009e01079fcb816570b13e3167b04dcda91ca1f`
- bundle rows:
  - `forward_coverage_v1|combo|anthropic|claude-sonnet-4-20250514|0.0|branch_conditional`
  - `forward_coverage_v1|combo|anthropic|claude-sonnet-4-20250514|0.0|conditional_branch`
- source row count per bundle row:
  - `16`

## Shadow and pilot
- shadow pilot:
  - run label:
    - `energy_forward_shadow_pilot_anthropic_combo_t00_20260313T024916Z`
  - audit:
    - `results/analysis/energy_forward_shadow_pilot_audit_energy_forward_shadow_pilot_anthropic_combo_t00_20260313T024916Z_v1.json`
  - result:
    - `pass`
- online pilot:
  - run label:
    - `energy_forward_online_anthropic_combo_t00_20260313T025349Z`
  - audit:
    - `results/analysis/energy_forward_online_pilot_audit_energy_forward_online_anthropic_combo_t00_20260313T025349Z_v1.json`
  - result:
    - `pass`
  - exact replay:
    - `6/6`
  - energy policy decisions:
    - `prefer_pattern = 2`
    - `prefer_baseline = 4`
    - `tie = 0`

## Main batch
- run label:
  - `energy_forward_main_anthropic_combo_t00_20260313T025728Z`
- historical exact-replay audit reference (not shipped in the current review surface):
  - `results/analysis/energy_forward_main_batch_audit_energy_forward_main_anthropic_combo_t00_20260313T025728Z_v1.json`
- status:
  - `pass`
- exact replay:
  - `48/48`
- energy policy decisions:
  - `prefer_pattern = 16`
  - `prefer_baseline = 32`
  - `tie = 0`

## Per-scenario route choice
- `S_FORWARD_STABLE_01`
  - `branch_conditional = 8/8`
  - `conditional_branch = 8/8`
  - `DeltaU_online mean = 0.21218292997418542`
  - `q_z mean = -0.5029068673243564`
  - `c_z mean = 0.9272727272727272`
- `S_FORWARD_CONTEXT_DRIFT_01`
  - `baseline = 16/16`
  - `DeltaU_online mean = -10.652022240495288`
  - `q_z mean = -12.66768084462694`
  - `c_z mean = -8.636363636363637`
- `S_FORWARD_DRIFT_RETURN_RECOVERY_01`
  - `baseline = 16/16`
  - `DeltaU_online mean = -8.044621808776794`
  - `q_z mean = 0.6198472915373215`
  - `c_z mean = -16.70909090909091`

## Outcome metrics
- baseline arm:
  - `misinterpretation_rate = 0.0`
  - `trace_completeness = 1.0`
  - `update_consistency = 1.0`
  - `internal_coherence_error_rate = 0.0`
  - `self_contradiction_rate = 0.0`
  - `rework_cost_tokens = 0.0`
- energy arm:
  - `misinterpretation_rate = 0.0`
  - `trace_completeness = 1.0`
  - `update_consistency = 1.0`
  - `internal_coherence_error_rate = 0.0`
  - `self_contradiction_rate = 0.0`
  - `rework_cost_tokens = 0.0`

## Watch point
- `c_z_dominant_count = 32/48`
- `|c_z_frozen| > 3` on `32/48` rows
- interpretation:
  - the first `combo` opening is operationally stable on Anthropic for the branch-adjacent pair
  - stable remains route-stable for both directions
  - context-drift and recovery remain strongly negative and cost-side dominated
  - this is still boundary mapping, not an improvement claim
  - the remaining six combo directions are still unopened

## Current package read
- This memo is retained in the current review surface as a bounded two-direction Anthropic combo boundary read.
- It supports the closed package conclusion that the tested Anthropic combo opening is operationally stable while remaining boundary-facing rather than improvement-facing.
