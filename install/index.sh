#!/bin/sh

REPO_NAME="nico-bachner/md-paper"

function brewInstall {
    
}

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

if [ -d /usr/local/bin/md-paper ]
then
    curl -o https://md-paper.now.sh/dist/md-paper ~/md-paper.sh
    curl -o https://md-paper.now.sh/dist/template.tex ~/template.tex

    shc -f ~/md-paper.sh -o ~/md-paper
    mv ~/md-paper /usr/local/bin/
    rm ~/md-paper.sh

    if [ -d /usr/local/bin/md-paper ] && [ -d ~/template.tex ]
    then
        echo "installation successful"
    fi
else
    echo "It seems a program called 'md-paper' already exists"
    echo "To install please rename or delete the existing program and try again" 
    exit 1
fi
