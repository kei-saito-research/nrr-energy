# Energy Dynamics Mechanism Skeleton External Review Decision Memo v1

## Status
- Date: 2026-03-17
- Type: external review decision memo
- Scope: record the assistant-side evaluation after one independent Codex review and one Claude review on the first `Dynamics` mechanism skeleton
- Review target:
  - internal review target: `energy_dynamics_mechanism_skeleton_candidate_v1_2026-03-17.md`
- Not a run authorization memo
- Not a manuscript claim memo

## External Review Results
- independent Codex review:
  - `adopt`
  - role-consistent and evidence-faithful
  - non-blocking clarification points only:
    - mark `Repeated-Starter Attractor` as a side-topic-family local motif
    - mark the stage-7.3 risk order as the current branch aggregate read

- Claude review:
  - `adopt`
  - carry-forward from `Policy v2` is complete
  - all hold / break motifs have keyword support in the background materials
  - one non-blocking clarification point:
    - make the `local_relation_block` transition condition explicit inside the relation-preservation motif

## Assistant-Side Evaluation
- decision:
  - `adopt`
- reason:
  - both reviews support the structure and ask only for small clarifications that tighten the mapping from policy vocabulary to mechanism description without changing scope

## Adopted Clarifications Into `v2`
1. `local_relation_block`
- make explicit that this state holds when an `unresolved_relation` remains active and the immediate next useful move cannot be produced without deciding it

2. `Repeated-Starter Attractor`
- label it as a side-topic-family local motif rather than a core shared later-horizon motif

3. stage 7.3 risk order
- label it as the current branch aggregate read rather than a universal ordering

## Resulting Read
- after these clarifications, the current `Dynamics` skeleton is stable enough to serve as the working mechanism vocabulary for:
  - `Guarantee` claim-schema drafting
  - later `Policy-Verification` metric freeze

## Updated Artifact
- revised candidate:
  - internal revised candidate: `energy_dynamics_mechanism_skeleton_candidate_v2_2026-03-17.md`

## Next Practical Read
1. use `Dynamics v2` as the current mechanism skeleton
2. keep the current `Guarantee` schema draft aligned to `v2`
3. next freeze artifact should move to `Policy-Verification` provider / family / metric scoping

## Primary References
- `energy_dynamics_mechanism_skeleton_candidate_v1_2026-03-17.md`
- `energy_dynamics_mechanism_skeleton_candidate_v2_2026-03-17.md`
- `energy_dynamics_mechanism_skeleton_review_brief_v1_2026-03-17.md`
