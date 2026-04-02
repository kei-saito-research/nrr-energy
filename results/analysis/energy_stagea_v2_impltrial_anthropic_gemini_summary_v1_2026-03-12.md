# Energy Stage A v2 Implementation Trial Summary

## Status
- Type: implementation-trial summary memo
- Date: 2026-03-12
- Scope: routed live Stage A freeze-gate trials using `decision_context_v2` plus `observable_extractor_v2_compact_grounding_2026-03-12`
- Providers covered here: Anthropic, Gemini
- Not yet a manuscript claim

## Result

Anthropic and Gemini both froze successfully on the implementation-gated live path for both routed conditions:

- `stable`
- `context-drift`

## Anthropic

### Stable

- Run label: `energy_route_probe_live_impltrial_stable_anthropic_20260312T071752Z`
- Status: `frozen`
- Audit:
  - [energy_stagea_bundle_input_audit_energy_route_probe_live_impltrial_stable_anthropic_20260312T071752Z_v1.md](energy_stagea_bundle_input_audit_energy_route_probe_live_impltrial_stable_anthropic_20260312T071752Z_v1.md)
- Freeze status:
  - [energy_stagea_freeze_gate_energy_route_probe_live_impltrial_stable_anthropic_20260312T071752Z_v1.json](energy_stagea_freeze_gate_energy_route_probe_live_impltrial_stable_anthropic_20260312T071752Z_v1.json)
- Bundle:
  - [calibration_bundle_stagea_energy_route_probe_live_impltrial_stable_anthropic_20260312T071752Z_v1.json](calibration_bundle_stagea_energy_route_probe_live_impltrial_stable_anthropic_20260312T071752Z_v1.json)
- Key moments:
  - `q_mu_cal = 0.9977272727272728`
  - `q_sd_cal = 0.0029340782925813417`
  - `c_mu_cal = -801.875`
  - `c_sd_cal = 9.102712507818755`

### Context-drift

- Run label: `energy_route_probe_live_impltrial_context_drift_anthropic_20260312T073229Z`
- Status: `frozen`
- Audit:
  - [energy_stagea_bundle_input_audit_energy_route_probe_live_impltrial_context_drift_anthropic_20260312T073229Z_v1.md](energy_stagea_bundle_input_audit_energy_route_probe_live_impltrial_context_drift_anthropic_20260312T073229Z_v1.md)
- Freeze status:
  - [energy_stagea_freeze_gate_energy_route_probe_live_impltrial_context_drift_anthropic_20260312T073229Z_v1.json](energy_stagea_freeze_gate_energy_route_probe_live_impltrial_context_drift_anthropic_20260312T073229Z_v1.json)
- Bundle:
  - [calibration_bundle_stagea_energy_route_probe_live_impltrial_context_drift_anthropic_20260312T073229Z_v1.json](calibration_bundle_stagea_energy_route_probe_live_impltrial_context_drift_anthropic_20260312T073229Z_v1.json)
- Key moments:
  - `q_mu_cal = 0.9732878427747564`
  - `q_sd_cal = 0.006914053534111399`
  - `c_mu_cal = -853.375`
  - `c_sd_cal = 4.794202227691277`

## Gemini

### Stable

- Run label: `energy_route_probe_live_impltrial_stable_gemini_20260312T074421Z`
- Status: `frozen`
- Audit:
  - [energy_stagea_bundle_input_audit_energy_route_probe_live_impltrial_stable_gemini_20260312T074421Z_v1.md](energy_stagea_bundle_input_audit_energy_route_probe_live_impltrial_stable_gemini_20260312T074421Z_v1.md)
- Freeze status:
  - [energy_stagea_freeze_gate_energy_route_probe_live_impltrial_stable_gemini_20260312T074421Z_v1.json](energy_stagea_freeze_gate_energy_route_probe_live_impltrial_stable_gemini_20260312T074421Z_v1.json)
- Bundle:
  - [calibration_bundle_stagea_energy_route_probe_live_impltrial_stable_gemini_20260312T074421Z_v1.json](calibration_bundle_stagea_energy_route_probe_live_impltrial_stable_gemini_20260312T074421Z_v1.json)
- Key moments:
  - `q_mu_cal = 0.9589688552188552`
  - `q_sd_cal = 0.011620381040875967`
  - `c_mu_cal = -915.375`
  - `c_sd_cal = 8.290619699395215`

### Context-drift

- Run label: `energy_route_probe_live_impltrial_context_drift_gemini_20260312T074741Z`
- Status: `frozen`
- Audit:
  - [energy_stagea_bundle_input_audit_energy_route_probe_live_impltrial_context_drift_gemini_20260312T074741Z_v1.md](energy_stagea_bundle_input_audit_energy_route_probe_live_impltrial_context_drift_gemini_20260312T074741Z_v1.md)
- Freeze status:
  - [energy_stagea_freeze_gate_energy_route_probe_live_impltrial_context_drift_gemini_20260312T074741Z_v1.json](energy_stagea_freeze_gate_energy_route_probe_live_impltrial_context_drift_gemini_20260312T074741Z_v1.json)
- Bundle:
  - [calibration_bundle_stagea_energy_route_probe_live_impltrial_context_drift_gemini_20260312T074741Z_v1.json](calibration_bundle_stagea_energy_route_probe_live_impltrial_context_drift_gemini_20260312T074741Z_v1.json)
- Key moments:
  - `q_mu_cal = 0.9770104895104895`
  - `q_sd_cal = 0.003525641025641013`
  - `c_mu_cal = -869.5`
  - `c_sd_cal = 4.5`

## Short interpretation

- The original routed Stage A blocker remains resolved at the implementation-trial level on both providers.
- On the current `decision_context_v2 + compact-grounding` path, live pre-route emission, ingest, audit, and freeze wiring all worked for Anthropic and Gemini.
- All four live routed corpora produced `q_sd_cal > 0` and reached `status=frozen`.
- This is still an implementation-gated trial result, not a final freeze or manuscript-facing claim.
