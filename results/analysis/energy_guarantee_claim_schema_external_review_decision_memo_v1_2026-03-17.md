# Energy Guarantee Claim Schema External Review Decision Memo v1

## Status
- Date: 2026-03-17
- Type: external review decision memo
- Scope: record the assistant-side evaluation after one independent Codex review and one Claude review on the first `Guarantee` claim schema
- Review target:
  - internal review target: `energy_guarantee_claim_schema_candidate_v1_2026-03-17.md`
- Not a run authorization memo
- Not a manuscript claim memo

## External Review Results
- independent Codex review:
  - `adopt`
  - schema is bounded and drift-resistant
  - non-blocking clarification points only:
    - state more plainly that claim schema is fixed first and `Policy-Verification` pilot is reverse-designed from it
    - distinguish mainline `baseline vs Energy policy` from local-line operator comparisons in `comparison_scope`

- Claude review:
  - `adopt`
  - schema is structurally clean
  - one non-blocking clarification point:
    - update dependency chain to `Dynamics v2`

## Assistant-Side Evaluation
- decision:
  - `adopt`
- reason:
  - both reviews support the schema itself and request only clarification edits that tighten the mainline/local-line separation and keep the dependency chain clean

## Adopted Clarifications Into `v2`
1. dependency update
- update the schema to depend on `Dynamics v2`

2. reverse-design wording
- make explicit that the claim schema is fixed first and later `Policy-Verification` design must target chosen claim-field values

3. comparison-scope split
- distinguish:
  - mainline guarantee comparison: `baseline vs Energy policy`
  - local supporting comparison: `baseline vs one named operator arm`

## Resulting Read
- after these clarifications, the guarantee schema is stable enough to serve as the constraint for the first `Policy-Verification` pilot-scope freeze
- no thresholds, success declarations, or result-contingent wording have been introduced

## Updated Artifact
- revised schema:
  - internal revised schema: `energy_guarantee_claim_schema_candidate_v2_2026-03-17.md`

## Next Practical Read
1. use `Guarantee schema v2` as the active constraint
2. freeze one narrow `Policy-Verification` pilot scope against that schema
3. keep downstream families outside the first pilot unless explicitly selected in the scope freeze

## Primary References
- `energy_guarantee_claim_schema_candidate_v1_2026-03-17.md`
- `energy_guarantee_claim_schema_candidate_v2_2026-03-17.md`
- `energy_guarantee_claim_schema_review_brief_v1_2026-03-17.md`
