# Scripts

This directory contains the stable review-package wrappers together with the
research and runtime helpers used by the current Energy line.

## Stable review-package entrypoints

- `build_current_manuscript.sh`
  - builds the current TeX manuscript to a temp output directory
- `verify_current_package.sh`
  - verifies `manuscript/current/checksums_sha256.txt`
- `recompute_evidence.sh`
  - stable wrapper for recomputing the bundled E-1 and E-2 evidence tables

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
- pilot wrappers default to `nrr-energy/.env`
- set `PRIORITY_RESOLUTION_ENV_FILE` to override that path
- `.env.example` documents the expected key names

These helpers are retained as part of the Energy research surface, but the
stable public review-package interface is the three entrypoints listed above.
