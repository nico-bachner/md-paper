# Markdown to PDF

Personalised and "simplified" markdown to pdf (via LaTeX) converter using [Pandoc](https://pandoc.org) and [pdflatex](https://www.latex-project.org).

## Table of Contents
- [How to use](#How-to-use)
- [Customisation](#Customisation)
    - [YAML Options](#YAML-Options)
    - [Further Customisation](#Further-Customisation)

***Heads-up:*** I also use this repo as storage for some personal essays, so don't be confused by the many folders. :grin: \
Feel free use any and all of my stuff as a template / inspiration for your own project.

## How to use

1. Clone this repository:
    ``` sh
    git clone https://github.com/nico-bachner/md-to-pdf.git
    ```
0. Install [Pandoc](https://pandoc.org/installing.html) and a TeX distribution (only absolute requirement is pdflatex). \
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
0. Create a folder inside this repository that will contain your project.
0. Create your Markdown (.md) document inside that folder. \
**Reminder:**  the name of your markdown (.md) file has to be the same as the folder of your project!
0. Start writing :wink:
0. To generate the pdf:
    1. Go to your terminal.
    0. Navigate to the location of this repository.
    0. Type:
        ``` sh
        sh build.sh YOUR_PROJECT_NAME
        ```
    0. Open your generated pdf :tada:



### Build Options
- Keep built latex file only:
    ```
    sh build.sh YOUR_PROJECT_NAME keep-tex
    ```
- Keep entire build directory containing all build files: 
    ```
    sh build.sh YOUR_PROJECT_NAME keep-all
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
