#!/bin/sh

PACKAGE_NAME="md-paper"
REPO_NAME="nico-bachner/${PACKAGE_NAME}"

cd /usr/local

function brewInstall {
    if brew ls --versions $1 > /dev/null
    then
        echo "${1} was already installed"
    else
        brew install $1
    fi
}

if which brew > /dev/null
then
    echo "Homebrew was already installed"
else
    curl https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash
fi

brewInstall pandoc
brewInstall shc

if latex -v > /dev/null
then
    echo "a TeX distribution was already installed"
else
    brew cask install basictex
fi

function download {
    sudo git clone https://github.com/${REPO_NAME}.git
    if [ -d ${PACKAGE_NAME} ]
    then
        echo "Download successful"
    fi
}

if [ ! -d ${PACKAGE_NAME} ]
then
    download
else
    echo "It seems a program called '${PACKAGE_NAME}' already exists"
    echo "To resume installation please rename or delete the existing program" 
    exit 1
fi

cd ${PACKAGE_NAME}/src

sudo shc -f ${PACKAGE_NAME}.sh -o /usr/local/bin/${PACKAGE_NAME}

if [ -e /usr/local/bin/${PACKAGE_NAME} ]
then
    echo "Installation successful"
    exit 0
else
    echo "Installation failed"
    exit 1
fi
