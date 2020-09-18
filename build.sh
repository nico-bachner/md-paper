#!/bin/sh

PROJECT=$1
FILE=$2

cd $PROJECT
pandoc ${FILE}.md --template=../template.latex -o ${FILE}.tex

pdflatex ${FILE}.tex
bibtex ${FILE}.aux
pdflatex ${FILE}.tex
pdflatex ${FILE}.tex

if [ $3 = "keep-all" ]
then
  echo "Keeping build files"
elif [ $3 = "keep-tex" ]
then
  rm ${FILE}.aux
  rm ${FILE}.log
  rm ${FILE}.out
  rm ${FILE}.toc
  rm ${FILE}.bbl
  rm ${FILE}.blg
  echo "Keeping latex document"
else
  rm ${FILE}.aux
  rm ${FILE}.log
  rm ${FILE}.out
  rm ${FILE}.toc
  rm ${FILE}.bbl
  rm ${FILE}.blg
  
  rm ${FILE}.tex
fi

if [ -e ${FILE}.pdf ]
then
  echo "--- PDF build succeeded! ---"
fi