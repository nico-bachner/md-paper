#!/bin/sh

FILE=$2

mkdir ${FILE}-build
pandoc ${FILE}.md --template=template.latex -o ${FILE}-build/${FILE}.tex && 
cd ${FILE}-build && 
pdflatex ${FILE}.tex && 
pdflatex ${FILE}.tex &&
mv ${FILE}.pdf .. &&
cd ..

if [ $1 = "d" ]
then
  rm -R ${FILE}-build
fi

if [ -e ${FILE}.pdf ]
then
  echo "--- Success! ---"
fi