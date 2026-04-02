# Energy Forward Main Batch Results

## Status
- Date: 2026-03-12
- Scope: first covered-slice main forward batch
- Not a manuscript claim memo

## Run
- run label:
  - `energy_forward_main_anthropic_t03_20260312T095235Z`
- provider:
  - `anthropic`
- model:
  - `claude-sonnet-4-20250514`
- dataset_family:
  - `stageb`
- temperature:
  - `0.3`
- pattern:
  - `branch`
- repetitions:
  - `8`
- pair count:
  - `24`

## Artifacts
- raw payload:
  - historical execution file not retained in the current review surface:
    `results/energy_forward_main_20260312T095235Z/raw/anthropic/mst_energy_forward_runs_energy_forward_main_anthropic_t03_20260312T095235Z_20260312T100547Z.json`
- decision context:
  - historical execution file not retained in the current review surface:
    `results/energy_forward_main_20260312T095235Z/decision_context_v2/anthropic/decision_context_v2_energy_forward_main_anthropic_t03_20260312T095235Z_20260312T095236Z.jsonl`
- historical frozen-bundle reference (not shipped in the current review surface):
  - `results/analysis/forward_coverage_bundle_stagea_anthropic_t03_branch_v1_2026-03-12.json`
- historical exact-replay audit reference (not shipped in the current review surface):
  - `results/analysis/energy_forward_main_batch_audit_energy_forward_main_anthropic_t03_20260312T095235Z_v1.json`
  - `results/analysis/energy_forward_main_batch_audit_energy_forward_main_anthropic_t03_20260312T095235Z_v1.md`

## Operational outcome
- status:
  - `pass`
- exact replay:
  - `24/24` exact match
- energy policy decisions:
  - `prefer_pattern = 8`
  - `prefer_baseline = 16`
  - `tie = 0`

## Per-scenario route choice
- `S_FORWARD_STABLE_01`
  - `branch = 8/8`
  - `DeltaU_online mean = 0.3608342043101977`
  - `q_z mean = -0.22665021276623437`
  - `c_z mean = 0.9483186213866297`
- `S_FORWARD_CONTEXT_DRIFT_01`
  - `baseline = 8/8`
  - `DeltaU_online mean = -8.035483817387892`
  - `q_z mean = -7.0549334511492034`
  - `c_z mean = -9.016034183626578`
- `S_FORWARD_DRIFT_RETURN_RECOVERY_01`
  - `baseline = 8/8`
  - `DeltaU_online mean = -8.783602760339493`
  - `q_z mean = -0.04433286638712136`
  - `c_z mean = -17.522872654291863`

## Replay and watch point
- `c_z_dominant_count = 24/24`
- `|c_z_frozen| > 3` on `16/24` rows
- interpretation:
  - replay integrity is no longer the issue
  - the remaining watch point is cost-side dominance and forward extrapolation

## Outcome metrics in this batch
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

## Reading
- The first covered-slice main forward batch completed successfully.
- The frozen policy executed deterministically and replayed exactly.
- However, this batch still does not support a forward gain claim because realized outcome metrics were clean for both arms across all 24 pairs.
- The correct interpretation is:
  - operational proceed on the covered slice succeeded
  - evidence for improvement remains non-demonstrative
  - `c_z` dominance must be reported as the main transfer-boundary watch point
