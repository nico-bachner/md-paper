#!/bin/sh

echo

DOCUMENT=$1

pdf=true

if [ "$2" = "latex-only" ]
then
  pdf=false
fi

if [ "$2" = "latex" ]
then
  latex=true
fi
if [ "$2" = "toc" ]
then
  toc=true
fi
if [ "$2" = "log" ]
then
  log=true
fi
if [ "$2" = "aux" ]
then
  aux=true
fi
if [ "$2" = "bib" ]
then
  bib=true
fi

# Remove old files
if [ -e ${DOCUMENT}.pdf ]
then
  rm ${DOCUMENT}.pdf
fi
if [ -e ${DOCUMENT}.tex ]
then
  rm ${DOCUMENT}.tex
fi

# Make script find the template.latex file from lower file levels
WD=$(PWD)
D=""
DU="../"
while true
do
  if [ -e template.latex ]
  then
    cd $WD
    break
  fi
  cd ..
  D="$DU$D"
done

# Conversion scripts
echo "Converting Markdown to LaTeX"
pandoc -f markdown ${DOCUMENT}.md --template=${D}template.latex -t latex -o ${DOCUMENT}.tex
if [ -e *.tex ]
then
  echo "  Success!"
else
  echo "An error occurred while converting Markdown to LaTeX"
  exit 1
fi

if [ $pdf = true ]
then
  if [ -e *.bib ] || [ -e *.bibtex ]
  then
    echo "\nProcessing bibliography"

    pdflatex ${DOCUMENT}.tex >pdf.log
    if [ -e ${DOCUMENT}.pdf ]
    then
      echo "  Almost done..."
    else
      echo "There are errors in your file.\nPlease consult the log.txt for more information"
      exit 1
    fi

    bibtex ${DOCUMENT}.aux >bib.log
    if [ -e ${DOCUMENT}.pdf ]
    then
      echo "  Success!"
    else
      echo "There are errors in your file.\nPlease consult the log.txt for more information"
      exit 1
    fi
  fi

  echo "\nConverting LaTeX to PDF"
  pdflatex ${DOCUMENT}.tex >pdf.log
  if [ -e ${DOCUMENT}.pdf ]
  then
    echo "  50% complete..."
  else
    echo "There are errors in your file.\nPlease consult the log.txt for more information"
    exit 1
  fi
  pdflatex ${DOCUMENT}.tex >pdf.log

  if [ -e ${DOCUMENT}.pdf ]
  then
    echo "  Success!"
  else
    echo "  PDF build failed.\n"
    echo "This is most likely an error in your LaTeX commands.\nPerhaps you misspelt a command or package name?\nFor additional information consult pdfLaTeX's logs."
    exit 1
  fi

  # Delete auxiliary files if they exist
  if [ "$latex" = true ] || [ "$log" = true ] || [ "$aux" = true ] || [ "$toc" = true ] || [ "$bib" = true ]
  then
    echo "\nKept the following files:"
  fi

  if [ "$latex" = true ]
  then
    echo "  ${DOCUMENT}.tex"
  else
    if [ -e ${DOCUMENT}.tex ]
    then
      rm ${DOCUMENT}.tex
    fi
  fi
    
  if [ "$log" = true ]
  then
    echo "  ${DOCUMENT}.log"
    echo "  pdf.log"
  else
    if [ -e ${DOCUMENT}.log ]
    then
      rm ${DOCUMENT}.log
      rm pdf.log
    fi
  fi

  if [ "$aux" = true ]
  then
    echo "  ${DOCUMENT}.aux & ${DOCUMENT}.aux"
  else
    if [ -e ${DOCUMENT}.aux ]
    then
      rm ${DOCUMENT}.aux
    fi
    if [ -e ${DOCUMENT}.out ]
    then
      rm ${DOCUMENT}.out
    fi
  fi

  if [ "$toc" = true ]
  then
    echo "  ${DOCUMENT}.toc"
  else
    if [ -e ${DOCUMENT}.toc ]
    then
      rm ${DOCUMENT}.toc
    fi
  fi

  if [ "$bib" = true ]
  then
    echo "  ${DOCUMENT}.bib"
  else
    # Delete aux bibliography build files if a bibliography exists
    if [ -e *.bib ] || [ -e *.bibtex ]
    then
      rm ${DOCUMENT}.bbl
      rm ${DOCUMENT}.blg
      rm bib.log
    fi
  fi

  if [ "$texput" = true ]
  then
    echo "  texput.log"
  else
    # Delete texput.log if exists
    if [ -e texput.log ]
    then
      rm texput.log
    fi
  fi
fi

echo