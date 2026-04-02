# Energy Policy-Verification Side-Topic Quarantine Input Artifact Repair Memo v1

## Status
- Date: 2026-03-18
- Type: artifact-repair memo
- Scope: record the narrow repair required after external review found that the executed side-topic / quarantine pilot used malformed CSV serialization for comma-bearing turn texts
- Depends on:
  - [energy_policy_verification_side_topic_quarantine_run_input_v1_2026-03-17.csv](energy_policy_verification_side_topic_quarantine_run_input_v1_2026-03-17.csv)
  - [energy_policy_verification_side_topic_quarantine_run_input_gemini_v1_2026-03-17.csv](energy_policy_verification_side_topic_quarantine_run_input_gemini_v1_2026-03-17.csv)
- Not a manuscript claim memo

Current package role:
- the `v1` run-input CSVs are shipped as superseded provenance for the defect
- the `v2` run-input CSVs are shipped as the repaired execution inputs for the current bounded read

## 1. Problem
The `v1` run-input CSV artifacts serialize comma-bearing turn texts without CSV quoting.

As parsed by the actual runner:
- `fixed_turn3_handoff_text` is truncated before the comma
- `acceptance_turn` receives the remainder of the handoff question
- the intended acceptance utterance falls into an extra `null` column

This means the executed side-topic / quarantine readout cannot stand as the current bounded read under the frozen design.

## 2. Assistant-Side Evaluation
- decision:
  - `adopt`
- reason:
  - the blocker is artifact-serialization drift rather than a spec change, so the correct fix is to repair the input artifacts and rerun under the same logical episode content

## 3. Repaired Artifacts
Use the following repaired input artifacts for the rerun:
- [energy_policy_verification_side_topic_quarantine_run_input_v2_2026-03-18.csv](energy_policy_verification_side_topic_quarantine_run_input_v2_2026-03-18.csv)
- [energy_policy_verification_side_topic_quarantine_run_input_gemini_v2_2026-03-18.csv](energy_policy_verification_side_topic_quarantine_run_input_gemini_v2_2026-03-18.csv)

Repair boundary:
- logical row content is unchanged
- provider/model/temp freeze is unchanged
- prompt surfaces are unchanged
- only CSV quoting/serialization is repaired so the runner receives the intended turn-3 handoff and turn-4 acceptance fields

Superseded provenance note:
- the pre-repair `v1` input artifacts remain shipped only to document the defect boundary
- the repaired current read is anchored to the `v2` inputs above, not to the malformed `v1` inputs

## 4. Exact Next Step
1. point the four dedicated wrappers to the repaired `v2` input artifacts
2. rerun the four authorized wrappers
3. regenerate annotation tables and the comparison memo from the repaired outputs
4. treat the pre-repair readout artifacts as superseded for current review purposes
