#!/bin/sh

echo

DOCUMENT=$1

pdf=true

if [ "$2" = "latex-only" ]
then
  pdf=false
fi

if [ "$2" = "latex" ] || [ "$3" = "latex" ]
then
  latex=true
fi

if [ "$2" = "log" ] || [ "$3" = "log" ]
then
  log=true
fi

if [ "$2" = "all-log" ] || [ "$3" = "all-log" ]
then
  log=true
  toc=true
  aux=true
  bib=true
fi
if [ "$2" = "toc" ] || [ "$3" = "toc" ] || [ "$4" = "toc" ] || [ "$5" = "toc" ]
then
  toc=true
fi
if [ "$2" = "aux" ] || [ "$3" = "aux" ] || [ "$4" = "aux" ] || [ "$5" = "toc" ]
then
  aux=true
fi
if [ "$2" = "bib" ] || [ "$3" = "bib" ] || [ "$4" = "bib" ] || [ "$5" = "toc" ]
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

sleep 0.5s

function loading5_95 {
  echo "#                    |   5%\r\c"
  sleep $1
  echo "##                   |  10%\r\c"
  sleep $1
  echo "###                  |  15%\r\c"
  sleep $1
  echo "####                 |  20%\r\c"
  sleep $1
  echo "#####                |  25%\r\c"
  sleep $1
  echo "######               |  30%\r\c"
  sleep $1
  echo "#######              |  35%\r\c"
  sleep $1
  echo "########             |  40%\r\c"
  sleep $1
  echo "#########            |  45%\r\c"
  sleep $1
  echo "##########           |  50%\r\c"
  sleep $1
  echo "###########          |  55%\r\c"
  sleep $1
  echo "############         |  60%\r\c"
  sleep $1
  echo "#############        |  65%\r\c"
  sleep $1
  echo "##############       |  70%\r\c"
  sleep $1
  echo "###############      |  75%\r\c"
  sleep $1
  echo "################     |  80%\r\c"
  sleep $1
  echo "#################    |  85%\r\c"
  sleep $1
  echo "##################   |  90%\r\c"
  sleep $1
  echo "###################  |  95%\r\c"
  sleep $1
}

# Conversion scripts
echo "Converting Markdown to LaTeX"
loading5_95 0.05s
pandoc -f markdown ${DOCUMENT}.md --template=${D}template.latex -t latex -o ${DOCUMENT}.tex

if [ -e *.tex ]
then
  echo "#################### | 100%"
  sleep 0.5s
else
  echo "An error occurred while converting Markdown to LaTeX"
  echo
  exit 1
fi

function pdfGenError () {
  echo "  PDF build failed."
  echo
  echo "This is most likely an error in your LaTeX commands."
  echo "Perhaps you misspelt a command or package name?"
  echo "For additional information, consult pdfLaTeX's logs (pdf.log)."
  exit 1
}

if [ $pdf = true ]
then
  if [ -e *.bib ] || [ -e *.bibtex ]
  then
    echo "Processing bibliography"

    loading5_45 0.25 &
    pdflatex ${DOCUMENT}.tex >pdf.log
    bibtex ${DOCUMENT}.aux >bib.log

    if [ -e ${DOCUMENT}.pdf ]
    then
      echo "#################### | 100%"
      rm ${DOCUMENT}.pdf
    else
      pdfGenError
    fi
  fi

  sleep 0.5s
  echo
  echo "Converting LaTeX to PDF"

  loading5_95 0.3s &
  pdflatex ${DOCUMENT}.tex >pdf.log
  rm ${DOCUMENT}.pdf
  pdflatex ${DOCUMENT}.tex >pdf.log
  
  if [ -e ${DOCUMENT}.pdf ]
  then
    sleep 0.3s
    echo "#################### | 100%"
  else
    pdfGenError
  fi

  # Delete auxiliary files if they exist
  if [ "$latex" = true ] || [ "$log" = true ] || [ "$aux" = true ] || [ "$toc" = true ] || [ "$bib" = true ]
  then
    sleep 0.5s
    echo
    echo "Kept the following files:"
  fi

  if [ "$latex" = true ]
  then
    echo " - ${DOCUMENT}.tex"
  else
    if [ -e ${DOCUMENT}.tex ]
    then
      rm ${DOCUMENT}.tex
    fi
  fi
    
  if [ "$log" = true ]
  then
    echo " - ${DOCUMENT}.log"
    echo " - pdf.log"
  else
    if [ -e ${DOCUMENT}.log ]
    then
      rm ${DOCUMENT}.log
      rm pdf.log
    fi
  fi

  if [ "$aux" = true ]
  then
    echo " - ${DOCUMENT}.aux"
    echo " - ${DOCUMENT}.aux"
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
    echo " - ${DOCUMENT}.toc"
  else
    if [ -e ${DOCUMENT}.toc ]
    then
      rm ${DOCUMENT}.toc
    fi
  fi

  if [ "$bib" = true ]
  then
    echo " - ${DOCUMENT}.bib"
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
    echo " - texput.log"
  else
    # Delete texput.log if exists
    if [ -e texput.log ]
    then
      rm texput.log
    fi
  fi
fi

sleep 0.5s

echo