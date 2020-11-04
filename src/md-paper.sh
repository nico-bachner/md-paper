#!/bin/ksh

PROGRAM_NAME="md-paper"
ROOT_DIRECTORY="/usr/local/${PROGRAM_NAME}"

# gives option to update without reinstalling
if [ $1 = "update" ]
then
  cd $ROOT_DIRECTORY
  sudo git pull
  exit 0
fi

# uninstall everything
if [ $1 = "uninstall" ]
then
  cd /usr/local
  sudo rm bin/md-paper
  sudo rm -rf md-paper
  exit 0
fi

DOCUMENT=$1
PROJECT_DIRECTORY=$(PWD)

function error {
  echo "\n${1}\n"
  exit 1
}

function loading {
  echo
  echo "$2"
  for ((k = 0; k < 50 ; k++))
  do
    echo -n "[ "
    for ((i = 0 ; i < k; i++))
    do 
      echo -n "#"
    done
    for (( j = i ; j < 50 ; j++ ))
    do
      echo -n " "
    done
    echo -n " ] "

    v=$((k * 2))
    echo -n "$v %" $'\r'

    R=$(( RANDOM % 10 ))
    DELAY=$(( R * $1 ))
    sleep ${DELAY}s
  done
}

function pdfGenError {
  error "PDF build failed\nThis is most likely an error in your LaTeX commands\nFor additional information, consult pdfLaTeX's logs in pdf.log"
}

# Remove old files
if [ -e ${DOCUMENT}.pdf ]
then
  rm ${DOCUMENT}.pdf
fi
if [ -e ${DOCUMENT}.tex ]
then
  rm ${DOCUMENT}.tex
fi

# Conversion script
loading 0.01 "Converting Markdown to LaTeX"
pandoc -f markdown ${DOCUMENT}.md --template=${ROOT_DIRECTORY}/src/template.tex -t latex -o ${DOCUMENT}.tex

if [ -e *.tex ]
then
  echo "[ ################################################## ] 100 %"
else
  error "An error occurred while converting Markdown to LaTeX"
fi

if [ -e *.bib ] || [ -e *.bibtex ]
then
  loading 0.03 "Preparing bibliography" &
  pdflatex ${DOCUMENT}.tex >pdf.log
  if [ -e ${DOCUMENT}.pdf ]
  then
    echo "[ ################################################## ] 100 % "
    rm ${DOCUMENT}.pdf
  else
    pdfGenError
  fi
  loading 0.01 "Processing bibliography" &
  bibtex ${DOCUMENT}.aux >bib.log
  if [ -e ${DOCUMENT}.pdf ]
  then
    echo "[ ################################################## ] 100 %"
    rm ${DOCUMENT}.pdf
  else
    pdfGenError
  fi
fi

# Make PDF from LaTeX
loading 0.02 "Preparing Conversion from LaTeX to PDF" &
pdflatex ${DOCUMENT}.tex >pdf.log
if [ -e ${DOCUMENT}.pdf ]
then
  echo "[ ################################################## ] 100 %"
else
  pdfGenError
fi
loading 0.02 "Converting LaTeX to PDF" &
pdflatex ${DOCUMENT}.tex >pdf.log
if [ -e ${DOCUMENT}.pdf ]
then
  echo "[ ################################################## ] 100 %"
else
  pdfGenError
fi

# Delete auxiliary files if they exist
if [ "$2" = "latex" ] || [ "$3" = "latex" ] || [ "$4" = "latex" ]
then
  latex=true
fi

if [ "$2" = "log" ] || [ "$3" = "log" ] || [ "$4" = "log" ]
then
  log=true
fi

if [ "$2" = "LOG" ] || [ "$3" = "LOG" ] || [ "$4" = "LOG" ]
then
  log=true
  toc=true
  aux=true
  bib=true
  lof=true
  lot=true
fi
if [ "$latex" = true ] || [ "$log" = true ] || [ "$LOG" = true ]
then
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

echo
exit 0
