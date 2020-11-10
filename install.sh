#!/bin/sh

REPO_NAME="nico-bachner/md-paper"

if which brew > /dev/null
then
    echo "Homebrew was already installed"
else
    curl https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash
fi

if brew ls --versions pandoc > /dev/null
then
    echo "pandoc was already installed"
else
    brew install pandoc
fi

if brew ls --versions shc > /dev/null
then
    echo "shc was already installed"
else
    brew install shc
fi

if latex -v > /dev/null
then
    echo "a TeX distribution was already installed"
else
    brew cask install basictex
fi

if [ ! -d /usr/local/bin/md-paper ]
then
    cd ~/
    
    touch md-paper.sh
    touch template.tex
    curl -s https://md-paper.now.sh/src/md-paper.sh >md-paper.sh
    curl -s https://md-paper.now.sh/src/template.tex >template.tex
    
    if [ -e md-paper.sh ] && [ -e template.tex ]
    then
        echo "download successful"

        shc -f md-paper.sh -o md-paper
        rm md-paper.sh
        rm md-paper.sh.x.c
        sudo mv md-paper /usr/local/bin


        if [ -e /usr/local/bin/md-paper ]
        then
            echo "installation successful"
            exit 0
        fi
    else
        echo "download failed"
    fi

    
else
    echo "It seems a program called 'md-paper' already exists"
    echo "To install please rename or delete the existing program and try again" 
    exit 1
fi

exit 0
