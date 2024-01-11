#!/bin/bash
# Detect which citation keys were not used from a particular bib file.
# Example usage: [this-script-name] main.aux references.bib
# This script was adapted from https://tex.stackexchange.com/a/43282/198728

auxfile=$1
bibfile=$2

# Extract citation keys from aux file.
cat $auxfile |\
  grep "\\\\bibcite" |\
  sed -e 's/\\bibcite{\([^{}]*\)}.*/\1/g' |\
  sort |\
  uniq > cited-papers.txt

cat $bibfile |
  grep "^@" |\
  sed -e 's/.*{\([^,]*\).*/\1/g' |\
  sort > bib-entries.txt

echo "Unused but defined references:"
diff cited-papers.txt bib-entries.txt | grep "^>"

# echo "Undefined but used references:"
# diff cited-papers.txt bib-entries.txt | grep "^<"
