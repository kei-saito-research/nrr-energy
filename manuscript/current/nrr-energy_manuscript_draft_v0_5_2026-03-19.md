# NRR-Energy (Draft v0.5, 2026-03-19)

## Provisional Title
NRR-Energy: Calibration of Commit/Defer Utility Under Existing Paired Boundary Data

## Claim Boundary (This Draft)
- This draft reports **calibration and boundary behavior** of the Energy decision instrument under existing paired data.
- This draft also reports **narrow downstream boundary checks** that do not upgrade the paper to a prospective policy-efficacy claim.
- This draft does **not** claim prospective policy efficacy from new runs.
- A forward paired validation (`Baseline vs Energy policy`) is defined as next-step work.

Series Consistency Statement:
At this evidence state, unsupported interpretations are not injected; hypothesis-set expansion is evidence-gated; and unobserved possibilities remain explicitly unresolved.

Series Extensibility Statement:
NRR is a derivation-and-evaluation framework, not a closed recipe. The current operator/condition set is an evaluated set under tested conditions, not an exhaustive set.

Canonical Statement:
NRR does not replace standard LLM use. NRR optimizes when to commit and when to defer, under explicit conditions.

## Abstract (Draft)
This paper introduces an Energy-layer calibration procedure for commit/defer decision support using existing paired datasets from Boundary Stage B and ordered-combo runs. The method fixes utility construction and calibration-only thresholding before test-side evaluation. We define utility from quality improvement and rework-cost terms and evaluate two cost formulations: gross rework improvement and output-overhead-adjusted net cost. Under tested conditions, net-cost calibration expands decision coverage relative to gross-cost calibration, but this expansion is condition-sensitive. In Stage B, net-cost calibration increases coverage while also increasing disagreement against calibration-derived oracle labels; in ordered-combo data, net-cost calibration increases coverage without increasing overall disagreement. Sensitivity analyses identify non-effective regions concentrated in Gemini and in Stage B at higher temperature. Narrow implementation-gated forward checks also replay exactly on the tested covered slices while exposing a provider-specific transfer boundary: Anthropic remains route-stable on the tested slices, whereas Gemini loses stable-slice route stability on the tested combo opening. Because realized forward outcomes remain matched between baseline and Energy arms in these batches, these forward checks support boundary mapping rather than gain claims. Additional downstream dialogue-side checks show a similar bounded pattern: early priority control remains reproducible across ambiguity, preacceptance-burden, and repaired first-step side-topic/quarantine surfaces on the tested provider pair, but the main incremental first-step lift over baseline concentrates in `C_incident_response` and later followthrough remains conditional rather than uniformly stable. These results establish a calibrated boundary map for Energy instrumentation and delimit where direct policy claims require additional forward paired validation.

## 1. Introduction (Series Placement)
NRR-Energy is one module in the ongoing NRR series:
Core -> Phi -> IME -> Transfer -> Coupled -> Principles -> Boundary -> Energy.

Core/Phi defined state- and entropy-side operator behavior. IME/Transfer established extraction reliability and transfer behavior. Coupled added dependency propagation checks. Principles added provider-balanced efficiency views. Boundary established paired quality/cost effect maps and instability cells. Energy uses those paired artifacts to calibrate a commit/defer utility instrument and to report where that instrument is stable vs non-effective.

## 2. Scope and Non-Claims
This manuscript is a calibration paper. It answers:
1. Can an Energy utility instrument be defined and reproduced under fixed procedures?
2. Under which conditions does the calibrated instrument produce stable vs unstable decision behavior?
3. Under narrow downstream boundary checks, where does later followthrough remain condition-bounded even after early priority control succeeds?

It does not answer:
1. Does an online Energy policy improve outcomes prospectively versus baseline under new runs?

## 3. Method (E-1 Frozen Procedure)
### 3.1 Inputs
- Stage B paired metrics (`stageb_all/mst_pair_metrics.csv`)
- Ordered-combo paired metrics (`combo_rep3_all/mst_pair_metrics.csv`)
- Raw run traces for output-token overhead reconstruction

### 3.2 Utility Construction
- Quality term: `Q = misinterpretation improvement`
- Cost terms:
  - `C_gross = rework_cost improvement`
  - `C_net(output) = C_gross - overhead_output`
- Main utility for calibration analysis:
  - `DeltaU = wQ * z(Q)_cal + wC * z(C)_cal`
  - z-scoring uses calibration rows only.

### 3.3 Profiles and Threshold
- Weight profiles:
  - `q80_c20`, `q50_c50`, `q20_c80`
- Threshold:
  - `tau = q20(|DeltaU_cal|)`
- Current split instantiation:
  - calibration = reps 1,2
  - test = rep 3
  - This split instance is provisional; the split procedure is the fixed part.

### 3.4 Oracle, Disagreement, and CI
- Oracle sign per condition is defined by calibration-side mean `DeltaU` sign.
- Test rows output:
  - `decision` (`prefer_pattern` / `prefer_baseline` / `tie`)
  - `coverage` flag
  - `disagree` flag
- This allows CSV-only computation of tie/coverage/disagreement metrics.
- For reported disagreement rates, we use Wilson 95% confidence intervals from `(disagree_count, n_test)`.

### 3.5 Mapping to E-1 Worksheet (E1-01 to E1-09)
| E-1 item | Freeze decision in this draft | Method anchor |
|---|---|---|
| E1-01 | Adopted (utility frame). Semantic interpretation is finalized jointly with E1-08 cost definition. | 3.2, 4.2 |
| E1-02 | Adopted (calibration-only z-score normalization). | 3.2 |
| E1-03 | Adopted (multi-profile sensitivity; 3 weight profiles). | 3.3, 4.1 |
| E1-04 | Adopted (quantile threshold derivation). | 3.3 |
| E1-05 | Adopted as procedure; current rep-based split instance is provisional. | 3.3 |
| E1-06 | Adopted (CSV-complete outputs for tie/coverage/disagree and CI-ready counts). | 3.4 |
| E1-07 | Adopted (noise-floor method retained as diagnostic only, not as the primary decision rule). | 3.3 |
| E1-08 | Adopted (`C_net(output)` primary, `C_gross` reference, `C_net(total)` rejected for primary use). | 4.2 |
| E1-09 | Adopted as procedure freeze (derive `tau` per condition/profile), not value freeze of a single global table. | 3.3, 4.1 |

## 4. Results
### 4.1 E-1 Calibration Summary (All 3 Weight Profiles)
| Dataset | Profile | tau (gross) | tau (net) | Coverage gross -> net | Disagreement-all gross -> net |
|---|---|---:|---:|---:|---:|
| Stage B | q80_c20 | 0.01231 | 0.01184 | 57.30% -> 74.16% | 8.99% -> 14.61% |
| Stage B | q50_c50 | 0.01428 | 0.01377 | 52.81% -> 84.27% | 6.74% -> 17.98% |
| Stage B | q20_c80 | 0.04087 | 0.03349 | 51.69% -> 80.90% | 6.74% -> 11.24% |
| Combo | q80_c20 | 0.08366 | 0.08101 | 47.83% -> 71.01% | 2.90% -> 2.90% |
| Combo | q50_c50 | 0.04310 | 0.03941 | 47.83% -> 75.36% | 2.90% -> 2.90% |
| Combo | q20_c80 | 0.00255 | 0.02245 | 63.77% -> 75.36% | 7.25% -> 4.35% |

Interpretation:
- Net calibration increases coverage in all dataset-profile cells.
- Stage B shows coverage gain with disagreement increase under all profiles.
- Combo shows coverage gain with stable-or-lower disagreement.
- In Combo, the `q20_c80` profile also changes the gross-side disagreement level (`7.25%`) relative to the other profiles (`2.90%`), so stronger cost weighting alters the gross calibration behavior itself rather than only the net correction.
- Dataset-level ordering is stable across profiles: Stage B has higher disagreement than Combo under net calibration.

### 4.2 Cost Definition Gate (E1-08)
Observed sign-flip rates (`C_gross -> C_net`):
- `C_net(output)`: Stage B `37.08%`, Combo `38.21%`
- `C_net(total)`: Stage B `66.29%`, Combo `65.09%`

Decision:
- Adopt `C_net(output)` as the primary cost term.
- Reject `C_net(total)` for primary calibration because input-side fixed cost dominates and distorts recoverable-cost interpretation.
- Keep `C_gross` as reference upper-bound view.

### 4.3 E-2 Sensitivity
Primary reporting slice (`q50_c50`, net):
Overall:
- Stage B: tie `15.73%`, coverage `84.27%`, disagreement-all `17.98%`
- Combo: tie `24.64%`, coverage `75.36%`, disagreement-all `2.90%`

Provider axis:
- Stage B (net, disagreement-all):
  - Anthropic `10.00%`
  - Gemini `34.48%`
  - OpenAI `10.00%`
- Combo (net, disagreement-all):
  - Anthropic `0.00%`
  - Gemini `9.52%`
  - OpenAI `0.00%`

Temperature axis (Stage B, net):
- `t=0.0`: disagreement-all `11.36%`
- `t=0.3`: disagreement-all `24.44%`

Order axis (Combo, net):
- Notable weaker directions:
  - `conditional_hierarchical`: disagreement-all `11.11%`
  - `delta_hierarchical`: disagreement-all `11.11%`

Profile-robustness checks:
- Gemini is the highest-disagreement provider in both datasets under all three profiles.
- Stage B keeps the `t=0.3 > t=0.0` disagreement ordering under all three profiles.
- `conditional_hierarchical` and `delta_hierarchical` remain weaker cells across profiles in Combo.

### 4.4 Dialogue-Side Carryforward Boundary
The current downstream `priority-resolution` package provides a bounded dialogue-side carryforward read under the tested provider pair. Early control surfaces were reproducible across three checks:
- ambiguity resolution without unilateral commitment
- downstream preacceptance-burden removal
- repaired first-step side-topic / quarantine

On the repaired first-step side-topic / quarantine surface, the revised Energy policy was clean across the tested rows, but the incremental lift over baseline was not uniform:
- baseline is already fairly strong on `A_trip_planning` and `B_hiring_packet`
- the main additional lift is concentrated in `C_incident_response`

This carryforward read remains bounded. It does not establish provider-universal side-topic robustness, and later-horizon followthrough remains conditional rather than uniformly stable.

## 5. Non-Effective Regions and Failure Boundary (with Wilson CI)
This calibration reports explicit non-effective regions with uncertainty bounds from test-side counts:

| Region (q50_c50, net) | Disagree rate | 95% Wilson CI |
|---|---:|---:|
| Stage B overall (`16/89`) | 17.98% | [11.38%, 27.23%] |
| Combo overall (`2/69`) | 2.90% | [0.80%, 9.97%] |
| Stage B Gemini (`10/29`) | 34.48% | [19.94%, 52.65%] |
| Combo Gemini (`2/21`) | 9.52% | [2.65%, 28.91%] |
| Stage B `t=0.3` (`11/45`) | 24.44% | [14.24%, 38.67%] |
| Stage B `t=0.0` (`5/44`) | 11.36% | [4.95%, 23.98%] |
| Combo `conditional_hierarchical` (`1/9`) | 11.11% | [1.99%, 43.50%] |
| Combo `delta_hierarchical` (`1/9`) | 11.11% | [1.99%, 43.50%] |

Interpretation:
1. Gemini-centered instability is supported, especially in Stage B.
2. Stage B higher temperature remains a disagreement-risk region.
3. Combo weaker directions are visible but have wide intervals due to small `n`; they are boundary warnings, not high-precision estimates.

These are boundary findings, not anomalies to hide. They are required outputs for condition-bounded deployment recommendations.

## 6. Discussion
The Energy instrument can be calibrated reproducibly on existing paired data and can expose where decision confidence is likely to degrade. Calibration quality is nevertheless condition-dependent. In small-effect single-operator settings, output-overhead-adjusted utility can increase callable decisions while also increasing misalignment risk. In larger-effect ordered-combo settings, the same correction improves callable coverage without overall disagreement increase. This asymmetry implies that Energy should be used as a condition-gated instrument, not as a universal replacement rule.

The same `DeltaU` framing can also be read as a bounded cost-of-resolution instrument. Under this read, a commit-side move corresponds to executing deferred comparative resolution at the current output boundary, whereas a defer-side move keeps unresolved alternatives active and postpones that resolution step. A positive `DeltaU` therefore means not that cost disappears, but that under the tested condition the delayed-resolution route has higher net utility than immediate collapse at that step. The non-effective regions reported here, especially Gemini-centered cells and higher-temperature Stage B cells, then mark conditions where that delay no longer yields a stable net advantage. This remains a local interpretation of the present calibration signal, not a general complexity claim.

One plausible interpretation is that the Stage B vs Combo disagreement gap reflects effect-size structure rather than a category difference between single-operator and ordered-combination datasets. Under tested conditions, Combo cells include stronger directional separations, so the same calibration procedure can expand callable coverage with less disagreement increase than in the smaller-effect Stage B cells. This should still be read conditionally: the present analysis supports an effect-size-consistent explanation under these datasets, not a universal law that ordered combinations are always easier to calibrate.

A second boundary is self-reference. The current oracle labels are derived from calibration-split mean `DeltaU` signs, so the evaluation remains an internal consistency check of the calibrated instrument rather than an external prospective policy test. That is why the next step remains a new paired validation (`baseline` vs `Energy policy`) under frozen procedures. Until that forward test is run, the present results justify calibration and boundary reporting, but not direct claims that the calibrated instrument improves online commit/defer policy outcomes by itself.

A third boundary comes from the current `priority-resolution` package that sits downstream of this calibration work. On the tested provider pair, early control surfaces were reproducible: models could resolve ambiguous priority without unilateral commitment, keep preacceptance burden out of the response more reliably, and, under the repaired frozen first-step side-topic / quarantine surface, reach clean first-step side-topic workstart. That side-topic gain was bounded rather than uniform. Baseline was already fairly strong on `A_trip_planning` and `B_hiring_packet`, while the main incremental lift over baseline concentrated in `C_incident_response`. However, later-horizon followthrough remained conditional rather than uniformly stable. Across later checkpoints, both providers often preserved the active-vs-suspended objective boundary while still degrading on unresolved-relation handling, especially by committing too early to an ordering or interpretation that the user had not yet fixed. This means the current Energy path is not limited only by whether a model can keep the old objective suspended; it is also bounded by whether prompt-layer control can preserve unresolved relational structure across later turns.

## 7. Broader Forward Validation (E-Next, Not Executed Here)
The narrow downstream boundary checks discussed above are not the same as the broader forward paired validation proposed here. What remains unexecuted is the prospective baseline-versus-Energy comparison under newly run paired trials.

Planned next experiment:
1. Run new paired trials under fixed protocol:
   - baseline policy vs Energy policy
2. Use pre-frozen calibration procedure from this paper.
3. Report:
   - utility gain/loss
   - over-commit / over-defer rates
   - provider- and order-bounded failure regions

## 8. Reproducibility Artifacts
- `stats/evidence/energy_e1_delta_u_table_v1_1.csv`
- `stats/evidence/energy_e1_tau_summary_v1_1.csv`
- `stats/evidence/energy_e2_sensitivity_summary_v1.csv`
- `stats/evidence/recompute_energy_e1_tables.py`
- `stats/evidence/recompute_energy_e2_sensitivity.py`
- `results/analysis/energy_priority_resolution_branch_handoff_v3_2026-03-18.md`
- `results/analysis/energy_priority_resolution_branch_synthesis_memo_v3_2026-03-18.md`
- `results/analysis/energy_priority_resolution_package_map_v1_2026-03-18.md`
- `results/analysis/energy_priority_resolution_manuscript_boundary_text_v2_2026-03-18.md`
- `results/analysis/energy_priority_resolution_package_boundary_external_review_decision_memo_v1_2026-03-18.md`
- `results/analysis/energy_policy_verification_side_topic_quarantine_readout_external_review_decision_memo_v1_2026-03-18.md`
- `results/analysis/energy_priority_resolution_horizon_stability_family_synthesis_memo_v1_2026-03-17.md`
