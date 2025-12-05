#!/bin/bash

# Check if file was provided
if [ -z "$1" ]; then
    echo "Error: No log file provided."
    exit 1
fi

LOGFILE="$1"

# Check if file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' does not exist."
    exit 1
fi

# Count lines
TOTAL_LINES=$(wc -l < "$LOGFILE")
INFO_LINES=$(grep -c "INFO" "$LOGFILE")
WARN_LINES=$(grep -c "WARN" "$LOGFILE")
ERROR_LINES=$(grep -c "ERROR" "$LOGFILE")

echo "Total lines: $TOTAL_LINES"
echo "INFO lines:  $INFO_LINES"
echo "WARN lines:  $WARN_LINES"
echo "ERROR lines: $ERROR_LINES"
