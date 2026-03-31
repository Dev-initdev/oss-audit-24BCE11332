#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Devang | Course: Open Source Software

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "========================================"
echo " Directory Audit Report"
echo " Generated: $(date '+%d %B %Y %H:%M:%S')"
echo "========================================"
echo ""
printf "%-20s %-20s %-10s\n" "Directory" "Permissions/Owner" "Size"
echo "------------------------------------------------------------"

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3":"$4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        printf "%-20s %-20s %-10s\n" "$DIR" "$PERMS ($OWNER)" "${SIZE:-N/A}"
    else
        printf "%-20s %-20s\n" "$DIR" "[does not exist]"
    fi
done

echo ""
echo "========================================"
echo " Firefox Config Directory Check"
echo "========================================"
echo ""

FIREFOX_CONFIG="$HOME/.mozilla/firefox"

if [ -d "$FIREFOX_CONFIG" ]; then
    echo "  Firefox config found at: $FIREFOX_CONFIG"
    echo ""
    PERMS=$(ls -ld "$FIREFOX_CONFIG" | awk '{print $1}')
    OWNER=$(ls -ld "$FIREFOX_CONFIG" | awk '{print $3":"$4}')
    SIZE=$(du -sh "$FIREFOX_CONFIG" 2>/dev/null | cut -f1)
    echo "  Permissions : $PERMS"
    echo "  Owner       : $OWNER"
    echo "  Size        : ${SIZE:-N/A}"
    echo ""
    echo "  Why permissions matter: Firefox config holds saved passwords,"
    echo "  session data, and cookies. It should only be readable by the"
    echo "  owner (700 or 600). If other users can read it, that is a"
    echo "  serious privacy and security risk."
else
    echo "  Firefox config directory not found at $FIREFOX_CONFIG"
    echo "  Either Firefox is not installed or has never been launched."
fi

echo ""
echo "========================================"
