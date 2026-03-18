# Energy Priority-Resolution Horizon Stability Family Synthesis Memo v1

## Status
- Date: 2026-03-17
- Type: family synthesis memo
- Scope: close the `priority-resolution horizon stability` family as a measured two-provider package unit
- Depends on:
  - [energy_priority_resolution_horizon_stability_two_provider_read_memo_v1_2026-03-17.md](energy_priority_resolution_horizon_stability_two_provider_read_memo_v1_2026-03-17.md)
- Not a manuscript claim memo

## 1. What This Family Asked
After an already-supported first side-topic switch, how many later assistant checkpoints remain stable before repeatable degradation appears?

Fixed checkpoints:
- `turn7`
- `turn9`
- `turn11`

Fixed metric family:
- `chosen_side_direction_progress_present`
- `user_detail_use_present`
- `unresolved_relation_preserved_or_narrowly_checked`
- `suspended_main_reference_absent`
- `starter_question_repeat_absent`

## 2. What Is Supported
Supported on the current two-provider read:
- the first side-topic switch can remain stable for at least one later checkpoint
- suspended-main quarantine is strong
  - both providers keep `suspended_main_reference_absent = 12/12` at all checkpoints
- later-horizon degradation is real and template-dependent
- unresolved-relation commitment is a shared later-horizon failure mode
  - especially clear for `C_incident_response` at `turn9` on both providers

## 3. What Is Not Supported
Not supported:
- one universal degradation depth across templates
- one universal failure mode across templates
- a claim that later-horizon degradation is mainly about reviving the suspended main objective
- a claim that prompt-layer control alone gives stable turn-11 behavior across providers

## 4. Provider Read
Shared read:
- `C` is the cleanest shared failure surface
  - both providers fail first at `turn9`
  - both do so by prematurely committing the unresolved ordering relation

Provider difference:
- `A`
  - Gemini is mixed at `turn7` and clean at `turn9`
  - Anthropic is clean through `turn9`
  - both fail at `turn11`
- `B`
  - Gemini holds through `turn9` and is mixed at `turn11`
  - Anthropic fails first at `turn9`

## 5. Closure Read
This family is now closed enough for package use.

Current honest closure:
- prompt-layer priority resolution can preserve the active-vs-suspended boundary across later turns
- but later followthrough remains conditional because unresolved-relation handling degrades before suspended-main quarantine does
- the degradation horizon depends on template and provider

## 6. Next Rule
Do not reopen this family with more wording variants or rescue ladders.

If work continues from here:
1. package this family into branch synthesis / manuscript-facing boundary language
2. move to a different family only if it asks a genuinely different question
