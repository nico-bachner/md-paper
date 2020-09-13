#!/bin/sh

PROJECT=$1
FILE=$2

cd $PROJECT
mkdir ${FILE}-build
pandoc ${FILE}.md --template=../template.latex -o ${FILE}-build/${FILE}.tex
cp bibliography.bib ${FILE}-build/

cd ${FILE}-build
pdflatex ${FILE}.tex
bibtex ${FILE}.aux
pdflatex ${FILE}.tex
pdflatex ${FILE}.tex
mv ${FILE}.pdf ..
cd ..

if [ $3 = "pdf-only" ]
then
  rm -R ${FILE}-build
fi

if [ -e ${FILE}.pdf ]
then
  echo "--- Success! ---"
fi