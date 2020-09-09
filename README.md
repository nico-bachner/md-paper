# Markdown to PDF

Personalised and simplified markdown to pdf (via LaTeX) converter based on [Pandoc](https://pandoc.org) and [pdflatex](https://www.latex-project.org)

## How to use

1. Install Pandoc and a TeX distribution
2. [optional, but recommended] Add the following to your zsh config (.zshrc):
```
alias bot='cd /Users/nico/desktop/codm-lu-bot && npm start'
alias build='
	pandoc essay.md --template=template.latex -o latex/essay.tex && 
	cd latex && 
	pdflatex essay.tex && 
	pdflatex essay.tex &&
	mv essay.pdf .. &&
	cd ..
'
```
3. Delete content from essay.md that you don't need
4. Start writing :smile:
5. To generate the pdf, go to your terminal and type `build` (only works if you're already in the project directory)
