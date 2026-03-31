#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Devang Atiyolil | Course: Open Source Software
# Description: Checks if a FOSS package is installed, shows its details,
#              and prints a philosophy note based on the package name.

# The package name to inspect -- change this to match your system package name
# On Debian/Ubuntu: firefox or firefox-esr
# On Fedora/RHEL:   firefox
PACKAGE="firefox"

echo "========================================"
echo " FOSS Package Inspector"
echo "========================================"
echo ""


if command -v dpkg &>/dev/null; then
   
    if dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then
        echo "[INSTALLED] $PACKAGE is installed on this system."
        echo ""
        echo "Package details:"
        dpkg -l "$PACKAGE" | grep "^ii" | awk '{print "  Version : "$3"\n  Arch    : "$4}'
        
        dpkg -s "$PACKAGE" 2>/dev/null | grep -E "^(Version|Maintainer|Homepage|Description)" | sed 's/^/  /'
    else
        echo "[NOT FOUND] $PACKAGE is NOT installed."
        echo "  To install, run: sudo apt install $PACKAGE"
    fi

elif command -v rpm &>/dev/null; then
    # rpm-based system
    if rpm -q "$PACKAGE" &>/dev/null; then
        echo "[INSTALLED] $PACKAGE is installed on this system."
        echo ""
        echo "Package details:"
        rpm -qi "$PACKAGE" | grep -E 'Version|License|Summary|URL' | sed 's/^/  /'
    else
        echo "[NOT FOUND] $PACKAGE is NOT installed."
        echo "  To install, run: sudo dnf install $PACKAGE"
    fi

else
    
    if command -v firefox &>/dev/null; then
        echo "[FOUND] firefox binary found at: $(which firefox)"
        firefox --version 2>/dev/null || echo "  (could not retrieve version)"
    else
        echo "[NOT FOUND] Neither dpkg nor rpm found. Cannot check package status."
    fi
fi

echo ""
echo "========================================"
echo " Philosophy Notes"
echo "========================================"
echo ""


case $PACKAGE in
    firefox | firefox-esr)
        echo "  Firefox: Mozilla's open-source browser built on the"
        echo "  belief that the internet should stay open and free."
        echo "  It exists because a nonprofit decided profit should"
        echo "  not come before user privacy and web standards."
        ;;
    httpd | apache2)
        echo "  Apache: the web server that helped build the open internet."
        echo "  It proved that collaborative, volunteer-driven software"
        echo "  could outperform anything a single company could ship."
        ;;
    mysql | mariadb)
        echo "  MySQL/MariaDB: open source at the core of millions of apps."
        echo "  MariaDB itself is a story of a community fork when users"
        echo "  feared Oracle's acquisition would close the source."
        ;;
    vlc)
        echo "  VLC: started by students in Paris who just wanted to"
        echo "  watch TV over their university network. Now it plays"
        echo "  literally everything -- a gift to the whole world."
        ;;
    git)
        echo "  Git: Linus Torvalds built it in two weeks after BitKeeper"
        echo "  revoked its free license. The best tools often come from"
        echo "  necessity, and from refusing to accept closed-source limits."
        ;;
    python3 | python)
        echo "  Python: shaped entirely by its community through PEPs."
        echo "  It shows that good design and open collaboration produce"
        echo "  a language that eventually dominates every field it touches."
        ;;
    libreoffice)
        echo "  LibreOffice: born from a community fork of OpenOffice"
        echo "  when Oracle took over Sun. The fork was a declaration that"
        echo "  the community, not a corporation, owns the project."
        ;;
    *)
        echo "  $PACKAGE: an open-source tool chosen freely, shared freely."
        echo "  Every OSS project carries the idea that knowledge belongs"
        echo "  to everyone who can use it."
        ;;
esac

echo ""
echo "========================================"
