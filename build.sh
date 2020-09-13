#!/bin/sh

PROJECT=$1
FILE=$2

cd $PROJECT
mkdir ${FILE}-build
pandoc ${FILE}.md --template=../template.latex -o ${FILE}.tex
cp bibliography.bib ${FILE}-build/

cd ${FILE}-build
pdflatex ../${FILE}.tex
bibtex ../${FILE}.aux
pdflatex ../${FILE}.tex
pdflatex ../${FILE}.tex
mv ${FILE}.pdf ..
cd ..

if [ $3 = "keep-all" ]
then
  echo "Keeping build files"
elif [ $3 = "keep-tex" ]
then
  rm -R ${FILE}-build
  echo "Keeping latex document"
else
  rm -R ${FILE}-build
  rm ${FILE}.tex
fi

if [ -e ${FILE}.pdf ]
then
  echo "--- PDF build succeeded! ---"
fi