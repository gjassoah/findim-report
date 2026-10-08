#!/usr/bin/env bash
# Entry point for Codex jobs; see tools/codex_job.py for usage and the job record.
# Kept as a shell script because Claude Code's sandbox exception names this path.
exec python3 "$(dirname "$0")/codex_job.py" "$@"
