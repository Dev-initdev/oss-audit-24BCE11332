#!/bin/bash
# Script 1: System Identity Report
# Author: Devang Atiyolil| Course: Open Source Software
# Description: Displays a welcome screen with system info and OSS license details


STUDENT_NAME="Devang ATIYOLIL"
SOFTWARE_CHOICE="Firefox"

KERNEL=$(uname -r)
USER_NAME=$(whoami)
UPTIME=$(uptime -p)
CURRENT_DATE=$(date '+%A, %d %B %Y %H:%M:%S')
HOME_DIR=$HOME

if [ -f /etc/os-release ]; then
    DISTRO=$(grep ^PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')
else
    DISTRO="Unknown Linux Distro"
fi

# --- Display output ---
echo "========================================================"
echo "        Open Source Audit -- $STUDENT_NAME"
echo "        Chosen Software  : $SOFTWARE_CHOICE"
echo "========================================================"
echo ""
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  Logged in as : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date & Time  : $CURRENT_DATE"
echo ""
echo "--------------------------------------------------------"
# Linux kernel itself is licensed under GPL v2
echo "  License Note : The Linux kernel running this system"
echo "                 is covered under the GNU General"
echo "                 Public License version 2 (GPL v2)."
echo "                 Source code is freely available at"
echo "                 kernel.org"
echo "--------------------------------------------------------"
echo ""
echo "  Firefox, your chosen OSS project, is licensed under"
echo "  the Mozilla Public License 2.0 (MPL 2.0)."
echo "========================================================"
