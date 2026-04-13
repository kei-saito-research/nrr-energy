# Scripts

This directory contains the stable package wrappers together with the
research and runtime helpers used by the current Energy line.

## Stable package entrypoints

- `build_current_manuscript.sh`
  - builds the current TeX manuscript to a temp output directory
- `verify_active_review_surface.sh`
  - verifies that `manuscript/current/` contains only the current `.tex` and `.pdf` pair and checks `manuscript/checksums_active_review_surface_sha256.txt`
- `verify_current_package.sh`
  - verifies the active manuscript surface first and then checks `manuscript/checksums_current_package_sha256.txt`
- `verify_step3_closure_contract.sh`
  - verifies the current manuscript/package contract on the repo surface or an unpacked package
- `build_current_review_package.sh`
  - builds the current allowlisted package from the shared package contract
- `recompute_evidence.sh`
  - stable wrapper for recomputing the bundled E-1 and E-2 evidence tables

## Shared package contract

- `review_package_contract.sh`
  - single source of truth for the stable package entrypoints and the shipped allowlist used by both build and verification

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
- runtime environment helpers are workspace-local and are not part of the shipped package
- inspection of the shipped package does not require any provider key files or local env helper scripts

These helpers are retained as part of the Energy research surface, but the
stable public package interface is the six entrypoints listed above.
