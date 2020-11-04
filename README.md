# Markdown Paper

A tool to write scientific papers in Markdown and then convert them to PDF via LaTeX.
Primarily designed for writing scientific papers.
Uses [Pandoc](https://pandoc.org) and [PDFlatex](https://www.latex-project.org).

*Only designed to work on Mac, but should also work on Linux.*

- [Installation](#installation)
- [Writing](#writing)
- [PDF Generation](#pdf-generation)
- [Build Options](#build-options)
- [Formatting Options (YAML Header)](#formatting-options-yaml-header)
    - [Basic structure](#basic-structure)
    - [Title, Author, Date](#title-author-date)
- [Further Customisation](#further-customisation)

## Installation
1.  
    1. Go to **Applications**
    2. Go to **Utilities** (inside Applications)
    3. Open **Terminal.app** (inside Utilities)
2.  
    Install [Homebrew](https://brew.sh) by typing the following in your terminal:
    ``` sh
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    ```
    This will also prompt you to download and install the Xcode command line tools if they are not already installed.
3. 
    Download and install [MacTeX](https://tug.org/mactex/mactex-download.html). Be warned, it is big (approx. 4Gb)
4.  
    Install [Markdown Paper](https://brew.sh)
    ``` sh
    /bin/sh -c "$(curl -fsSL https://md-paper.now.sh/install.sh)"
    ```

## Writing 
1.  
    Create a folder that will contain your project.
2.  
    Create your Markdown (`.md`) document inside that folder.
    
    Check out the [YAML Options](#YAML-Options) section of this README for formatting options.
    
    You can also use one of the [example projects](https://md-paper.now.sh/example-papers) as a template.
3.  
    Start writing

## PDF Generation
1. 
    Go back to your terminal.
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
    paper FILE_NAME 
    # If your file name is, for example, "paper.md", write "paper" instead of FILE_NAME
    ```
4.  
    Open your generated pdf

## Build Options
This is the base command for pdf generation. All other commands build on this:
``` sh
paper FILE_NAME
# If your file name is "paper.md", replace FILE_NAME with "paper"
```
- Add LaTeX: `latex`
- Add auxiliary files: `aux`
- Basic logs: `log`
- All logs: `LOG`

## Formatting Options (YAML Header)
There are quite a few options for customisation, so not all will be listed here. (for those who know a little TeX: the options are derived from the `template.latex` file, so feel free to check that out for the full customisation options)

### Basic structure
Customisation can be done in a YAML (**Y**AML **A**in't **M**arkup **L**anguage) header which is an extra section above the content of your document:
``` YAML
---
YAML HEADER # your customisations
---

MARKDOWN  # your content
```

### Title, Author, Date
These are essential parts of any standalone document. Simply write the following into the YAML header:
``` YAML
title: "YOUR DOCUMENT TITLE"
author: "YOUR NAME"
date: \today  # or set a specific date
```

## Further Customisation
For all those with basic TeX knowledge, it is really easy to customise the build output even further than just through the YAML header.

Simply open `template.latex` and start editing!
