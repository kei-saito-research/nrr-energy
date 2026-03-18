# Energy Policy-Verification Side-Topic Quarantine Baseline vs Revised Energy Policy Comparison Memo v2

## Status
- Date: 2026-03-18
- Type: line result memo
- Scope: compare baseline and revised Energy-policy arms on the repaired first-step side-topic / quarantine `Policy-Verification` pilot under the frozen mainline surface
- Depends on:
  - [energy_policy_verification_side_topic_quarantine_input_artifact_repair_memo_v1_2026-03-18.md](energy_policy_verification_side_topic_quarantine_input_artifact_repair_memo_v1_2026-03-18.md)
  - [energy_policy_verification_side_topic_quarantine_annotation_minispec_v1_2026-03-17.md](energy_policy_verification_side_topic_quarantine_annotation_minispec_v1_2026-03-17.md)
  - [energy_policy_verification_side_topic_quarantine_run_annotation_anthropic_baseline_v2_2026-03-18.csv](energy_policy_verification_side_topic_quarantine_run_annotation_anthropic_baseline_v2_2026-03-18.csv)
  - [energy_policy_verification_side_topic_quarantine_run_annotation_anthropic_revised_energy_policy_v2_2026-03-18.csv](energy_policy_verification_side_topic_quarantine_run_annotation_anthropic_revised_energy_policy_v2_2026-03-18.csv)
  - [energy_policy_verification_side_topic_quarantine_run_annotation_gemini_baseline_v2_2026-03-18.csv](energy_policy_verification_side_topic_quarantine_run_annotation_gemini_baseline_v2_2026-03-18.csv)
  - [energy_policy_verification_side_topic_quarantine_run_annotation_gemini_revised_energy_policy_v2_2026-03-18.csv](energy_policy_verification_side_topic_quarantine_run_annotation_gemini_revised_energy_policy_v2_2026-03-18.csv)
- Not a manuscript claim memo

## 1. Repair Boundary
This `v2` read supersedes the earlier malformed-input readout.

The logical scope is unchanged:
- first-step side-topic commitment / quarantine only
- `baseline vs revised Energy policy` only
- tested provider pair only
- frozen first-step metric family only

The repaired rerun changes only:
- the CSV serialization of comma-bearing handoff turns and acceptance turns

## 2. Run Executed
Anthropic baseline repaired output directory:
- [priority_resolution_side_topic_commitment_probe_20260317T212026Z](../priority_resolution_side_topic_commitment_probe_20260317T212026Z)

Anthropic revised Energy-policy repaired output directory:
- [priority_resolution_side_topic_commitment_probe_20260317T212123Z](../priority_resolution_side_topic_commitment_probe_20260317T212123Z)

Gemini baseline repaired output directory:
- [priority_resolution_side_topic_commitment_probe_20260317T212153Z](../priority_resolution_side_topic_commitment_probe_20260317T212153Z)

Gemini revised Energy-policy repaired output directory:
- [priority_resolution_side_topic_commitment_probe_20260317T212214Z](../priority_resolution_side_topic_commitment_probe_20260317T212214Z)

Shared run conditions:
- providers:
  - `anthropic` / `claude-sonnet-4-6`
  - `gemini` / `gemini-2.0-flash`
- temperature:
  - `0.0`
- reps:
  - `4`
- templates:
  - `A_trip_planning`
  - `B_hiring_packet`
  - `C_incident_response`
- acceptance variants:
  - `accept_side_first` only
- scored turn:
  - turn 5 only

Matched-condition rule held on the repaired rerun outputs for:
- provider/model freeze
- arm-label freeze
- `n_rows = 12`
- prompt source path freeze
- prompt SHA freeze

## 3. Provider-Sliced Aggregate Result
| provider | arm | `chosen_side_direction_workstart_present = 1` | `suspended_main_reference_absent = 1` | `main_direction_intrusion_absent = 1` | `appropriate = 1` |
|---|---|---:|---:|---:|---:|
| `anthropic` | baseline | 12 / 12 | 9 / 12 | 12 / 12 | 9 / 12 |
| `anthropic` | revised Energy policy | 12 / 12 | 12 / 12 | 12 / 12 | 12 / 12 |
| `gemini` | baseline | 8 / 12 | 12 / 12 | 12 / 12 | 8 / 12 |
| `gemini` | revised Energy policy | 12 / 12 | 12 / 12 | 12 / 12 | 12 / 12 |

## 4. Per-Template Result Within Provider
| provider | template_id | baseline `appropriate = 1` | revised Energy policy `appropriate = 1` | delta |
|---|---|---:|---:|---:|
| `anthropic` | `A_trip_planning` | 4 / 4 | 4 / 4 | 0 |
| `anthropic` | `B_hiring_packet` | 4 / 4 | 4 / 4 | 0 |
| `anthropic` | `C_incident_response` | 1 / 4 | 4 / 4 | +3 |
| `gemini` | `A_trip_planning` | 4 / 4 | 4 / 4 | 0 |
| `gemini` | `B_hiring_packet` | 4 / 4 | 4 / 4 | 0 |
| `gemini` | `C_incident_response` | 0 / 4 | 4 / 4 | +4 |

## 5. Pooled Totals After Provider Slices
| arm | `chosen_side_direction_workstart_present = 1` | `suspended_main_reference_absent = 1` | `main_direction_intrusion_absent = 1` | `appropriate = 1` |
|---|---:|---:|---:|---:|
| pooled baseline | 20 / 24 | 21 / 24 | 24 / 24 | 17 / 24 |
| pooled revised Energy policy | 24 / 24 | 24 / 24 | 24 / 24 | 24 / 24 |
| delta (`revised - baseline`) | +4 | +3 | 0 | +7 |

## 6. Failure-Boundary Read
Shared repaired read:
- both providers now correctly receive an explicit side-first acceptance at turn 4
- under that repaired episode, baseline is not a full failure condition on this surface
- the residuals concentrate in the `C_incident_response` template

Anthropic baseline residual:
- baseline already begins postmortem-format work on all `4 / 4` `C` rows
- but on `3 / 4` of those rows it verbally reopens the suspended incident-response plan by saying it can be revisited later

Gemini baseline residual:
- baseline cleanly switches on `A` and `B`
- but on `C` it acknowledges the postmortem switch without beginning useful postmortem work, leaving `chosen_side_direction_workstart_present = 0 / 4`

Revised Energy-policy read:
- the revised arm reaches `12 / 12` on all four scored fields for both providers
- the gain is therefore concentrated in the remaining `C` residuals rather than in a global rescue from total baseline failure

Current visible boundary under the repaired scope:
- this pilot supports a bounded first-step gain only
- baseline is already strong on several repaired rows, so the correct read is incremental improvement under the repaired accepted-side episode, not universal baseline collapse

## 7. Assistant-Side Read
- overall judgment:
  - `adopt`
- reason:
  - the repaired rerun restores the intended episode contract and yields a bounded, provider-sliced gain read on the frozen first-step carry metric
- current best read:
  - under the tested provider pair and repaired first-step side-topic surface, the revised Energy policy improves `appropriate` relative to baseline
  - the remaining baseline residuals are template-specific and concentrated in `C_incident_response`
  - this remains a first-step side-topic / quarantine read only and does not extend to later followthrough, provider universality, or overall downstream quality
