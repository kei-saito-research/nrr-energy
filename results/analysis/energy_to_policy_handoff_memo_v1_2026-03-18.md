# Energy to Policy Handoff Memo v1

## Status
- Date: 2026-03-18
- Type: downstream handoff memo
- Scope: give the smallest honest handoff surface for carrying the current `Energy` package into downstream `Policy`, `Dynamics`, `Policy-Verification`, and `Guarantee` work without reopening `Energy`
- Depends on:
  - `energy_to_guarantee_program_design_brief_v1_2026-03-17.md` (root-workspace planning note; not part of the first public repo bundle)
  - [energy_manuscript_sufficiency_extension_need_external_review_decision_memo_v1_2026-03-18.md](energy_manuscript_sufficiency_extension_need_external_review_decision_memo_v1_2026-03-18.md)
  - [energy_priority_resolution_package_map_v1_2026-03-18.md](energy_priority_resolution_package_map_v1_2026-03-18.md)
  - [energy_priority_resolution_branch_handoff_v3_2026-03-18.md](energy_priority_resolution_branch_handoff_v3_2026-03-18.md)
  - [energy_dynamics_mechanism_skeleton_external_review_decision_memo_v1_2026-03-17.md](energy_dynamics_mechanism_skeleton_external_review_decision_memo_v1_2026-03-17.md)
  - [energy_guarantee_claim_schema_external_review_decision_memo_v1_2026-03-17.md](energy_guarantee_claim_schema_external_review_decision_memo_v1_2026-03-17.md)
- Not a manuscript claim memo

## 1. One-Line Current Read
- `Energy` is now package-ready and handoff-ready: no additional `Energy` extension is needed before downstream work continues.

## 2. What Is Fixed At The Energy Layer
- current manuscript/package:
  - [nrr-energy_manuscript_v8.tex](../../manuscript/current/nrr-energy_manuscript_v8.tex)
  - [nrr-energy_manuscript_v8.pdf](../../manuscript/current/nrr-energy_manuscript_v8.pdf)
  - [nrr-energy_manuscript_draft_v0_4_2026-03-18.md](../../manuscript/current/nrr-energy_manuscript_draft_v0_4_2026-03-18.md)
- current branch/package entry:
  - [energy_priority_resolution_package_map_v1_2026-03-18.md](energy_priority_resolution_package_map_v1_2026-03-18.md)
  - [energy_priority_resolution_branch_handoff_v3_2026-03-18.md](energy_priority_resolution_branch_handoff_v3_2026-03-18.md)
- current sufficiency decision:
  - [energy_manuscript_sufficiency_extension_need_external_review_decision_memo_v1_2026-03-18.md](energy_manuscript_sufficiency_extension_need_external_review_decision_memo_v1_2026-03-18.md)

## 3. What The Energy Package Honestly Supports
- calibration is fixed as a bounded measurement layer rather than a universal replacement rule
- narrow implementation-gated forward checks remain boundary-mapping evidence, not gain claims
- downstream dialogue-side carryforward is package-ready as a bounded read with:
  - ambiguity-turn gain
  - downstream preacceptance-burden gain
  - repaired first-step side-topic / quarantine gain on the tested provider pair
  - conditional later-horizon boundary
- side-topic carryforward remains bounded:
  - baseline is already fairly strong on `A_trip_planning` and `B_hiring_packet`
  - the main incremental first-step lift over baseline is concentrated in `C_incident_response`
  - later followthrough is conditional rather than uniformly stable

## 4. What Must Not Be Reopened As Energy Work
- do not treat broader `baseline vs Energy policy` forward validation as unfinished `Energy`
- do not reopen the closed `priority-resolution` family just to chase broader universality
- do not treat downstream-owned mechanism, policy, or guarantee work as a missing `Energy` extension

## 5. Ownership Boundary For The Next Layers
- `Policy`:
  - takes the `Energy` layer as the fixed measurement substrate and turns it into explicit minimal action rules
- `Dynamics`:
  - takes the current bounded behavior map and describes how it holds or degrades over turns
  - current anchor:
    - [energy_dynamics_mechanism_skeleton_external_review_decision_memo_v1_2026-03-17.md](energy_dynamics_mechanism_skeleton_external_review_decision_memo_v1_2026-03-17.md)
- `Policy-Verification`:
  - owns the broader `baseline vs Energy policy` forward validation step
  - this remains downstream-owned even though it is the first forward step after `Energy`
- `Guarantee`:
  - takes explicit provider/family/horizon/observability conditions and forms the bounded claim layer
  - current anchor:
    - [energy_guarantee_claim_schema_external_review_decision_memo_v1_2026-03-17.md](energy_guarantee_claim_schema_external_review_decision_memo_v1_2026-03-17.md)

## 6. Default Restart Rule
- if someone asks "what should I read first to continue from here?", start with:
  1. [energy_to_policy_handoff_memo_v1_2026-03-18.md](energy_to_policy_handoff_memo_v1_2026-03-18.md)
  2. `energy_to_guarantee_program_design_brief_v1_2026-03-17.md` in the root workspace planning notes
  3. [energy_priority_resolution_package_map_v1_2026-03-18.md](energy_priority_resolution_package_map_v1_2026-03-18.md)
- if no genuinely new `Energy`-owned contradiction appears, do not reopen `Energy`; move the work downstream
