# Energy Priority-Resolution Horizon Stability Two-Provider Read Memo v1

## Status
- Date: 2026-03-17
- Type: two-provider read memo
- Scope: record the first same-family two-provider read after repaired Gemini scoring and frozen Anthropic replication
- Depends on:
  - internal Gemini scored-read memo: `energy_priority_resolution_horizon_stability_gemini_scored_read_memo_v2_2026-03-17.md`
  - internal Anthropic scored-read memo: `energy_priority_resolution_horizon_stability_anthropic_scored_read_memo_v1_2026-03-17.md`
- Not a manuscript claim memo

## 1. Shared Holds
Both providers show:
- `suspended_main_reference_absent = 12/12` at all checkpoints
- clean `turn7` stability for `C_incident_response`
- degradation by later checkpoints rather than immediate reactivation of the suspended main objective

## 2. Shared Failure Surface
Both providers show unresolved-relation collapse as a real later-horizon failure mode.

- `C_incident_response`
  - Gemini:
    - first failure at `turn9`
  - Anthropic:
    - first failure at `turn9`
  - shared mode:
    - unsupported ordering commitment between `impact` and `root cause`

## 3. Provider Difference
The providers diverge on where the other templates first fail.

- `A_trip_planning`
  - Gemini:
    - `turn7 = 2/4`
    - `turn9 = 4/4`
    - `turn11 = 0/4`
  - Anthropic:
    - `turn7 = 4/4`
    - `turn9 = 4/4`
    - `turn11 = 0/4`
  - read:
    - both providers fail by `turn11`, but Anthropic is cleaner earlier

- `B_hiring_packet`
  - Gemini:
    - `turn7 = 4/4`
    - `turn9 = 4/4`
    - `turn11 = 2/4`
  - Anthropic:
    - `turn7 = 4/4`
    - `turn9 = 0/4`
    - `turn11 = 0/4`
  - read:
    - Anthropic commits the unresolved ordering earlier and more uniformly than Gemini

## 4. Current Honest Read
This family now has a real two-provider read.

Supported:
- the first side-topic switch can remain stable for at least one later checkpoint
- later-horizon degradation is not dominated by suspended-main reactivation
- unresolved-relation commitment is a genuine later-horizon failure mode, not a provider-local accident

Not supported:
- one provider-balanced universal degradation depth across templates
- a single uniform failure mode for all templates

## 5. Closure Read
The family is now much closer to closure as a measured branch.

- shared provider result:
  - later-horizon stability is conditional and template-dependent
- shared provider residual:
  - unresolved-relation preservation weakens before suspended-main quarantine does
