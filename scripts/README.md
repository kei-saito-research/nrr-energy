# Scripts

This directory contains the stable review-package wrappers together with the
research and runtime helpers used by the current Energy line.

## Stable review-package entrypoints

- `build_current_manuscript.sh`
  - builds the current TeX manuscript to a temp output directory
- `verify_current_package.sh`
  - verifies `manuscript/current/checksums_sha256.txt`
- `verify_step3_closure_contract.sh`
  - verifies the current manuscript/package contract on the repo surface or an unpacked review package
- `build_current_review_package.sh`
  - builds the current allowlisted review package from the shared package contract
- `recompute_evidence.sh`
  - stable wrapper for recomputing the bundled E-1 and E-2 evidence tables

## Shared package contract

- `review_package_contract.sh`
  - single source of truth for the stable review-package entrypoints and the shipped review-surface allowlist used by both build and verification

## Core rebuild helper

- `rebuild_all.sh`
  - internal helper used by `recompute_evidence.sh`

## Research and runtime helpers

Additional scripts in this directory support:
- Stage A decision-context ingest and audit
- calibration-bundle construction and freeze checks
- forward-boundary probes
- priority-resolution pilot execution and analysis support

Environment note:
- runtime environment helpers are workspace-local and are not part of the shipped review package
- review of the shipped package does not require any provider key files or local env helper scripts

These helpers are retained as part of the Energy research surface, but the
stable public review-package interface is the five entrypoints listed above.
