#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="${1:-$ROOT}"
source "$ROOT/scripts/review_package_contract.sh"

EXPECTED_PAPER7_TEX="paper7_integrated_manuscript_v0_29_2026-04-01.tex"
EXPECTED_PAPER7_CHECKSUM="paper7_integrated_checksums_sha256.txt"
EXPECTED_PAPER7_TITLE="NRR-Patterns: Condition-Bounded Comparison of Five Delayed-Commitment Patterns in Stateful LLM Systems"
EXPECTED_UPSTREAM_NOTE="results/analysis/energy_upstream_paper7_fixed_reference_note_v2_2026-04-01.md"
EXPECTED_ARCHIVE_SUBSET="results/analysis/archive/2026-04-01_superseded_side_topic_quarantine_v1/energy_policy_verification_side_topic_quarantine_baseline_vs_revised_energy_policy_comparison_memo_v1_2026-03-17.md"

failures=0

report_fail() {
  printf '[FAIL] %s\n' "$1" >&2
  failures=$((failures + 1))
}

report_pass() {
  printf '[PASS] %s\n' "$1"
}

require_path_in_filelist() {
  local path="$1"
  local filelist="$2"
  local label="$3"
  if ! grep -Fxq "$path" "$filelist"; then
    report_fail "$label missing from $filelist"
    return 0
  fi
  report_pass "$label present in $(basename "$filelist")"
  return 0
}

require_file() {
  local path="$1"
  local label="$2"
  if [ ! -f "$path" ]; then
    report_fail "$label missing: $path"
    return 0
  fi
  report_pass "$label present"
  return 0
}

require_contains() {
  local pattern="$1"
  local path="$2"
  local label="$3"
  if ! grep -Fq "$pattern" "$path"; then
    report_fail "$label missing in $path"
    return 0
  fi
  report_pass "$label present in $(basename "$path")"
  return 0
}

forbid_egrep_file() {
  local pattern="$1"
  local path="$2"
  local label="$3"
  if grep -Eq "$pattern" "$path"; then
    report_fail "$label still present in $path"
    return 0
  fi
  report_pass "$label absent from $(basename "$path")"
  return 0
}

if [ ! -d "$TARGET" ]; then
  echo "Target directory does not exist: $TARGET" >&2
  exit 1
fi

MANUSCRIPT_TEX="$(find "$TARGET/manuscript/current" -maxdepth 1 -type f -name 'nrr-energy_manuscript_v*.tex' | sort -V | tail -n 1)"
README_MD="$TARGET/README.md"
REPRO_MD="$TARGET/reproducibility.md"
SCRIPTS_README="$TARGET/scripts/README.md"
UPSTREAM_NOTE="$TARGET/$EXPECTED_UPSTREAM_NOTE"
PACKAGE_MANIFEST="$TARGET/PACKAGE_MANIFEST.md"
PACKAGE_FILELIST="$TARGET/PACKAGE_FILELIST.txt"

if [ -n "$MANUSCRIPT_TEX" ]; then
  EXPECTED_MANUSCRIPT="$(basename "$MANUSCRIPT_TEX")"
else
  EXPECTED_MANUSCRIPT="nrr-energy_manuscript_v*.tex"
fi

require_file "$MANUSCRIPT_TEX" "Current Energy manuscript"
require_file "$README_MD" "README"
require_file "$REPRO_MD" "Reproducibility note"
require_file "$SCRIPTS_README" "Scripts README"
require_file "$UPSTREAM_NOTE" "Upstream authority note"

if [ -f "$MANUSCRIPT_TEX" ]; then
  require_contains "$EXPECTED_PAPER7_TEX" "$MANUSCRIPT_TEX" "Fixed upstream paper7 TeX path"
  require_contains "$EXPECTED_PAPER7_CHECKSUM" "$MANUSCRIPT_TEX" "Fixed upstream paper7 checksum path"
  require_contains "$EXPECTED_PAPER7_TITLE" "$MANUSCRIPT_TEX" "Actual upstream paper7 manuscript title"
  require_contains "Boundary-derived vendored input snapshot" "$MANUSCRIPT_TEX" "Manuscript Boundary-derived input wording"
  require_contains "ordered-combo slice is reused from the same Boundary-derived vendored snapshot as an Energy-side calibration extension" "$MANUSCRIPT_TEX" "Manuscript combo-role split wording"
  require_contains "shipped summary-memo surface" "$MANUSCRIPT_TEX" "Manuscript forward summary-surface wording"
  require_contains "cost\\_variant\\_audit\\_v1.csv" "$MANUSCRIPT_TEX" "Manuscript cost-gate artifact listing"
  require_contains "energy_upstream_paper7_fixed_reference_note_v2_2026-04-01.md" "$MANUSCRIPT_TEX" "Manuscript upstream note artifact listing"
  require_contains "energy_policy_verification_priority_resolution_baseline_vs_energy_policy_comparison_memo_v1_2026-03-17.md" "$MANUSCRIPT_TEX" "Manuscript downstream priority memo listing"
  require_contains "Shipped forward summary memos report exact replay" "$MANUSCRIPT_TEX" "Manuscript forward evidence-class wording"
  require_contains "bounded handoff references for later work rather than core manuscript evidence claims" "$MANUSCRIPT_TEX" "Manuscript downstream handoff wording"
  forbid_egrep_file "Integrated paper7 fixed upstream role reference for Energy" "$MANUSCRIPT_TEX" "Invented paper7 bibliography label"
  forbid_egrep_file "memo-plus-audit|audit-ready|later-horizon followthrough remains conditional rather than uniformly stable|can be executed and audited on the tested slices" "$MANUSCRIPT_TEX" "Manuscript superseded package wording"
fi

if [ -f "$README_MD" ]; then
  require_contains "$EXPECTED_MANUSCRIPT" "$README_MD" "README current manuscript filename"
  require_contains "$EXPECTED_PAPER7_TEX" "$README_MD" "README upstream paper7 filename pin"
  require_contains "$EXPECTED_UPSTREAM_NOTE" "$README_MD" "README upstream authority note link"
  require_contains "ordered-combo slice is reused from the same frozen Boundary-derived snapshot as an Energy-side calibration extension" "$README_MD" "README combo-role split wording"
  require_contains "verify_step3_closure_contract.sh" "$README_MD" "README Step 3 closure command"
  require_contains "summary-memo review of the shipped forward boundary surface" "$README_MD" "README forward summary-surface wording"
  require_contains "energy_policy_verification_priority_resolution_baseline_vs_energy_policy_comparison_memo_v1_2026-03-17.md" "$README_MD" "README downstream priority memo listing"
  require_contains "bounded handoff references rather than core manuscript evidence claims of the Energy paper" "$README_MD" "README downstream handoff wording"
  forbid_egrep_file "memo-plus-audit|audit-ready|bounded dialogue-side carryforward on the tested provider pair$|repaired first-step side-topic/quarantine surface" "$README_MD" "README superseded package wording"
fi

if [ -f "$REPRO_MD" ]; then
  require_contains "$EXPECTED_MANUSCRIPT" "$REPRO_MD" "Reproducibility current manuscript filename"
  require_contains "$EXPECTED_PAPER7_TEX" "$REPRO_MD" "Reproducibility upstream paper7 filename pin"
  require_contains "$EXPECTED_UPSTREAM_NOTE" "$REPRO_MD" "Reproducibility upstream authority note link"
  require_contains "ordered-combo slice is reused from the same frozen Boundary-derived input" "$REPRO_MD" "Reproducibility combo-role split wording"
  require_contains "verify_step3_closure_contract.sh" "$REPRO_MD" "Reproducibility Step 3 closure command"
  require_contains "summary-memo level" "$REPRO_MD" "Reproducibility forward summary-surface wording"
  require_contains "energy_policy_verification_priority_resolution_baseline_vs_energy_policy_comparison_memo_v1_2026-03-17.md" "$REPRO_MD" "Reproducibility downstream priority memo listing"
  require_contains "bounded handoff references for later validation work; they are not core manuscript evidence claims" "$REPRO_MD" "Reproducibility downstream handoff wording"
  forbid_egrep_file "memo-plus-audit|audit-ready|manuscript-plus-audit level|repaired first-step side-topic/quarantine surface" "$REPRO_MD" "Reproducibility superseded package wording"
fi

STAGEA_AUDIT_MEMOS=(
  "$TARGET/results/analysis/energy_stagea_bundle_input_audit_energy_route_probe_live_impltrial_stable_anthropic_20260312T071752Z_v1.md"
  "$TARGET/results/analysis/energy_stagea_bundle_input_audit_energy_route_probe_live_impltrial_context_drift_anthropic_20260312T073229Z_v1.md"
  "$TARGET/results/analysis/energy_stagea_bundle_input_audit_energy_route_probe_live_impltrial_stable_gemini_20260312T074421Z_v1.md"
  "$TARGET/results/analysis/energy_stagea_bundle_input_audit_energy_route_probe_live_impltrial_context_drift_gemini_20260312T074741Z_v1.md"
)

for memo in "${STAGEA_AUDIT_MEMOS[@]}"; do
  if [ -f "$memo" ]; then
    require_contains 'stats/decision_context_v2' "$memo" "Stage A audit decision-context version wording"
    require_contains 'Condition metadata: `condition_metadata_' "$memo" "Stage A audit package-local metadata reference"
    require_contains 'Tau summary: `../../stats/evidence/energy_e1_tau_summary_v1_1.csv`' "$memo" "Stage A audit package-local tau reference"
    forbid_egrep_file '/Users/' "$memo" "Stage A audit absolute-path reference"
  fi
done

if [ -f "$SCRIPTS_README" ]; then
  for entrypoint in "${STABLE_REVIEW_ENTRYPOINTS[@]}"; do
    require_contains "$entrypoint" "$README_MD" "README stable entrypoint"
    require_contains "$entrypoint" "$REPRO_MD" "Reproducibility stable entrypoint"
    require_contains "$entrypoint" "$SCRIPTS_README" "Scripts README stable entrypoint"
  done
  forbid_egrep_file "stable public review-package interface is the three entrypoints|stable public review-package interface is the three" "$SCRIPTS_README" "Scripts README outdated entrypoint count"
  forbid_egrep_file "provider_env_status\\.py|\\.env\\.example|/Users/" "$SCRIPTS_README" "Scripts README non-package-local references"
fi

if [ -f "$UPSTREAM_NOTE" ]; then
  require_contains "$EXPECTED_PAPER7_TEX" "$UPSTREAM_NOTE" "Upstream note paper7 TeX identity"
  require_contains "$EXPECTED_PAPER7_CHECKSUM" "$UPSTREAM_NOTE" "Upstream note checksum identity"
  require_contains "it is not attributed to the fixed paper7 authority surface." "$UPSTREAM_NOTE" "Upstream note combo-role split wording"
fi

FORWARD_ANTHROPIC_MEMO="$TARGET/results/analysis/energy_forward_combo_two_direction_anthropic_results_v1_2026-03-13.md"
FORWARD_GEMINI_MEMO="$TARGET/results/analysis/energy_forward_combo_two_direction_gemini_results_v1_2026-03-13.md"
if [ -f "$FORWARD_ANTHROPIC_MEMO" ]; then
  require_contains "Current package read" "$FORWARD_ANTHROPIC_MEMO" "Anthropic forward memo closed-package wording"
  forbid_egrep_file "## Next judgment|The next decision is whether to" "$FORWARD_ANTHROPIC_MEMO" "Anthropic forward memo branching text"
fi
if [ -f "$FORWARD_GEMINI_MEMO" ]; then
  require_contains "bounded Gemini combo boundary read" "$FORWARD_GEMINI_MEMO" "Gemini forward memo closed-package wording"
  forbid_egrep_file "lower priority than resolving how to read or redesign" "$FORWARD_GEMINI_MEMO" "Gemini forward memo branching text"
fi

UPSTREAM_TEX_CANDIDATE=""
if [ -f "$TARGET/upstream_reference/paper7_v0_29/$EXPECTED_PAPER7_TEX" ]; then
  UPSTREAM_TEX_CANDIDATE="$TARGET/upstream_reference/paper7_v0_29/$EXPECTED_PAPER7_TEX"
elif [ -f "/Users/saitokei/Documents/New project/nrr-principles/manuscript/current/$EXPECTED_PAPER7_TEX" ]; then
  UPSTREAM_TEX_CANDIDATE="/Users/saitokei/Documents/New project/nrr-principles/manuscript/current/$EXPECTED_PAPER7_TEX"
fi

if [ -n "$UPSTREAM_TEX_CANDIDATE" ]; then
  require_contains "$EXPECTED_PAPER7_TITLE" "$UPSTREAM_TEX_CANDIDATE" "Upstream paper7 title in canonical manuscript"
else
  report_fail "No upstream paper7 manuscript available for title verification"
fi

UPSTREAM_CHECKSUM_CANDIDATE=""
if [ -f "$TARGET/upstream_reference/paper7_v0_29/$EXPECTED_PAPER7_CHECKSUM" ]; then
  UPSTREAM_CHECKSUM_CANDIDATE="$TARGET/upstream_reference/paper7_v0_29/$EXPECTED_PAPER7_CHECKSUM"
fi

if [ -n "$UPSTREAM_CHECKSUM_CANDIDATE" ]; then
  while read -r _ relpath; do
    [ -n "$relpath" ] || continue
    if [ ! -f "$(dirname "$UPSTREAM_CHECKSUM_CANDIDATE")/$relpath" ]; then
      report_fail "Upstream checksum entry missing from shipped paper7 snapshot: $relpath"
    fi
  done < "$UPSTREAM_CHECKSUM_CANDIDATE"
fi

if [ -f "$PACKAGE_MANIFEST" ] || [ -f "$PACKAGE_FILELIST" ]; then
  require_file "$PACKAGE_MANIFEST" "Package manifest"
  require_file "$PACKAGE_FILELIST" "Package file list"

  if [ -f "$PACKAGE_MANIFEST" ]; then
    require_contains "$EXPECTED_MANUSCRIPT" "$PACKAGE_MANIFEST" "Manifest current manuscript filename"
    require_contains "review briefs" "$PACKAGE_MANIFEST" "Manifest exclusion rule for review briefs"
    require_contains "review pack notes" "$PACKAGE_MANIFEST" "Manifest exclusion rule for review pack notes"
    require_contains "archive analysis notes other than the narrow shipped provenance subset" "$PACKAGE_MANIFEST" "Manifest archive-subset rule"
    require_contains 'any `*guarantee*` artifacts' "$PACKAGE_MANIFEST" "Manifest guarantee exclusion rule"
    require_contains "upstream_reference/paper7_v0_29/" "$PACKAGE_MANIFEST" "Manifest upstream reference path"
    require_contains "paper7_integrated_checksums_sha256.txt" "$PACKAGE_MANIFEST" "Manifest upstream checksum surface"
    require_contains "package-verifiable" "$PACKAGE_MANIFEST" "Manifest upstream checksum verifiability wording"
    require_contains "ordered-combo reuse is not attributed to the fixed paper7 authority surface" "$PACKAGE_MANIFEST" "Manifest combo-role split wording"
    require_contains 'energy_e1_delta_u_table_v1_1.csv' "$PACKAGE_MANIFEST" "Manifest E-1 authority wording"
    require_contains "legacy \`energy_e1_*_v1.csv\` compatibility files are excluded" "$PACKAGE_MANIFEST" "Manifest legacy E-1 exclusion wording"
    require_contains "Stage A implementation-trial summary memo is accompanied by its directly linked audit, package-local condition-metadata CSVs, freeze-gate, freeze-manifest, and calibration-bundle artifacts" "$PACKAGE_MANIFEST" "Manifest Stage A support wording"
    require_contains "bounded handoff references for later validation work rather than core manuscript evidence claims" "$PACKAGE_MANIFEST" "Manifest downstream handoff wording"
    require_contains "run-input CSVs, run-annotation CSVs, and authorized run-output directories" "$PACKAGE_MANIFEST" "Manifest downstream support wording"
    require_contains "single source of truth" "$PACKAGE_MANIFEST" "Manifest stable interface wording"
  fi

  if [ -f "$PACKAGE_FILELIST" ]; then
    forbid_egrep_file '(^|/)results/analysis/[^[:space:]]*review_brief[^[:space:]]*\.md$' "$PACKAGE_FILELIST" "Review briefs"
    forbid_egrep_file '(^|/)results/analysis/[^[:space:]]*review_pack_note[^[:space:]]*\.md$' "$PACKAGE_FILELIST" "Review pack notes"
    forbid_egrep_file '(^|/)results/priority_resolution_side_(topic_followthrough|first_acceptance_adherence)_probe_[^[:space:]]*/?$' "$PACKAGE_FILELIST" "Superseded side-topic probe directories"
    forbid_egrep_file '(^|/)scripts/[^[:space:]]*guarantee[^[:space:]]*$' "$PACKAGE_FILELIST" "Guarantee scripts"
    forbid_egrep_file '(^|/)stats/evidence/energy_e1_delta_u_table_v1\.csv$' "$PACKAGE_FILELIST" "Legacy E-1 delta table"
    forbid_egrep_file '(^|/)stats/evidence/energy_e1_tau_summary_v1\.csv$' "$PACKAGE_FILELIST" "Legacy E-1 tau summary"
    forbid_egrep_file '(^|/)results/analysis/energy_priority_resolution_(branch_handoff|branch_synthesis_memo|package_map|manuscript_boundary_text|package_boundary_external_review_decision_memo|horizon_stability_family_synthesis_memo)[^[:space:]]*$' "$PACKAGE_FILELIST" "Branch-level later-horizon package memos"
    require_path_in_filelist "$EXPECTED_ARCHIVE_SUBSET" "$PACKAGE_FILELIST" "Shipped superseded-side-topic archive subset"
    require_path_in_filelist "scripts/review_package_contract.sh" "$PACKAGE_FILELIST" "Shared package contract script"
    require_path_in_filelist "upstream_reference/paper7_v0_29/fig_principles_weighted_3runs.png" "$PACKAGE_FILELIST" "Shipped paper7 support PNG"
    require_path_in_filelist "upstream_reference/paper7_v0_29/fig_r2_comparison_weighted.png" "$PACKAGE_FILELIST" "Shipped paper7 support PNG"
    require_path_in_filelist "upstream_reference/paper7_v0_29/paper7_stageb_sign_flip_boundaries.png" "$PACKAGE_FILELIST" "Shipped paper7 support PNG"
    for anchor in "${REQUIRED_PACKAGE_ANCHORS[@]}"; do
      require_path_in_filelist "$anchor" "$PACKAGE_FILELIST" "Required downstream carryforward anchor"
    done
    for support in "${REQUIRED_STAGEA_SUPPORT[@]}"; do
      require_path_in_filelist "$support" "$PACKAGE_FILELIST" "Required Stage A support artifact"
    done
    for support in "${REQUIRED_DOWNSTREAM_SUPPORT[@]}"; do
      require_path_in_filelist "$support" "$PACKAGE_FILELIST" "Required downstream support artifact"
    done
  fi
else
  printf '[INFO] Package manifest/file list absent under %s; package-boundary checks skipped for this target.\n' "$TARGET"
fi

if [ "$failures" -ne 0 ]; then
  printf '\nStep 3 closure contract failed with %d issue(s).\n' "$failures" >&2
  exit 1
fi

printf '\nStep 3 closure contract passed for %s\n' "$TARGET"
