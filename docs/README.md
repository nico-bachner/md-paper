# Markdown Paper

[Github repository](https://github.com/nico-bachner/md-paper)

A CLI tool to write scientific papers in Markdown. Initially, it was designed to be an easily customisable all-in-one compiler from Markdown to PDF via LaTeX, but has become more opinionated over time.

Uses [pandoc](https://pandoc.org) and [pdflatex](https://www.latex-project.org) under the hood.

*Only designed to work on macOS x86_64, but should also work on Linux with some minor tweaks.*

- [Installation](#installation)
    - [Installing](#installing)
    - [Reinstalling](#reinstalling)
    - [Uninstalling](#uninstalling)
- [Writing](#writing)
- [PDF Generation](#pdf-generation)
- [Build Options](#build-options)
- [Formatting Options](#formatting-options)
    - [Basic structure](#basic-structure)
    - [Document types](#document-types)
    - [Title, Author, Date](#title-author-date)
    - [Importing packages](#importing-packages)
    - [Custom Margins](#custom-margins)
- [Further Customisation](#further-customisation)
- [Contributing](#contributing)

## Installation
### Installing
For those unfamiliar with the command line:
1.  Go to **Applications**
2.  Go to **Utilities** (inside Applications)
3.  Open **Terminal.app** (inside Utilities)
4.  Copy one of the below options and paste it into Terminal.

#### Installation methods
-   With [Homebrew](https://brew.sh):
    For the moment, the Homebrew release is inofficial. 
    It only works if you copy [brew/md-paper.rb](brew/md-paper.rb) into `/usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/md-paper.rb`.
    However, you need only do this step once. It will remember even when reinstalling from scratch.
    
    When done, installing is simply a matter of typing the following:
    ``` sh
    brew install md-paper
    ```
    
-   With `curl`:
    ``` sh
    curl https://md-paper.now.sh/install.sh | sh
    ```
    
When installed, you can check which version you are on by typing:
``` sh
md-paper -v
```

### Reinstalling
To reinstall the program, simply write the following in your terminal:
``` sh
md-paper reinstall
```
Shorthand: `r`

### Uninstalling
To uninstall the entire program, write the following:
``` sh
md-paper uninstall
```
Shorthand: `u`

## Writing 
1. Create a folder that will contain your project.
2. Create your Markdown (`.md`) document inside that folder.
3. Check out the [YAML Options](#YAML-Options) section of this README for formatting options.
4. Start writing

## PDF Generation
1.  Open a new terminal window.
2.  Create a folder for your project if you haven't already
    ``` sh
    mkdir FOLDER_NAME
    ```
    Replace `FOLDER_NAME` with whatever name you want.
    
    Now navigate into your project folder:
    ``` sh
    cd FOLDER_NAME
    ```
    Don't forget to replace `FOLDER_NAME` with the actual name of your project folder!
3.  Now you can generate your pdf by typing the following:
    ``` sh
    md-paper
    ```

## Build Options
This is the base command for pdf generation:
``` sh
md-paper
```

This base command can be extended by adding one or more of the following arguments:
-   Basic logs:
    ```
    --log
    ```
-   Auxiliary files (basically logs for all little parts of your document, such as the table of contents and):
    ```
    --aux
    ```

For example, the following would keep the latex code, as well as the logs generated; all that in addition to the pdf.
``` sh
md-paper --log
```

If you just want to generate a LaTeX file, for example when sending your paper off to a publication, you can use
``` sh
md-paper tex
```

If you have a custom LaTeX file, you can process that and get back a PDF by using
``` sh
md-paper pdf
```

## Formatting Options
There are quite a few options for customisation, so not all will be listed here. (for those who know a little TeX: the options are derived from the `template.tex` file, located in your home folder (`~/`) so feel free to check that out for the full customisation options)

### Basic structure
Customisation can be done in a YAML (**Y**AML **A**in't **M**arkup **L**anguage) header which is an extra section above the content of your document:
``` YAML
---
YAML HEADER # formatting
---

MARKDOWN # content
```
Here's the minimum needed for a pdf to be generated
``` YAML
---
document-type: TYPE
    
title: "TITLE"
author: "AUTHOR"
---
# Hello, World!
```

### Document types
-   For articles and short reports:
    ``` YAML
    document-type: article
    ```
-   For longer reports:
    ``` YAML
    document-type: report
    ```

### Title, Author, Date
These are essential parts of any standalone document. Simply write the following into the YAML header:
``` YAML
title: "YOUR DOCUMENT TITLE"
author: "YOUR NAME"
date: \today  # or write out a specific date in parentheses
```

### Custom Margins
You can override the default margins by putting the following in the YAML header:
``` YAML
margins: 
    top: 3cm
    bottom: 1in
    left: 20pt
    right: 3em
```
Most units will work.

### Importing packages
To import packages, add the following to your YAML header:
``` YAML
packages:
    - package1
    - package2
```

There's a chance these packages aren't installed on your computer. If that's the case, import it like so:
``` sh
md-paper install PACKAGE_NAME
```
or the shorthand:
``` sh
md-paper i PACKAGE_NAME
```

## Further Customisation
For all those with basic TeX knowledge, it is really easy to customise the build output even further than just through the YAML header.

Simply open `template.tex` (in `~/`) and start editing!
On second thoughts though, DON'T DO THAT!
As soon as you update, all of your changes will be erased, so proceed at your own risk.
It is handy for a quick fix though if you can't wait long enough for the problem to be fixed properly

If you have something that needs fixing, be sure to check out the [Contributing](#contributing) section.

## Contributing
Please consult [CONTRIBUTING.md](CONTRIBUTING.md) for ways to contribute to this project
