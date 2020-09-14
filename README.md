# Markdown to PDF

Personalised and simplified markdown to pdf (via LaTeX) converter based on [Pandoc](https://pandoc.org) and [pdflatex](https://www.latex-project.org)

## How to use

1. Clone this repository:
    ```
    git clone https://github.com/nico-bachner/md-to-pdf.git
    ```
0. Install [Pandoc](https://pandoc.org/installing.html) and a TeX distribution (only requires pdflatex).
0. (Optional) Change DOCUMENT.md and/or PROJECT to the name of your project.
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
0. Start writing :wink:
0. To generate the pdf:
    1. Go to your terminal.
    0. Navigate to the location of this repository.
    0. Type:
        ```
        sh build.sh PROJECT DOCUMENT
        ```
    0. Open your generated pdf :tada:

### Build Options
- Keep built latex file only:
    ```
    sh build.sh PROJECT DOCUMENT keep-tex
    ```
- Keep entire build directory containing all build files: 
    ```
    sh build.sh PROJECT DOCUMENT keep-all
    ```
