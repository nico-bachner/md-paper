# Markdown Paper

A tool to convert Markdown to PDF via LaTeX. \
Primarily designed for writing scientific papers

Uses [Pandoc](https://pandoc.org) and [pdflatex](https://www.latex-project.org).

- [Installation](#Installation)
- [Writing](#Writing)
- [PDF Generation](#PDF-Generation)
- [Build Options](#Build-Options)
- [YAML Options](#YAML-Options)
- [Further Customisation](#Further-Customisation)

## Installation

1. Clone this repository:
    ``` sh
    git clone https://github.com/nico-bachner/md-to-pdf.git
    ```
0. Install [Pandoc](https://pandoc.org/installing.html) and a TeX distribution (only pdflatex is required). \
*If you are running MacOS or Linux, I recommend doing this though [Homebrew](https://brew.sh):*

    1. Install Homebrew
        ``` sh
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
        ```
    2. Install Pandoc
        ``` sh
        brew install pandoc
        ```
    3. Install Basictex
        ``` sh
        brew cask install basictex
        ```

## Writing 
1. Create a folder inside this repository that will contain your project.
0. Create your Markdown (.md) document inside that folder. \
Check out the [YAML Options](#YAML-Options) section of this README for formatting options. \
You can also use one of the example projects as a template.
0. Start writing

## PDF Generation
1. Go to your terminal.
0. Navigate to the location of this repository.
    ```sh
    # Navigate to where you cloned this repo to, usually this would be in your home folder
    cd ~/

    # Then navigate into the repo using the cd command
    cd md-paper
    ```
0. Now navigate into your project folder:
    ``` sh
    cd YOUR_PROJECT_FOLDER_NAME
    ```
0. Now you can build your pdf:
    ``` sh
    # If your file name is, for example, "paper.md", write "paper" instead of FILE_NAME

    ../build.sh FILE_NAME

    # Depending on where your project is located, you may have to add more ../ to the beginning
    ```
0. Open your generated pdf

## Build Options
### Build LaTeX:
- Build LaTeX only
    ``` sh
    ../build.sh FILE_NAME latex-only
    ```
### Build PDF:
- Only PDF
    ``` sh
    ../build.sh FILE_NAME
    ```
- PDF and LaTeX
    ``` sh
    ../build.sh FILE_NAME latex
    ```
- PDF and auxiliary files
    ``` sh
    ../build.sh FILE_NAME aux
    ```
- PDF and logs
    ``` sh
    ../build.sh FILE_NAME log
    ```
- PDF and table of contents logs
    ``` sh
    ../build.sh FILE_NAME toc
    ```
- PDF and bibliography logs
    ``` sh
    ../build.sh FILE_NAME bib
    ```

## YAML Options
There are quite a few options for customisation. I'll try and list as many as I can. (for those who know a little TeX: the options are derived from the `template.latex` file)

### Basic structure
Customisation can be done in a YAML (**Y**AML **A**in't **M**arkup **L**anguage) header which is an extra section above the content of your document:
``` YAML
---
YAML HEADER # your customisations
---

MARKDOWN  # your content
```

### Title, Author & Date
These are essential parts of any standalone document. Simply write the following into the YAML header:
``` YAML
title: "YOUR DOCUMENT TITLE"
author: "YOUR NAME"
date: \today  # or set a specific date
```

## Further Customisation
For all those with basic TeX knowledge, it is really easy to customise the build output even further than just through the YAML header.

Simply open `template.latex` and start editing!
