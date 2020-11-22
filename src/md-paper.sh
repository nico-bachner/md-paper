#!/bin/sh

version="0.1.2"

if brew ls --versions md-paper >/dev/null
then
    version=$(brew ls --versions md-paper | cut -c 10-)
    INSTALLATION_METHOD="homebrew"
    export resources="/usr/local/Cellar/md-paper/${version}/include"
else
    INSTALLATION_METHOD="curl"
    export resources="/usr/local/md-paper"
fi

case $1 in
    v | version | -v | --version )
        echo $version
        ;;
    u | uninstall )
        # uninstall everything
        if [ INSTALLATION_METHOD = "homebrew" ]
        then
            brew uninstall md-paper
            exit $?
        else
            sudo rm /usr/local/bin/md-paper
            sudo rm -rf $resources
            if [ -e $resources ] || [ -e /usr/local/bin/md-paper ]
            then
                error "uninstall failed"
                exit 1
            else
                echo "uninstall successful"
                exit 0
            fi
        fi
        ;;
    r | reinstall )
        # reinstall everything
        if [ INSTALLATION_METHOD = "homebrew" ]
        then
            brew reinstall md-paper
            exit $?
        else
            sudo rm /usr/local/bin/md-paper
            sudo rm -rf $resources
            if [ -e $resources ] || [ -e /usr/local/bin/md-paper ]
            then
                error "uninstall failed"
                exit 1
            else
                curl https://md-paper.now.sh/install.sh | sh
                exit $?
            fi
        fi
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
            sh ${resources}/tex.sh
        else
            echo "No markdown file found"
            exit 1
        fi
        ;;
    pdf )
        # convert latex to pdf
        if [ -e *.tex ]
        then
            ksh ${resources}/pdf.ksh
        else
            echo "No (La)TeX file found"
            exit 1
        fi
        ;;
    * )
        if [ -e *.md ]
        then
            # convert md to pdf
            sh ${resources}/tex.sh
            ksh ${resources}/pdf.ksh
        else
            echo "No Markdown file found"
            exit 1
        fi
        ;;
esac
