#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
WORK_ROOT="${1:-/tmp/nrr-energy_review_package_build}"
source "$ROOT/scripts/review_package_contract.sh"
STAGE_DIR="$WORK_ROOT/$PACKAGE_BASENAME"
ZIP_PATH="$WORK_ROOT/${PACKAGE_BASENAME}.zip"

PAPER7_DIR="$STAGE_DIR/upstream_reference/paper7_v0_29"

rm -rf "$STAGE_DIR" "$ZIP_PATH"
mkdir -p "$STAGE_DIR/manuscript/current" "$STAGE_DIR/results/analysis" "$STAGE_DIR/results/analysis/archive/$ARCHIVE_SUBDIR" "$STAGE_DIR/stats" "$STAGE_DIR/scripts" "$PAPER7_DIR"

cp "$ROOT/README.md" "$STAGE_DIR/README.md"
cp "$ROOT/reproducibility.md" "$STAGE_DIR/reproducibility.md"
cp "$ROOT/LICENSE" "$STAGE_DIR/LICENSE"
cp "$ROOT/results/README.md" "$STAGE_DIR/results/README.md"
cp "$ROOT/manuscript/checksums_active_review_surface_sha256.txt" "$STAGE_DIR/manuscript/checksums_active_review_surface_sha256.txt"
cp "$ROOT/manuscript/checksums_current_package_sha256.txt" "$STAGE_DIR/manuscript/checksums_current_package_sha256.txt"
cp "$ROOT/manuscript/current/${MANUSCRIPT_BASENAME}.tex" "$STAGE_DIR/manuscript/current/${MANUSCRIPT_BASENAME}.tex"
cp "$ROOT/manuscript/current/${MANUSCRIPT_BASENAME}.pdf" "$STAGE_DIR/manuscript/current/${MANUSCRIPT_BASENAME}.pdf"

for file in "${ANALYSIS_FILES[@]}"; do
  cp "$ROOT/results/analysis/$file" "$STAGE_DIR/results/analysis/$file"
done

for dir in "${RESULT_DIRS[@]}"; do
  cp -R "$ROOT/results/$dir" "$STAGE_DIR/results/$dir"
done

cp -R "$ROOT/results/analysis/archive/$ARCHIVE_SUBDIR/." "$STAGE_DIR/results/analysis/archive/$ARCHIVE_SUBDIR/"

mkdir -p "$STAGE_DIR/stats/evidence"
for file in "${EVIDENCE_FILES[@]}"; do
  cp "$ROOT/stats/evidence/$file" "$STAGE_DIR/stats/evidence/$file"
done
cp -R "$ROOT/stats/stageb_all" "$STAGE_DIR/stats/"
cp -R "$ROOT/stats/combo_rep3_all" "$STAGE_DIR/stats/"
cp -R "$ROOT/stats/raw_stageb_all" "$STAGE_DIR/stats/"
cp -R "$ROOT/stats/raw_combo_rep3_all" "$STAGE_DIR/stats/"
for file in "${SCRIPT_FILES[@]}"; do
  cp "$ROOT/scripts/$file" "$STAGE_DIR/scripts/$file"
done
for file in "${STAGEA_METADATA_FILES[@]}"; do
  src="$(find "$ROOT/stats" -type f -name "$file" | sort | tail -n 1)"
  cp "$src" "$STAGE_DIR/results/analysis/$file"
done

cp "$PAPER7_ROOT/paper7_integrated_manuscript_v0_29_2026-04-01.tex" "$PAPER7_DIR/"
cp "$PAPER7_ROOT/paper7_integrated_manuscript_v0_29_2026-04-01.pdf" "$PAPER7_DIR/"
cp "$PAPER7_ROOT/paper7_integrated_checksums_sha256.txt" "$PAPER7_DIR/"
for file in "${PAPER7_SUPPORT_FILES[@]}"; do
  cp "$PAPER7_ROOT/$file" "$PAPER7_DIR/"
done

cat > "$STAGE_DIR/PACKAGE_MANIFEST.md" <<EOF
# Package Manifest

- Package: \`${PACKAGE_BASENAME}.zip\`
- Source repo: \`${ROOT}\`
- Current manuscript line: \`manuscript/current/${MANUSCRIPT_BASENAME}.tex\`
- Current PDF snapshot: \`manuscript/current/${MANUSCRIPT_BASENAME}.pdf\`
- Active review checksum manifest: \`manuscript/checksums_active_review_surface_sha256.txt\`
- Current package checksum manifest: \`manuscript/checksums_current_package_sha256.txt\`
- Scope: current-line TeX, current-line PDF, current checksum manifests, Energy scripts, Energy stats, active Energy analysis, repo entry docs, and shipped paper7 upstream reference snapshot
- Exclusions: manuscript archive/history, non-current manuscript versions, review briefs, review pack notes, embedded historical review zip artifacts, any \`*guarantee*\` artifacts, and archive analysis notes other than the narrow shipped provenance subset under \`results/analysis/archive/${ARCHIVE_SUBDIR}/\`
- Coupled citation contract: context-only fixed-tree series-path reference
- paper7 authority contract: fixed upstream manuscript snapshot \`paper7_integrated_manuscript_v0_29_2026-04-01.tex\` is shipped under \`upstream_reference/paper7_v0_29/\`
- paper7 checksum contract: the shipped \`paper7_integrated_checksums_sha256.txt\` is package-verifiable because its referenced PNG support files are included under \`upstream_reference/paper7_v0_29/\`
- Boundary-derived physical-input contract: \`stats/stageb_all/\`, \`stats/combo_rep3_all/\`, \`stats/raw_stageb_all/\`, and \`stats/raw_combo_rep3_all/\` are the fixed 2026-03-07 vendored Energy rebuild inputs; ordered-combo reuse is not attributed to the fixed paper7 authority surface
- E-1 authority contract: the shipped authoritative E-1 rebuild outputs are \`energy_e1_delta_u_table_v1_1.csv\`, \`energy_e1_tau_summary_v1_1.csv\`, and \`energy_e1_cost_variant_audit_v1.csv\`; legacy \`energy_e1_*_v1.csv\` compatibility files are excluded from the review package
- Stage A support contract: the shipped Stage A implementation-trial summary memo is accompanied by its directly linked audit, package-local condition-metadata CSVs, freeze-gate, freeze-manifest, and calibration-bundle artifacts for the four routed runs
- Downstream handoff contract: shipped downstream \`Policy-Verification\` notes are bounded handoff references for later validation work rather than core manuscript evidence claims of the Energy paper
- Downstream support contract: shipped downstream comparison memos are accompanied by their linked run-input CSVs, run-annotation CSVs, and authorized run-output directories for the frozen 2026-03-17 priority-resolution, downstream-boundary, and repaired side-topic/quarantine provider slices
- Stable interface contract: \`scripts/review_package_contract.sh\` is the single source of truth for the stable review-package entrypoints and shipped allowlist used by both build and verification
EOF

(
  cd "$STAGE_DIR"
  find . -type f | LC_ALL=C sort | sed 's#^\./##' > PACKAGE_FILELIST.txt
)

bash "$ROOT/scripts/verify_step3_closure_contract.sh" "$STAGE_DIR"

mkdir -p "$WORK_ROOT"
(
  cd "$STAGE_DIR"
  zip -qr "$ZIP_PATH" .
)

printf '%s\n' "$ZIP_PATH"
