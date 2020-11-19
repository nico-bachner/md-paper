#!/bin/sh

version="0.0.1"

case $1 in
    v | version )
        echo $version
        ;;
    u | uninstall )
        # uninstall everything
        sudo rm -rf /usr/local/md-paper
        if [ -e /usr/local/md-paper ]
        then
            error "uninstall failed"
            exit 1
        else
            exit 0
        fi
        ;;
    r | reinstall )
        # reinstall everything
        sudo rm -rf /usr/local/md-paper
        if [ -e /usr/local/md-paper ]
        then
            error "uninstall failed"
            exit 1
        else
            exit 0
        fi
        curl https://md-paper.now.sh/install.sh | sh
        exit $?
        ;;
    i | install )
        # shorthand command for importing external TeX modules
        if [ $2 ]
        then
            sudo tlmgr install $2
            exit $?
        else
            echo "no package specified"
            exit 1
        fi
        ;;
    tex | latex )
        if [ -e *.md ]
        then
            # convert md to latex
            sh /usr/local/md-paper/tex.sh
            open ${FILE}.tex
            exit $?
        else
            echo "No markdown file found"
            exit 1
        fi
        ;;
    pdf )
        if [ -e *.tex ]
        then
            # convert latex to pdf
            sh /usr/local/md-paper/pdf.sh
            open ${FILE}.pdf
            exit $?
        else
            echo "No (La)TeX file found"
            exit 1
        fi
        ;;
    * )
        if [ -e *.md ]
        then
            # convert md to pdf
            sh /usr/local/md-paper/tex.sh
            sh /usr/local/md-paper/pdf.sh
            open ${FILE}.pdf
            exit $?
        else
            echo "No Markdown file found"
            exit 1
        fi
        ;;
esac