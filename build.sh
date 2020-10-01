#!/bin/sh

PROJECT=$1

cd $PROJECT
pandoc ${PROJECT}.md --template=../template.latex -o ${PROJECT}.tex

if [ -e *.bib ] || [ -e *.bibtex ]
then
  pdflatex ${PROJECT}.tex
  bibtex ${PROJECT}.aux
fi

pdflatex ${PROJECT}.tex
pdflatex ${PROJECT}.tex

if [ "$2" == "keep-all" ]
then
  echo "Keeping build files"
elif [ "$2" == "keep-tex" ]
then
  rm ${PROJECT}.aux
  rm ${PROJECT}.log
  rm ${PROJECT}.out
  rm ${PROJECT}.toc

  if [ -e *.bib ] || [ -e *.bibtex ]
  then
    rm ${PROJECT}.bbl
    rm ${PROJECT}.blg
  fi

  echo "Keeping latex document"
else
  rm ${PROJECT}.aux
  rm ${PROJECT}.log
  rm ${PROJECT}.out
  rm ${PROJECT}.toc

  if [ -e *.bib ] || [ -e *.bibtex ]
  then
    rm ${PROJECT}.bbl
    rm ${PROJECT}.blg
  fi
  
  rm ${PROJECT}.tex
fi

if [ -e ${PROJECT}.pdf ]
then
  echo "--- PDF build succeeded! ---"
fi