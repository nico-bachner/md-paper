# remove old file
delete tex

# pick first markdown the file finds
MD=$(find *.md)
# remove .md file name
FILE=${MD%.md}

# convert from md to tex using pandoc
pandoc -f markdown ${FILE}.md --template=/usr/local/md-paper/template.tex -t latex -o ${FILE}.tex

# check if successful
if [ ! -e *.md ]
then
    exit 1
fi