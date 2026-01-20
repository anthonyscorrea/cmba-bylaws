#!/bin/bash
set -euo pipefail

MKDOCS_STRICT="${MKDOCS_STRICT:-true}"
TMPDIR="${RUNNER_TEMP:-$TMPDIR}"
OUTPUT_DIR="${OUTPUT_DIR:-${TMPDIR}/dist/}"
# OFFLINE="${OFFLINE:-false}" # This doesn't seem to do anything, set by mkdocs.yml
MKDOCS_CONFIG="${MKDOCS_CONFIG:-mkdocs/mkdocs.yml}"

STRICT_FLAG=""
if [ "${MKDOCS_STRICT}" = "true" ]; then
  STRICT_FLAG="--strict"
fi

mkdocs build ${STRICT_FLAG} -f $MKDOCS_CONFIG -d $OUTPUT_DIR