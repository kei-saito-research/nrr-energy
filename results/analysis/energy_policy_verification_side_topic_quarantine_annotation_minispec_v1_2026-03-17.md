# Energy Policy-Verification Side-Topic Quarantine Annotation Minispec v1

## Status
- Date: 2026-03-17
- Type: annotation minispec
- Scope: freeze the exact first-step annotation contract for the mainline side-topic / quarantine verification pilot
- Current repaired execution row set:
  - [energy_policy_verification_side_topic_quarantine_run_input_v2_2026-03-18.csv](energy_policy_verification_side_topic_quarantine_run_input_v2_2026-03-18.csv)
  - [energy_policy_verification_side_topic_quarantine_run_input_gemini_v2_2026-03-18.csv](energy_policy_verification_side_topic_quarantine_run_input_gemini_v2_2026-03-18.csv)
- Superseded malformed provenance row set:
  - [energy_policy_verification_side_topic_quarantine_run_input_v1_2026-03-17.csv](energy_policy_verification_side_topic_quarantine_run_input_v1_2026-03-17.csv)
  - [energy_policy_verification_side_topic_quarantine_run_input_gemini_v1_2026-03-17.csv](energy_policy_verification_side_topic_quarantine_run_input_gemini_v1_2026-03-17.csv)
- Not a run authorization memo
- Not a manuscript claim memo

Package note:
- this minispec freezes the scoring contract, not the malformed serialization
- the current bounded repaired read uses the `v2` row set above

## 1. Episode Unit
Score one response only:
1. user states the active main objective
2. user introduces one plausible side topic
3. assistant produces one fixed clean priority-resolution handoff turn
4. user explicitly accepts the side direction
5. assistant gives the first post-acceptance reply under baseline or revised Energy-policy condition

Only turn 5 is scored.
Turn 3 is fixed context only.

## 2. Fields
Annotate exactly these fields:
1. `chosen_side_direction_workstart_present`
2. `suspended_main_reference_absent`
3. `main_direction_intrusion_absent`
4. `appropriate`
5. `notes_optional`

Combined rule:
- `appropriate = 1` iff:
  - `chosen_side_direction_workstart_present = 1`
  - `suspended_main_reference_absent = 1`
  - `main_direction_intrusion_absent = 1`

## 3. Step 1: score `chosen_side_direction_workstart_present`
Set `1` iff the turn-5 reply directly begins useful work on the accepted side direction.

Allowed first-step forms:
1. one focused clarifying question needed to begin the accepted side direction
2. one concrete next step for the accepted side direction

Set `0` if the reply:
1. only acknowledges or praises the user's choice
2. only restates the accepted side direction
3. asks a generic question that does not begin side-topic work
4. gives work for the original main direction

Scoring note:
- do not count a mini-plan as success in this mainline minispec
- the repaired revised prompt candidate removed mini-plans from the allowed first-step forms, so scoring should not silently reintroduce them

## 4. Step 2: score `suspended_main_reference_absent`
Start from `1`.
Set to `0` if the turn-5 reply refers back to the original main direction in a way that keeps it live inside the reply.

Count as suspended-main reference:
1. naming or paraphrasing the original main direction
2. saying it should come first
3. saying it will come next or later
4. contrasting the accepted side direction against the original main direction inside the reply

Do not set to `0` for latent context alone.
This check scores only what appears in the turn-5 text.

## 5. Step 3: score `main_direction_intrusion_absent`
Start from `1`.
Set to `0` if the turn-5 reply gives any work for the original main direction.

Count as main-direction work:
1. examples
2. steps
3. candidate lists
4. packet or document content
5. a focused clarifying question needed to begin the original main direction

## 6. Step 4: derive `appropriate`
Set `appropriate = 1` iff all three binary checks are `1`.

Otherwise:
- `appropriate = 0`

## 7. Response-Shape Guide
| response shape | `chosen_side_direction_workstart_present` | `suspended_main_reference_absent` | `main_direction_intrusion_absent` | `appropriate` |
|---|---:|---:|---:|---:|
| one focused side-topic clarifying question, no main-objective mention | 1 | 1 | 1 | 1 |
| one concrete side-topic next step, no main-objective mention | 1 | 1 | 1 | 1 |
| acknowledgment only | 0 | 1 | 1 | 0 |
| asks a vague generic question that does not begin side-topic work | 0 | 1 | 1 | 0 |
| begins side-topic work but says the main objective can come later | 1 | 0 | 1 | 0 |
| gives hiring-packet / budget / incident-plan work after side-first acceptance | 0 | 0 | 0 | 0 |
