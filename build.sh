#!/bin/sh

FILE=$1

mkdir ${FILE}-build
pandoc ${FILE}.md --template=template.latex -o ${FILE}-build/${FILE}.tex && 
cd ${FILE}-build && 
pdflatex ${FILE}.tex && 
pdflatex ${FILE}.tex &&
mv ${FILE}.pdf .. &&
cd ..

if [ $2 = "--pdf-only" ]
then
  rm -R ${FILE}-build
fi

if [ -e ${FILE}.pdf ]
then
  echo "--- Success! ---"
fi