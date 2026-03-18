#!/bin/zsh
set -e

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
EVIDENCE_DIR="$SCRIPT_DIR/../stats/evidence"

cd "$EVIDENCE_DIR"
python3 recompute_energy_e1_tables.py
python3 recompute_energy_e2_sensitivity.py
