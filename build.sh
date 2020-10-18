#!/bin/sh

DOCUMENT=$1

pdf=true

if [ "$2" = "latex-only" ]
then
  pdf=false
fi

if [ "$2" = "latex" ] || [ "$3" = "latex" ] || [ "$4" = "latex" ]
then
  latex=true
fi

if [ "$2" = "log" ] || [ "$3" = "log" ] || [ "$4" = "log" ]
then
  log=true
fi

if [ "$2" = "log-all" ] || [ "$3" = "log-all" ] || [ "$4" = "log-all" ]
then
  log=true
  toc=true
  aux=true
  bib=true
  lof=true
  lot=true
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

function loading1 {
  echo
  echo $2
  sleep $1
  echo "                     |   0%\r\c"
  sleep $1
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
}
function loading2 {
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

function pdfGenError () {
  echo "  PDF build failed."
  echo
  echo "This is most likely an error in your LaTeX commands."
  echo "Perhaps you misspelt a command or package name?"
  echo "For additional information, consult pdfLaTeX's logs (pdf.log)."
  exit 1
}

# Conversion scripts
pandoc -f markdown ${DOCUMENT}.md --template=${D}template.latex -t latex -o ${DOCUMENT}.tex

if [ -e *.tex ]
then
  loading1 0.05s "Converting Markdown to LaTeX"
  echo "##########           |  50%\r\c"
  loading2 0.1s
  echo "#################### | 100%"
else
  echo "An error occurred while converting Markdown to LaTeX"
  echo
  exit 1
fi

if [ $pdf = true ]
then
  if [ -e *.bib ] || [ -e *.bibtex ]
  then
    loading1 0.25s "Processing bibliography" &
    pdflatex ${DOCUMENT}.tex >pdf.log
    if [ -e ${DOCUMENT}.pdf ]
    then
      echo "##########           |  50%\r\c"
      rm ${DOCUMENT}.pdf
    else
      pdfGenError
    fi
    loading2 0.1s &
    bibtex ${DOCUMENT}.aux >bib.log
    if [ -e ${DOCUMENT}.pdf ]
    then
      echo "#################### | 100%"
      rm ${DOCUMENT}.pdf
    else
      pdfGenError
    fi
  fi

  # Make PDF from LaTeX
  loading1 0.25s "Converting LaTeX to PDF" &
  pdflatex ${DOCUMENT}.tex >pdf.log
  if [ -e ${DOCUMENT}.pdf ]
  then
    echo "##########           |  50%\r\c"
  else
    pdfGenError
  fi
  loading2 0.3s &
  pdflatex ${DOCUMENT}.tex >pdf.log
  if [ -e ${DOCUMENT}.pdf ]
  then
    echo "#################### | 100%"
  else
    pdfGenError
  fi

  # Delete auxiliary files if they exist
  if [ "$latex" = true ] || [ "$log" = true ]
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
    echo " - ${DOCUMENT}.out"
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

  if [ "$lof" = true ]
  then
    echo " - ${DOCUMENT}.lof"
  else
    if [ -e ${DOCUMENT}.lof ]
    then
      rm ${DOCUMENT}.lof
    fi
  fi

  if [ "$lot" = true ]
  then
    echo " - ${DOCUMENT}.lot"
  else
    if [ -e ${DOCUMENT}.lot ]
    then
      rm ${DOCUMENT}.lot
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