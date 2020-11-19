#!/bin/sh

# remove old file
if [ -e *.tex ]
then
    rm *.tex
fi

# pick first markdown the file finds
MD=$(find *.md)
# remove .md file name
FILE=${MD%.md}

# convert from md to tex using pandoc
pandoc -f markdown ${FILE}.md --template=${lib}/template.tex -t latex -o ${FILE}.tex

# check if successful
if [ -e *.md ]
then
    exit 0
else 
    ERROR "TeX build failed"
fi