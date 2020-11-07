#!/bin/ksh

function error {
  echo $1
  exit 1
}

PROGRAM_NAME="md-paper"
ROOT_CONTAINER="/usr/local"
ROOT_DIRECTORY="${ROOT_CONTAINER}/${PROGRAM_NAME}"

# gives option to update without reinstalling
if [ $1 = "update" ]
then
  cd $ROOT_DIRECTORY
  sudo git fetch origin master
  sudo git reset --hard origin/master
  exit 0
fi

function uninstall {
  cd ${ROOT_CONTAINER}
  sudo rm /usr/local/bin/md-paper
  sudo rm -rf md-paper
}

# reinstall everything
if [ $1 = "reinstall" ]
then
  uninstall
  curl https://md-paper.now.sh/install | sh
  exit 0
fi

# uninstall everything
if [ $1 = "uninstall" ]
then
  uninstall
  exit 0
fi

DOCUMENT=$1
PROJECT_DIRECTORY=$(PWD)

if [ ! -e ${DOCUMENT}.md ]
then
  error "File doesn't exist"
  exit 1
fi

function loading {
  echo
  echo "$2"
  
  STEP_SIZE=2
  MAX_LOAD=100
  TOTAL_STEPS=$((MAX_LOAD / STEP_SIZE))
  
  for ((k = 0; k < $TOTAL_STEPS ; k++))
  do
    echo -n "[ "
    for ((i = 0 ; i < k; i++))
    do 
      echo -n "#"
    done
    for (( j = i ; j < $TOTAL_STEPS ; j++ ))
    do
      echo -n " "
    done
    echo -n " ] "
    
    STEP=$((k * STEP_SIZE))
    echo -n "${STEP} %" $'\r'

    R=$(( RANDOM % 20 ))
    DELAY=$(( R * $1 ))
    sleep ${DELAY}s
  done
}

function pdfGenError {
  error "PDF build failed"
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

if [ "$2" = "latex" ] || [ "$3" = "latex" ] || [ "$4" = "latex" ]
then
  latex=true
fi

if [ "$2" = "log" ] || [ "$3" = "log" ] || [ "$4" = "log" ]
then
  log=true
fi

if [ "$2" = "aux" ] || [ "$3" = "aux" ] || [ "$4" = "aux" ]
then
  aux=true
fi

# convert from md to tex using pandoc
loading 0.005 "Converting Markdown to LaTeX" &
pandoc -f markdown ${DOCUMENT}.md --template=${ROOT_DIRECTORY}/src/template.tex -t latex -o ${DOCUMENT}.tex &
wait

# check if successful
if [ -e *.tex ]
then
  echo "[ ################################################## ] 100 %"
else
  error "An error occurred while converting Markdown to LaTeX"
fi

# check if bibliography exists
# if yes, process it
if [ -e *.bib ] || [ -e *.bibtex ]
then
  loading 0.01 "Preparing bibliography" &
  pdflatex ${DOCUMENT}.tex >pdf.log &
  wait
  if [ -e ${DOCUMENT}.pdf ]
  then
    rm ${DOCUMENT}.pdf
    echo "[ ################################################## ] 100 %"
  else
    pdfGenError
  fi
  
  loading 0.005 "Processing bibliography" &
  bibtex ${DOCUMENT}.aux >bib.log &
  wait
  if [ -e ${DOCUMENT}.pdf ]
  then
    rm ${DOCUMENT}.pdf
    echo "[ ################################################## ] 100 %"
  else
    pdfGenError
  fi
  
  if [ -e ${DOCUMENT}.bbl ]
  then
    if [ "$aux" = true ]
    then
      echo " - ${DOCUMENT}.bbl"
    else
      rm ${DOCUMENT}.bbl
    fi
  fi
  if [ -e ${DOCUMENT}.blg ]
  then
    if [ "$aux" = true ]
    then
      echo " - ${DOCUMENT}.blg"
    else
      rm ${DOCUMENT}.blg
    fi
  fi
  if [ -e bib.log ] && [ "$aux" = true ]
  then
    echo " - bib.log"
  elif [ -e bib.log ]
    rm bib.log
  fi

# convert latex to pdf using pdflatex
loading 0.01 "Preparing Conversion from LaTeX to PDF" &
pdflatex ${DOCUMENT}.tex >pdf.log &
wait
if [ -e ${DOCUMENT}.pdf ]
then
  rm ${DOCUMENT}.pdf
  echo "[ ################################################## ] 100 %"
else
  pdfGenError
fi

# pdflatex needs to repeat the process to account for the processing of table of contents and similar environments
loading 0.01 "Converting LaTeX to PDF" &
pdflatex ${DOCUMENT}.tex >pdf.log &
wait
if [ -e ${DOCUMENT}.pdf ]
then
  echo "[ ################################################## ] 100 %"
else
  pdfGenError
fi

# Delete build files generated by pdflatex if they exist
if [ "$latex" = true ] || [ "$log" = true ] || [ "$LOG" = true ]
then
  echo "Kept the following files:"
else
  echo
  exit 0
fi

if [ -e ${DOCUMENT}.tex ]
then
  if [ "$latex" = true ]
  then
    echo " - ${DOCUMENT}.tex"
  else
    rm ${DOCUMENT}.tex
  fi
fi
  
if [ -e ${DOCUMENT}.log ]
then
  if [ "$log" = true ]
  then
    echo " - ${DOCUMENT}.log"
  else
    rm ${DOCUMENT}.log
  fi
fi

if [ -e pdf.log ]
then
  if [ "$log" = true ]
  then
    echo " - pdf.log"
  else
    rm pdf.log
  fi
fi

if [ -e ${DOCUMENT}.aux ]
then
  if [ "$aux" = true ]
  then
    echo " - ${DOCUMENT}.aux"
  else
    rm ${DOCUMENT}.aux
  fi
fi

if [ -e ${DOCUMENT}.out ]
then
  if [ "$aux" = true ]
  then
    echo " - ${DOCUMENT}.out"
  else
    rm ${DOCUMENT}.out
  fi
fi

if [ -e ${DOCUMENT}.toc ]
then
  if [ "$aux" = true ]
  then
    echo " - ${DOCUMENT}.toc"
  else
    rm ${DOCUMENT}.toc
  fi
fi

if [ -e ${DOCUMENT}.lof ]
then
  if [ "$aux" = true ]
  then
    echo " - ${DOCUMENT}.lof"
  else
    rm ${DOCUMENT}.lof
  fi
fi

if [ -e ${DOCUMENT}.lot ]
then
  if [ "$aux" = true ]
  then
    echo " - ${DOCUMENT}.lot"
  else
    rm ${DOCUMENT}.lot
  fi
fi

if [ -e texput.log ]
then
  if [ "$aux" = true ]
  then
    echo " - texput.log"
  else
    rm texput.log
  fi
fi

echo
exit 0
