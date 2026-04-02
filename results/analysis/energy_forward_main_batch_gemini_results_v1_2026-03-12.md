# Energy Forward Main Batch Results (Gemini)

## Status
- Date: 2026-03-12
- Scope: covered-slice Gemini main forward batch
- Not a manuscript claim memo

## Run
- run label:
  - `energy_forward_main_gemini_t03_20260312T130712Z`
- provider:
  - `gemini`
- model:
  - `gemini-2.0-flash`
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
    `results/energy_forward_main_20260312T130712Z/raw/gemini/mst_energy_forward_runs_energy_forward_main_gemini_t03_20260312T130712Z_20260312T131505Z.json`
- decision context:
  - historical execution file not retained in the current review surface:
    `results/energy_forward_main_20260312T130712Z/decision_context_v2/gemini/decision_context_v2_energy_forward_main_gemini_t03_20260312T130712Z_20260312T130712Z.jsonl`
- historical frozen-bundle reference (not shipped in the current review surface):
  - `results/analysis/forward_coverage_bundle_stagea_gemini_t03_branch_v1_2026-03-12.json`
- historical exact-replay audit reference (not shipped in the current review surface):
  - `results/analysis/energy_forward_main_batch_audit_energy_forward_main_gemini_t03_20260312T130712Z_v1.json`
  - `results/analysis/energy_forward_main_batch_audit_energy_forward_main_gemini_t03_20260312T130712Z_v1.md`

## Operational outcome
- status:
  - `pass`
- exact replay:
  - `24/24` exact match
- energy policy decisions:
  - `prefer_pattern = 3`
  - `prefer_baseline = 21`
  - `tie = 0`

## Per-scenario route choice
- `S_FORWARD_STABLE_01`
  - `branch = 3/8`
  - `baseline = 5/8`
  - `DeltaU_online mean = -3.6373527354310218`
  - `q_z mean = -6.694120170945593`
  - `c_z mean = -0.5805852999164512`
- `S_FORWARD_CONTEXT_DRIFT_01`
  - `baseline = 8/8`
  - `DeltaU_online mean = -7.8563523388928065`
  - `q_z mean = -4.337254169465837`
  - `c_z mean = -11.375450508319776`
- `S_FORWARD_DRIFT_RETURN_RECOVERY_01`
  - `baseline = 8/8`
  - `DeltaU_online mean = -16.410810478418064`
  - `q_z mean = -2.99813537757796`
  - `c_z mean = -29.82348557925817`

## Replay and watch point
- `c_z_dominant_count = 17/24`
- `|c_z_frozen| > 3` on `16/24` rows
- interpretation:
  - replay integrity is not the issue
  - context-drift and recovery remain cost-side dominated
  - the new Gemini-specific watch point is route instability on `S_FORWARD_STABLE_01`, where the route flips are driven mainly by negative `q_z` shift rather than `c_z` extrapolation

## Outcome metrics in this batch
- baseline arm:
  - `misinterpretation_rate = 0.07916666666666668`
  - `trace_completeness = 0.9625`
  - `update_consistency = 0.9260416666666665`
  - `internal_coherence_error_rate = 0.0375`
  - `self_contradiction_rate = 0.004166666666666667`
  - `rework_cost_tokens = 179.79166666666666`
- energy arm:
  - `misinterpretation_rate = 0.07916666666666668`
  - `trace_completeness = 0.9625`
  - `update_consistency = 0.9260416666666665`
  - `internal_coherence_error_rate = 0.0375`
  - `self_contradiction_rate = 0.004166666666666667`
  - `rework_cost_tokens = 179.79166666666666`

## Reading
- The Gemini covered slice completed operationally and replayed exactly.
- However, unlike the Anthropic covered slice, the Gemini stable scenario is not route-stable under the current frozen bundle.
- The realized outcome metrics are also no longer clean, although baseline and Energy remain matched in this batch.
- The correct interpretation is:
  - this is forward boundary mapping, not a gain claim
  - current provider-balanced expansion is not yet support for a manuscript-facing improvement claim
  - the next axis decision should be reviewed with the Gemini stable-slice instability and the recovery-side cost tail in view
