#!/bin/sh

PACKAGE_NAME="md-paper"
REPO_NAME="nico-bachner/${PACKAGE_NAME}"


cd /usr/local

if which brew > /dev/null
then
    echo "Homebrew was already installed"
else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

function installBrewDependency {
    if brew ls --versions $1 > /dev/null
    then
        echo "${1} was already installed"
    else
        brew install $1
    fi
}

installBrewDependency pandoc
installBrewDependency shc
installBrewDependency basictex

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
    echo "Would you like to replace it? | Y/n"
    read replace
    if [ $replace == "Y" ]
    then
        sudo rm -rf ${PACKAGE_NAME}
        download
    else
        echo "Installation aborted"
    fi
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
