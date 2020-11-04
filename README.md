# Markdown Paper

A tool to write scientific papers in Markdown and then convert them to PDF via LaTeX. \
Primarily designed for writing scientific papers

*Only designed to work on Mac, but should also work on linux*

Uses [Pandoc](https://pandoc.org) and [pdflatex](https://www.latex-project.org).

- [Installation](#Installation)
- [Writing](#Writing)
- [PDF Generation](#PDF-Generation)
- [Build Options](#Build-Options)
- [Formatting Options (YAML Header)](#Formatting-Options-(YAML-Header))
- [Further Customisation](#Further-Customisation)

## Installation
1.  
    1. Go to **Applications**
    2. Go to **Utilities** (inside Applications)
    3. Open **Terminal.app** (inside Utilities)
2.  
    Install [Homebrew](https://brew.sh)
    ``` sh
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    ```
    This will also prompt you to download and install the XCode command line tools if they are not already installed.
4.  
    Install [Pandoc](https://pandoc.org) 
    (
    [Documentation](https://github.com/jgm/pandoc) / 
    [GitHub](https://pandoc.org/MANUAL.html)
    )
    ``` sh
    brew install pandoc
    ```
5. 
    Download and install [MacTeX](https://tug.org/mactex/mactex-download.html)
6. 
    Clone this repository. \
    Open **Terminal** and type the following (leave out the comments starting with "#"):
    ``` sh
    cd ~/ # navigates to your home folder
    git clone https://github.com/nico-bachner/md-paper.git # downloads this repository
    ```
    `cd` stands for "change directory", basically meaning "go to this folder".

    When the download has finished, type:
    ``` sh
    cd md-paper # navigates into the folder you downloaded
    ```
    Now you can also open this very file you are reading:
    ``` sh
    open README.md # this is self-explanatory
    ```

## Writing 
1.  
    Create a folder inside this repository that will contain your project.
2.  
    Create your Markdown (`.md`) document inside that folder.
    
    Check out the [YAML Options](#YAML-Options) section of this README for formatting options.
    
    You can also use one of the example projects as a template.
3.  
    Start writing

## PDF Generation
1. 
    Go to your terminal.
2.  
    Now navigate into your project folder:
    ``` sh
    cd PATH_TO_YOUR_PROJECT_FOLDER 
    # you'll need to replace "PATH_TO_YOUR_PROJECT_FOLDER " withe the actual path to your folder
    # For example, if your project folder is on your desktop, write cd Desktop/YOUR_FOLDER
    ```
3.  
    Now you can generate your pdf:
    ``` sh
    ~/md-paper/build.sh pdf FILE_NAME 
    # If your file name is, for example, "paper.md", write "paper" instead of FILE_NAME
    ```
    Depending on where your project is located, you may have to add more `../` to the beginning, but if you followed the guide thus far, this is not necessary.
4.  
    Open your generated pdf

## Build Options
``` sh
~/md-paper/build.sh FILE_NAME
# If your file name is "paper.md", replace FILE_NAME with "paper"
```
This is the base command for pdf generation. All other commands build on this:
- Add LaTeX: `latex`
- Add auxiliary files: `aux`
- Basic logs: `log`
- All logs: `LOG`
-   **SPECIAL CASE:**
    Generate LaTeX only:
    ``` sh
    ../build.sh FILE_NAME latex-only
    ```
    Since this one doesn't generate a pdf file, the options for pdf gen are superfluous here.


## Formatting Options (YAML Header)
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
