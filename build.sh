#!/bin/sh

echo "
Which file would you like to build? 
(tell me 'example' instead of 'example.md')"

read FILE

pandoc ${FILE}.md --template=template.latex -o latex/${FILE}.tex && 
cd latex && 
pdflatex ${FILE}.tex && 
pdflatex ${FILE}.tex &&
mv ${FILE}.pdf .. &&
cd ..

echo "
--- Success! ---
"