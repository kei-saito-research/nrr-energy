# Energy Policy-Verification Priority-Resolution Baseline vs Energy-Policy Comparison Memo v1

## Status
- Date: 2026-03-17
- Type: pilot comparison memo
- Scope: compare baseline and Energy-policy on the frozen early ambiguity-turn `Policy-Verification` pilot under matched provider slices
- Depends on:
  - [energy_policy_verification_priority_resolution_run_annotation_anthropic_baseline_v1_2026-03-17.csv](energy_policy_verification_priority_resolution_run_annotation_anthropic_baseline_v1_2026-03-17.csv)
  - [energy_policy_verification_priority_resolution_run_annotation_anthropic_energy_policy_v1_2026-03-17.csv](energy_policy_verification_priority_resolution_run_annotation_anthropic_energy_policy_v1_2026-03-17.csv)
  - [energy_policy_verification_priority_resolution_run_annotation_gemini_baseline_v1_2026-03-17.csv](energy_policy_verification_priority_resolution_run_annotation_gemini_baseline_v1_2026-03-17.csv)
  - [energy_policy_verification_priority_resolution_run_annotation_gemini_energy_policy_v1_2026-03-17.csv](energy_policy_verification_priority_resolution_run_annotation_gemini_energy_policy_v1_2026-03-17.csv)
  - internal design candidate: `energy_policy_verification_pilot_design_candidate_v2_2026-03-17.md`
  - internal run-authorization candidate: `energy_policy_verification_pilot_run_authorization_candidate_v2_2026-03-17.md`
- Not a manuscript claim memo

## 1. Run Executed
Authorized output directories:
- Anthropic baseline:
  - [priority_resolution_live_probe_20260317T090656Z](../priority_resolution_live_probe_20260317T090656Z)
- Anthropic Energy-policy:
  - [priority_resolution_live_probe_20260317T091051Z](../priority_resolution_live_probe_20260317T091051Z)
- Gemini baseline:
  - [priority_resolution_live_probe_20260317T091225Z](../priority_resolution_live_probe_20260317T091225Z)
- Gemini Energy-policy:
  - [priority_resolution_live_probe_20260317T091309Z](../priority_resolution_live_probe_20260317T091309Z)

Matched run conditions held fixed inside each provider slice:
- temperature: `0.0`
- reps: `8`
- templates:
  - `A_trip_planning`
  - `B_hiring_packet`
  - `C_incident_response`
- annotation fields:
  - `resolution_attempt_present`
  - `unilateral_commit_absent`
  - `appropriate`

Provider/model/input freeze:
- Anthropic:
  - model: `claude-sonnet-4-6`
  - input csv: `energy_priority_resolution_run_input_v2_2026-03-17.csv`
- Gemini:
  - model: `gemini-2.0-flash`
  - input csv: `energy_priority_resolution_run_input_gemini_v1_2026-03-16.csv`

Authorized prompt provenance held:
- baseline prompt sha:
  - `68175a85868e30e9c1f60f1a7b00b768508a5738b4040f3ce0f0f3c829320563`
- Energy-policy prompt sha:
  - `e8fe0fd2eae272add18b19d752378be6ba1ae109af01eaa6cd233ddea51f5083`

Operational note:
- the earlier sandbox-blocked partial directory was archived under:
  - `results/archive/2026-03-17_aborted_sandbox_pre_escalation`
- it is not part of the authorized pilot readout

## 2. In Scope / Out of Scope
In scope:
- whether the frozen Energy policy improves non-unilateral priority resolution relative to baseline on the frozen early ambiguity-turn surface
- whether that read stays explicit by provider before any pooled summary
- which baseline failure modes remain visible under the frozen 3-template surface

Out of scope:
- downstream acceptance
- side-topic commitment
- later-horizon followthrough
- overall task quality
- any provider-universal claim outside this frozen pilot

## 3. Provider Slice: Anthropic

| arm | `resolution_attempt_present = 1` | `unilateral_commit_absent = 1` | `appropriate = 1` |
|---|---:|---:|---:|
| Anthropic baseline | 0 / 24 | 8 / 24 | 0 / 24 |
| Anthropic Energy-policy | 24 / 24 | 24 / 24 | 24 / 24 |
| delta (`Energy-policy - baseline`) | +24 | +16 | +24 |

### Anthropic Per-Template

| template_id | baseline `appropriate = 1` | Energy-policy `appropriate = 1` | delta |
|---|---:|---:|---:|
| `A_trip_planning` | 0 / 8 | 8 / 8 | +8 |
| `B_hiring_packet` | 0 / 8 | 8 / 8 | +8 |
| `C_incident_response` | 0 / 8 | 8 / 8 | +8 |

Anthropic baseline failure split:
- `8 / 24`:
  - no resolution attempt, but no prohibited unilateral commitment either
- `16 / 24`:
  - unilateral/content-before-resolution behavior

Anthropic behavioral read:
- `A_trip_planning` asked for more details across both tracks without resolving immediate priority
- `B_hiring_packet` moved into concrete hiring-packet and onboarding content before resolution
- `C_incident_response` moved into incident-response content before resolution
- Anthropic Energy-policy converted all three templates to explicit or revisable user-choice-preserving priority resolution

## 4. Provider Slice: Gemini

| arm | `resolution_attempt_present = 1` | `unilateral_commit_absent = 1` | `appropriate = 1` |
|---|---:|---:|---:|
| Gemini baseline | 0 / 24 | 8 / 24 | 0 / 24 |
| Gemini Energy-policy | 24 / 24 | 24 / 24 | 24 / 24 |
| delta (`Energy-policy - baseline`) | +24 | +16 | +24 |

### Gemini Per-Template

| template_id | baseline `appropriate = 1` | Energy-policy `appropriate = 1` | delta |
|---|---:|---:|---:|
| `A_trip_planning` | 0 / 8 | 8 / 8 | +8 |
| `B_hiring_packet` | 0 / 8 | 8 / 8 | +8 |
| `C_incident_response` | 0 / 8 | 8 / 8 | +8 |

Gemini baseline failure split:
- `8 / 24`:
  - no resolution attempt, but no prohibited unilateral commitment either
- `16 / 24`:
  - unilateral/content-before-resolution behavior

Gemini behavioral read:
- `A_trip_planning` asked for more details across both tracks without resolving immediate priority
- `B_hiring_packet` announced a fixed order and began content work before user acceptance
- `C_incident_response` fixed the immediate focus and collapsed both topics into content work
- Gemini Energy-policy converted all three templates to short explicit choice questions

## 5. Pooled Totals
Provider slices above are the primary read.
Pooled totals are shown only after the slice-specific results.

| arm | `resolution_attempt_present = 1` | `unilateral_commit_absent = 1` | `appropriate = 1` |
|---|---:|---:|---:|
| pooled baseline | 0 / 48 | 16 / 48 | 0 / 48 |
| pooled Energy-policy | 48 / 48 | 48 / 48 | 48 / 48 |
| delta (`Energy-policy - baseline`) | +48 | +32 | +48 |

Pooled read boundary:
- the pooled table does not upgrade this pilot into a provider-universal claim
- it only summarizes that both frozen provider slices moved in the same direction under the tested conditions

## 6. Failure-Boundary Read
Visible baseline failure modes remained explicit in the primary table set:
1. `A_trip_planning`
- baseline often stayed in ambiguity without resolving immediate priority

2. `B_hiring_packet`
- baseline began concrete content work before the user accepted a direction

3. `C_incident_response`
- baseline collapsed into immediate content work on the main objective while also absorbing the side-topic request

Energy-policy boundary read under this frozen pilot:
- no failure rows appeared in either provider slice under the current three-field mini-spec
- that does not yet establish broader downstream or longer-horizon stability

## 7. Assistant-Side Read
- overall judgment:
  - `adopt`
- reason:
  - under the frozen pilot conditions, the Energy-policy arm improved non-unilateral priority resolution from `0 / 24` to `24 / 24` in both provider slices without any visible provider divergence on this narrow surface
- current best read:
  - the first `Policy-Verification` pilot executed cleanly and preserved the intended failure boundary: baseline failures stayed visible, and the frozen Energy policy resolved the ambiguity turn without unilateral commitment in all tested rows
