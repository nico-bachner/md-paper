#!/bin/sh

PROJECT=$1

cd $PROJECT
pandoc ${PROJECT}.md --template=../template.latex -o ${PROJECT}.tex

pdflatex ${PROJECT}.tex
bibtex ${PROJECT}.aux
pdflatex ${PROJECT}.tex
pdflatex ${PROJECT}.tex

if [ $2 = "keep-all" ]
then
  echo "Keeping build PROJECTs"
elif [ $2 = "keep-tex" ]
then
  rm ${PROJECT}.aux
  rm ${PROJECT}.log
  rm ${PROJECT}.out
  rm ${PROJECT}.toc
  rm ${PROJECT}.bbl
  rm ${PROJECT}.blg
  echo "Keeping latex document"
else
  rm ${PROJECT}.aux
  rm ${PROJECT}.log
  rm ${PROJECT}.out
  rm ${PROJECT}.toc
  rm ${PROJECT}.bbl
  rm ${PROJECT}.blg
  
  rm ${PROJECT}.tex
fi

if [ -e ${PROJECT}.pdf ]
then
  echo "--- PDF build succeeded! ---"
fi