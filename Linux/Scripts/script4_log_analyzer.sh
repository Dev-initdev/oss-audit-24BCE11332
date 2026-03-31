#!/bin/bash
# Script 4: Log File Analyzer
# Author: Devang | Course: Open Source Software
# Description: Reads a log file line by line, counts lines matching a keyword,
#              and prints the last 5 matching lines.
# Usage: ./script4_log_analyzer.sh /path/to/logfile [keyword]


LOGFILE=$1
KEYWORD=${2:-"error"}   
COUNT=0
MATCHES=()  


if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/syslog error"
    exit 1
fi

if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    exit 1
fi

RETRY=0
while [ ! -s "$LOGFILE" ]; do
    if [ $RETRY -ge 2 ]; then
        echo "File '$LOGFILE' is still empty after checks. Exiting."
        exit 1
    fi
    echo "Warning: '$LOGFILE' appears to be empty. Retrying check... ($((RETRY+1))/2)"
    sleep 1
    RETRY=$((RETRY + 1))
done

echo "========================================"
echo " Log File Analyzer"
echo " File    : $LOGFILE"
echo " Keyword : $KEYWORD"
echo " Started : $(date '+%H:%M:%S')"
echo "========================================"
echo ""

while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
        MATCHES+=("$LINE")
    fi
done < "$LOGFILE"

# --- Summary output ---
echo "  Total lines scanned  : $(wc -l < "$LOGFILE")"
echo "  Keyword matches found: $COUNT"
echo ""

if [ $COUNT -gt 0 ]; then
    echo "  Last 5 matching lines:"
    echo "  ----------------------------------------"
    TOTAL=${#MATCHES[@]}
    START=$(( TOTAL > 5 ? TOTAL - 5 : 0 ))
    for (( i=START; i<TOTAL; i++ )); do
        echo "  >> ${MATCHES[$i]}"
    done
else
    echo "  No lines matched the keyword '$KEYWORD'."
fi

echo ""
echo "========================================"
