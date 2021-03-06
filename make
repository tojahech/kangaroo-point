#!/bin/bash
# Generate a one paged version

# Render latex pages

latexmk -pdf -pvc- -output-directory='output' tables.tex
latexmk -c -output-directory='output' tables.tex

# Render master image for web use

inkscape -z -f master.svg -l output/entire-cliff.svg --export-area-page
cp output/entire-cliff.svg docs/entire-cliff.svg

# Convert Inkscape pages to PDF

inkscape -z -f lmw.svg -A output/lmw.pdf --export-area-page
inkscape -z -f rmw.svg -A output/rmw.pdf --export-area-page

# Combine pages and clean output

cd output

pdfunite lmw.pdf rmw.pdf 'Kangaroo Point Map'.pdf

mv tables.pdf 'Kangaroo Point Ticklist'.pdf

rm lmw.pdf rmw.pdf
