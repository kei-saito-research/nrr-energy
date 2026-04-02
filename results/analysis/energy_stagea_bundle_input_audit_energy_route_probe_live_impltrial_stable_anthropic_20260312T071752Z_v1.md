# Energy Stage A Bundle Input Audit energy_route_probe_live_impltrial_stable_anthropic_20260312T071752Z

- Date: 2026-03-12
- Scope: audit the standardized live `stats/decision_context_v2` corpus to see whether it can freeze a Stage A calibration bundle
- Input glob: `decision_context_v2_energy_route_probe_live_impltrial_stable_anthropic_20260312T071752Z.jsonl`
- Condition metadata: `condition_metadata_stagea_energy_route_probe_live_impltrial_stable_anthropic_20260312T071752Z_subset_v1.csv`
- Tau summary: `../../stats/evidence/energy_e1_tau_summary_v1_1.csv`
- Extractor id: `observable_extractor_v2_compact_grounding_2026-03-12`

## Counts

- `rows_total = 8`
- `rows_valid = 8`
- `condition_keys_valid = 1`
- `condition_keys_bundle_usable = 1`
- `condition_keys_missing_metadata = 0`
- `condition_keys_missing_tau = 0`
- `condition_keys_insufficient_rows = 0`
- `condition_keys_q_sd_nonpositive = 0`
- `condition_keys_c_sd_nonpositive = 0`

## Condition Keys

| condition_key | valid_rows | dataset_family | pattern_or_combo_direction | bundle_usable | failure_code |
| --- | ---: | --- | --- | ---: | --- |
| S_STABLE_01|anthropic|claude-sonnet-4-20250514|0.3|S_STABLE_ROUTE_PROBE_MAIN_01|branch | 8 | stageb | branch | 1 |  |
