#!/bin/bash

LOGFILE=${1:-"/var/log/messages"}
KEYWORD=${2:-"error"}

echo "======================================"
echo "        LOG FILE ANALYZER"
echo "======================================"
echo "File: $LOGFILE"
echo "Keyword: $KEYWORD"
echo ""

if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found or not readable."
    exit 1
fi

MATCHES=$(grep -i "$KEYWORD" "$LOGFILE")
COUNT=$(echo "$MATCHES" | grep -c .)

echo "Keyword '$KEYWORD' found $COUNT times"
echo ""

echo "Last 5 Matching Lines:"
echo "$MATCHES" | tail -5
