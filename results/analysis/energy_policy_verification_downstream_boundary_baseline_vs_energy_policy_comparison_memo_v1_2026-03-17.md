# Energy Policy-Verification Downstream Boundary Baseline vs Energy-Policy Comparison Memo v1

## Status
- Date: 2026-03-17
- Type: pilot comparison memo
- Scope: compare baseline and Energy-policy on the frozen downstream-boundary / preacceptance-burden `Policy-Verification` pilot under matched provider slices
- Depends on:
  - [energy_policy_verification_downstream_boundary_run_annotation_anthropic_baseline_v1_2026-03-17.csv](energy_policy_verification_downstream_boundary_run_annotation_anthropic_baseline_v1_2026-03-17.csv)
  - [energy_policy_verification_downstream_boundary_run_annotation_anthropic_energy_policy_v1_2026-03-17.csv](energy_policy_verification_downstream_boundary_run_annotation_anthropic_energy_policy_v1_2026-03-17.csv)
  - [energy_policy_verification_downstream_boundary_run_annotation_gemini_baseline_v1_2026-03-17.csv](energy_policy_verification_downstream_boundary_run_annotation_gemini_baseline_v1_2026-03-17.csv)
  - [energy_policy_verification_downstream_boundary_run_annotation_gemini_energy_policy_v1_2026-03-17.csv](energy_policy_verification_downstream_boundary_run_annotation_gemini_energy_policy_v1_2026-03-17.csv)
  - internal design candidate: `energy_policy_verification_downstream_boundary_design_candidate_v2_2026-03-17.md`
  - internal run-authorization candidate: `energy_policy_verification_downstream_boundary_run_authorization_candidate_v1_2026-03-17.md`
- Not a manuscript claim memo

## 1. Run Executed
Authorized output directories:
- Anthropic baseline:
  - [priority_resolution_downstream_acceptance_probe_20260317T105719Z](../priority_resolution_downstream_acceptance_probe_20260317T105719Z)
- Anthropic Energy-policy:
  - [priority_resolution_downstream_acceptance_probe_20260317T110240Z](../priority_resolution_downstream_acceptance_probe_20260317T110240Z)
- Gemini baseline:
  - [priority_resolution_downstream_acceptance_probe_20260317T110524Z](../priority_resolution_downstream_acceptance_probe_20260317T110524Z)
- Gemini Energy-policy:
  - [priority_resolution_downstream_acceptance_probe_20260317T110645Z](../priority_resolution_downstream_acceptance_probe_20260317T110645Z)

Matched run conditions held fixed inside each provider slice:
- temperature: `0.0`
- reps: `4` per acceptance variant
- templates:
  - `A_trip_planning`
  - `B_hiring_packet`
  - `C_incident_response`
- acceptance variants:
  - `accept_main_first`
  - `accept_side_first`
- annotation fields:
  - `accepted_direction_followthrough_present`
  - `rejected_direction_intrusion_absent`
  - `preacceptance_rework_burden_absent`
  - `appropriate`

Provider/model/input freeze:
- Anthropic:
  - model: `claude-sonnet-4-6`
  - input csv: `energy_priority_resolution_downstream_acceptance_run_input_v2_2026-03-17.csv`
- Gemini:
  - model: `gemini-2.0-flash`
  - input csv: `energy_priority_resolution_downstream_acceptance_run_input_gemini_v1_2026-03-17.csv`

Authorized prompt provenance held:
- baseline prompt sha:
  - `68175a85868e30e9c1f60f1a7b00b768508a5738b4040f3ce0f0f3c829320563`
- Energy-policy prompt sha:
  - `e8fe0fd2eae272add18b19d752378be6ba1ae109af01eaa6cd233ddea51f5083`

## 2. In Scope / Out of Scope
In scope:
- whether the frozen Energy policy reduces `preacceptance_rework_burden_absent` relative to baseline on the frozen downstream-acceptance surface
- whether that read stays explicit by provider before any pooled summary
- which provider-sensitive downstream residuals remain visible after burden removal

Out of scope:
- explicit suspended-objective quarantine
- later-horizon followthrough
- overall task quality
- any provider-universal downstream-quality claim outside this frozen pilot

## 3. Provider Slice: Anthropic

| arm | `accepted_direction_followthrough_present = 1` | `rejected_direction_intrusion_absent = 1` | `preacceptance_rework_burden_absent = 1` | `appropriate = 1` |
|---|---:|---:|---:|---:|
| Anthropic baseline | 24 / 24 | 24 / 24 | 0 / 24 | 0 / 24 |
| Anthropic Energy-policy | 24 / 24 | 24 / 24 | 24 / 24 | 24 / 24 |
| delta (`Energy-policy - baseline`) | +0 | +0 | +24 | +24 |

### Anthropic Per-Template

| template_id | baseline `accepted_direction_followthrough_present = 1` | Energy-policy `accepted_direction_followthrough_present = 1` | baseline `rejected_direction_intrusion_absent = 1` | Energy-policy `rejected_direction_intrusion_absent = 1` | baseline `preacceptance_rework_burden_absent = 1` | Energy-policy `preacceptance_rework_burden_absent = 1` | baseline `appropriate = 1` | Energy-policy `appropriate = 1` |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| `A_trip_planning` | 8 / 8 | 8 / 8 | 8 / 8 | 8 / 8 | 0 / 8 | 8 / 8 | 0 / 8 | 8 / 8 |
| `B_hiring_packet` | 8 / 8 | 8 / 8 | 8 / 8 | 8 / 8 | 0 / 8 | 8 / 8 | 0 / 8 | 8 / 8 |
| `C_incident_response` | 8 / 8 | 8 / 8 | 8 / 8 | 8 / 8 | 0 / 8 | 8 / 8 | 0 / 8 | 8 / 8 |

Anthropic baseline failure read:
- post-acceptance followthrough is already present on all rows
- rejected-direction intrusion is already absent on all rows
- the entire failure surface is preacceptance burden:
  - `A_trip_planning` asks for both trip-planning and restaurant details before acceptance
  - `B_hiring_packet` starts both hiring-packet and onboarding work before acceptance
  - `C_incident_response` starts both incident-response-plan and postmortem-format work before acceptance

Anthropic Energy-policy read:
- the same clean post-acceptance followthrough is preserved
- the preacceptance burden is removed on all rows

## 4. Provider Slice: Gemini

| arm | `accepted_direction_followthrough_present = 1` | `rejected_direction_intrusion_absent = 1` | `preacceptance_rework_burden_absent = 1` | `appropriate = 1` |
|---|---:|---:|---:|---:|
| Gemini baseline | 13 / 24 | 24 / 24 | 0 / 24 | 0 / 24 |
| Gemini Energy-policy | 10 / 24 | 24 / 24 | 24 / 24 | 10 / 24 |
| delta (`Energy-policy - baseline`) | -3 | +0 | +24 | +10 |

### Gemini Per-Template

| template_id | baseline `accepted_direction_followthrough_present = 1` | Energy-policy `accepted_direction_followthrough_present = 1` | baseline `rejected_direction_intrusion_absent = 1` | Energy-policy `rejected_direction_intrusion_absent = 1` | baseline `preacceptance_rework_burden_absent = 1` | Energy-policy `preacceptance_rework_burden_absent = 1` | baseline `appropriate = 1` | Energy-policy `appropriate = 1` |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| `A_trip_planning` | 8 / 8 | 4 / 8 | 8 / 8 | 8 / 8 | 0 / 8 | 8 / 8 | 0 / 8 | 4 / 8 |
| `B_hiring_packet` | 4 / 8 | 6 / 8 | 8 / 8 | 8 / 8 | 0 / 8 | 8 / 8 | 0 / 8 | 6 / 8 |
| `C_incident_response` | 1 / 8 | 0 / 8 | 8 / 8 | 8 / 8 | 0 / 8 | 8 / 8 | 0 / 8 | 0 / 8 |

Gemini baseline failure read:
- shared failure:
  - `preacceptance_rework_burden_absent = 0 / 24`
- additional residual:
  - accepted-direction followthrough is uneven even after user acceptance
  - `B_hiring_packet` main-accepted rows often only acknowledge the chosen direction
  - `C_incident_response` is weakest:
    - one row asks which incident-response aspect to start with
    - the other rows remain generic after acceptance

Gemini Energy-policy read:
- repaired:
  - `preacceptance_rework_burden_absent = 24 / 24`
- residual:
  - `accepted_direction_followthrough_present = 10 / 24`
  - `C_incident_response` remains fully generic at the first accepted-direction follow-up
  - `A_trip_planning` main-accepted rows can still acknowledge the chosen direction without beginning concrete work

## 5. Pooled Totals
Provider slices above are the primary read.
Pooled totals are shown only after the slice-specific results.

| arm | `accepted_direction_followthrough_present = 1` | `rejected_direction_intrusion_absent = 1` | `preacceptance_rework_burden_absent = 1` | `appropriate = 1` |
|---|---:|---:|---:|---:|
| pooled baseline | 37 / 48 | 48 / 48 | 0 / 48 | 0 / 48 |
| pooled Energy-policy | 34 / 48 | 48 / 48 | 48 / 48 | 34 / 48 |
| delta (`Energy-policy - baseline`) | -3 | +0 | +48 | +34 |

Pooled read boundary:
- the pooled table does not upgrade this pilot into a provider-universal downstream-quality claim
- it only summarizes that both provider slices remove preacceptance burden under the tested conditions

## 6. Failure-Boundary Read
Visible downstream residuals remained explicit in the primary table set:
1. shared carry-forward gain:
- `preacceptance_rework_burden_absent` improves from `0 / 24` to `24 / 24` in both provider slices

2. Anthropic read:
- burden removal and accepted-direction followthrough both stay clean under the frozen scope

3. Gemini read:
- burden removal is real and complete
- but the first accepted-direction follow-up remains provider-sensitive
- the weakest residual is `C_incident_response`, where the Energy-policy arm still acknowledges the accepted direction without beginning concrete work

Boundary that still holds:
- this pilot supports a bounded preacceptance-burden claim only
- it does not support:
  - explicit quarantine closure
  - later-horizon closure
  - provider-universal downstream handoff quality

## 7. Assistant-Side Read
- overall judgment:
  - `adopt`
- reason:
  - under the frozen downstream-boundary conditions, the Energy-policy arm removes preacceptance burden in both provider slices, while the provider-sensitive Gemini followthrough residual remains explicit rather than silently pooled away
- current best read:
  - the supported carry-forward gain is downstream preacceptance-burden removal under matched baseline vs Energy-policy conditions
  - the active boundary is also clearer now:
    - Anthropic is clean on this frozen surface
    - Gemini still shows first-follow-up genericness even after burden removal
