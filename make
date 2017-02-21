#!/bin/bash
# Generate a one paged version

# Render latex pages

latexmk -pdf -pvc- -output-directory='output' tables.tex
latexmk -c -output-directory='output' tables.tex

# Convert Inkscape pages to PDF

inkscape -z -f lmw.svg -A output/lmw.pdf --export-area-page
inkscape -z -f rmw.svg -A output/rmw.pdf --export-area-page

# Combine pages and clean output

cd output

pdfunite lmw.pdf rmw.pdf 'Kangaroo Point Map'.pdf

mv tables.pdf 'Kangaroo Point Ticklist'.pdf

rm lmw.pdf rmw.pdf
