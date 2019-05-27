#!/usr/bin/env bash

mainFile=$1
pdfName=$2

echo "Setting pdf name to ${pdfName}"

echo "Checking file existance for ${pdfName}"
# remove pdfs if present
[ -f "${pdfName}" ] && rm "${pdfName}" && echo "removed already existing PDF"

# test if pdf still exists
[ -f "${pdfName}" ] && echo "PDF is still there! Failing build!" && exit 1


# build pdf
echo ""
echo "Building PDF using pdflatex and biber on ${mainFile}.tex"
pdflatex -synctex=1 -interaction=nonstopmode -shell-escape "${mainFile}.tex"
pdflatex -synctex=1 -interaction=nonstopmode -shell-escape "${mainFile}.tex"
biber "${mainFile}"
pdflatex -synctex=1 -interaction=nonstopmode -shell-escape "${mainFile}.tex"

# only exit successfully if pdf was build successfully
if [ -f "${mainFile}.pdf" ]; then
  echo "Build successfully produced PDF"
  mv "${mainFile}.pdf" "${pdfName}"
  exit 0
else
  exit 1
fi
