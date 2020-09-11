# Markdown to PDF

Personalised and simplified markdown to pdf (via LaTeX) converter based on [Pandoc](https://pandoc.org) and [pdflatex](https://www.latex-project.org)

## How to use

1. Clone this repository (`git clone https://github.com/nico-bachner/md-to-pdf.git`).
0. Install [Pandoc](https://pandoc.org) and a TeX distribution (only requires pdflatex).
0. (Optional) Change DOCUMENT.md to the name of your project
0. Customise your YAML header and delete placeholder content. Your document should look something like this:
    ``` YAML
    ---
    SOME OPTIONS

    title: "YOUR DOCUMENT TITLE"
    author: "YOUR NAME"
    ...

    MORE OPTIONS
    ---

    MARKDOWN CONTENT GOES HERE
    ```
0. Start writing :smile:
0. To generate the pdf, go to your terminal, navigate to your project directory and type `sh build.sh DOCUMENT -d`.

### Build Options
- Keep build directory containing DOCUMENT.tex: `sh build.sh DOCUMENT keep`