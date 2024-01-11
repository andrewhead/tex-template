#!/bin/bash
# Detect which citation keys were not used from a particular bib file.
# Example usage: [this-script-name] main.aux references.bib
# An optional third argument is the citation command that appears in the
# '.aux' file. The default is "bibcite" (used in my template for NSF
# proposals). ACM papers use "citation".
# This script was adapted from https://tex.stackexchange.com/a/43282/198728

auxfile=$1
bibfile=$2
citation_command=${3:-bibcite}

# Extract citation keys from aux file.
echo $citation_command
cat $auxfile |\
  grep "\\\\${citation_command}" |\
  sed -e "s/\\\\${citation_command}{\\([^{}]*\\)}.*/\\1/g" |\
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
