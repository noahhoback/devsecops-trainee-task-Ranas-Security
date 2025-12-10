#!/usr/bin/env bash
set -euo pipefail

# Exit codes:
# 0 - OK
# 1 - usage / missing argument
# 2 - file not found
# 3 - runtime error
# 4 - found ERROR lines (Phase 2 optional behavior)

progname="$(basename "$0")"

usage() {
  cat <<USAGE
Usage: $progname <log_file>
       $progname -h | --help

Prints:
  - Total lines
  - Number of lines containing INFO, WARN, ERROR

Exit codes:
  0 - OK
  1 - Usage / missing argument
  2 - File not found
  3 - Runtime error
  4 - Found ERROR lines (when FAIL_ON_ERROR=1)
USAGE
}

# handle help flags
if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

# require one positional argument
if [[ $# -lt 1 ]]; then
  echo "Error: no log file specified." >&2
  usage
  exit 1
fi

LOGFILE="$1"

# file must exist and be a regular file
if [[ ! -f "$LOGFILE" ]]; then
  echo "Error: file '$LOGFILE' does not exist." >&2
  exit 2
fi

# deterministic behaviour across locales
export LC_ALL=C

# safe counts: guard grep -c with || true so shell doesn't fail when no matches
TOTAL_LINES=$(wc -l < "$LOGFILE" || echo "0")
INFO_LINES=$(grep -c "INFO" "$LOGFILE" || true)
WARN_LINES=$(grep -c "WARN" "$LOGFILE" || true)
ERROR_LINES=$(grep -c "ERROR" "$LOGFILE" || true)

echo "Total lines: $TOTAL_LINES"
echo "INFO lines:  $INFO_LINES"
echo "WARN lines:  $WARN_LINES"
echo "ERROR lines: $ERROR_LINES"

# optional CI behavior: fail if ERROR lines present when configured
if [[ "${FAIL_ON_ERROR:-}" == "1" && "$ERROR_LINES" -gt 0 ]]; then
  echo "Found $ERROR_LINES ERROR lines; failing as configured." >&2
  exit 4
fi

exit 0
