# Markdown Paper

A tool to convert Markdown to PDF via LaTeX. \
Primarily designed for writing scientific papers

Uses [Pandoc](https://pandoc.org) and [pdflatex](https://www.latex-project.org).

## Table of Contents
- [How to use](#How-to-use)
    - [Installation](#Installation)
    - [Writing](#Writing)
    - [PDF Generation](#PDF-Generation)
    - [Build Options](#Build-Options)
- [Customisation](#Customisation)
    - [YAML Options](#YAML-Options)
    - [Further Customisation](#Further-Customisation)

**Heads-up:** I also use this repo as storage for some personal essays, so don't be confused by the many folders. :grin: \
Feel free use any and all of my stuff as a template / inspiration for your own project.

## How to use
### Installation

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

### Writing 
1. Create a folder inside this repository that will contain your project.
0. Create your Markdown (.md) document inside that folder. Again, feel free use my stuff as inspiration for your project.
0. Start writing :wink:

### PDF Generation
1. Go to your terminal.
0. Navigate to the location of this repository.
    ```sh
    # Navigate to where you cloned this repo to, usually this would be in your home folder
    cd ~/

    # Then navigate into the repo using the cd command
    cd md-to-pdf
    ```
0. Now navigate into your project folder:
    ``` sh
    cd YOUR_FOLDER_NAME
    ```
0. Now you can build your pdf:
    ``` sh
    # If your file name is, for example, "paper.md", write "paper" instead of FILE_NAME

    ../build.sh FILE_NAME

    # Depending on where your project is located, you may have to add more dots to the beginning
    ```
0. Open your generated pdf :tada:

### Build Options
- Keep built latex file only:
    ```
    ../build.sh FILE_NAME keep-tex
    ```
- Keep entire build directory containing all build files: 
    ```
    ../build.sh FILE_NAME keep-all
    ```

## Customisation
### YAML Options
There are quite a few options for customisation. I'll try and list as many as I can. (for those who know a little TeX: the options are derived from the `template.latex` file)

#### Basic structure
Customisation can be done in a YAML (**Y**AML **A**in't **M**arkup **L**anguage) header which is an extra section above the content of your document:
``` YAML
---
YAML HEADER # your customisations
---

MARKDOWN  # your content
```

#### Title, Author & Date
These are essential parts of any standalone document. Simply write the following into the YAML header:
``` YAML
title: "YOUR DOCUMENT TITLE"
author: "YOUR NAME"
date: \today  # or set a specific date
```

### Further Customisation
For all those with basic TeX knowledge, it is really easy to customise the build output even further than just through the YAML header.

Simply open `template.latex` and start editing!
