# Markdown to PDF

Personalised and simplified markdown to pdf (via LaTeX) converter based on [Pandoc](https://pandoc.org) and [pdflatex](https://www.latex-project.org)

## How to use

1. Install Pandoc and a TeX distribution
2. [optional, but recommended] Add the following to your zsh config (.zshrc):
```
alias bot='cd /Users/nico/desktop/codm-lu-bot && npm start'
alias build='
	pandoc essay.md -s -o latex/essay.tex && 
	cd latex && 
	pdflatex essay.tex && 
	pdflatex essay.tex &&
	mv essay.pdf .. &&
	cd ..
'
```
3. Add [template.latex](template.latex) to /.pandoc/templates (create these folders if they don't exist yet)
4. Delete content from essay.md that you don't need
5. Start writing :smile:
