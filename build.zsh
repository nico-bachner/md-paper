!/bin/zsh

pandoc essay.md --template=template.latex -o latex/essay.tex && 
cd latex && 
pdflatex essay.tex && 
pdflatex essay.tex &&
mv essay.pdf .. &&
cd ..
