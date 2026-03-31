#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Devang Atiyolil | Course: Open Source Software
# Description: Asks the user three questions and generates a personalised
#              open source philosophy statement, saved to a .txt file.



echo "========================================"
echo " Open Source Manifesto Generator"
echo " For: $(whoami)"
echo "========================================"
echo ""
echo "Answer three questions and your personal"
echo "open source manifesto will be generated."
echo ""

read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

DATE=$(date '+%d %B %Y')

OUTPUT="manifesto_$(whoami).txt"


echo "========================================"  > "$OUTPUT"
echo " OPEN SOURCE MANIFESTO"                   >> "$OUTPUT"
echo " Written by: $(whoami)"                   >> "$OUTPUT"
echo " Date: $DATE"                             >> "$OUTPUT"
echo "========================================"  >> "$OUTPUT"
echo ""                                          >> "$OUTPUT"

echo "I believe in software that is built to be shared." >> "$OUTPUT"
echo ""                                                   >> "$OUTPUT"
echo "Every day I rely on $TOOL, a tool that someone"    >> "$OUTPUT"
echo "built and gave away freely so that others could"   >> "$OUTPUT"
echo "stand on their work rather than reinvent it."      >> "$OUTPUT"
echo "That act, choosing to share instead of hoard,"     >> "$OUTPUT"
echo "is what I understand as $FREEDOM."                 >> "$OUTPUT"
echo ""                                                   >> "$OUTPUT"
echo "I commit to carrying that forward. One day I want" >> "$OUTPUT"
echo "to build $BUILD and release it as open source,"   >> "$OUTPUT"
echo "so that someone I will never meet can use it,"     >> "$OUTPUT"
echo "improve it, and pass it on."                       >> "$OUTPUT"
echo ""                                                   >> "$OUTPUT"
echo "Open source is not just a license. It is a"       >> "$OUTPUT"
echo "decision about what kind of world we want to"      >> "$OUTPUT"
echo "live in: one where knowledge belongs to everyone," >> "$OUTPUT"
echo "or one where it is locked behind profit."          >> "$OUTPUT"
echo ""                                                   >> "$OUTPUT"
echo "I choose open."                                     >> "$OUTPUT"
echo ""                                                   >> "$OUTPUT"
echo "-- $(whoami), $DATE"                               >> "$OUTPUT"
echo "========================================"           >> "$OUTPUT"

echo ""
echo "Manifesto saved to: $OUTPUT"
echo ""
echo "-------- Your Manifesto --------"
cat "$OUTPUT"
echo "--------------------------------"
