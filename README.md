# Markdown Paper

A tool to write scientific papers in Markdown and then convert them to PDF via LaTeX.
Primarily designed for writing scientific papers.

Uses [pandoc](https://pandoc.org) and [pdftex](https://www.latex-project.org) under the hood.

*Only designed to work on macOS x86_64, but should also work on Linux with some minor tweaks.*

- [Installation](#installation)
    - [Installing](#installing)
    - [Updating](#updating)
    - [Uninstalling](#uninstalling)
- [Writing](#writing)
- [PDF Generation](#pdf-generation)
- [Build Options](#build-options)
- [Formatting Options](#formatting-options)
    - [Basic structure](#basic-structure)
    - [Document types](#document-types)
    - [Title, Author, Date](#title-author-date)
    - [Importing packages](#importing-packages)
- [Further Customisation](#further-customisation)
- [Contributing](#contributing)

## Installation
### Installing
Currently, the only way to install md-paper is through Terminal.
1.  Go to **Applications**
2.  Go to **Utilities** (inside Applications)
3.  Open **Terminal.app** (inside Utilities)
4.  Copy the following and paste it into Terminal
    ``` sh
    curl https://md-paper.now.sh/install.sh | sh
    ```

### Updating
To update the program, simply write the following in your terminal:
``` sh
md-paper update
```

### Uninstalling
To uninstall the entire program, write the following:
``` sh
md-paper uninstall
```

## Writing 
1.  Create a folder that will contain your project.
2.  Create your Markdown (`.md`) document inside that folder. \
    Check out the [YAML Options](#YAML-Options) section of this README for formatting options. \
    You can also use one of the [example projects](https://md-paper.now.sh/docs/example-papers) as a template.
3.  Start writing

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
    md-paper pdf
    ```

## Build Options
This is the base command for pdf generation:
``` sh
md-paper pdf
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
md-paper pdf --aux --log
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
