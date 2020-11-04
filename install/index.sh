#!/bin/sh

PACKAGE_NAME="md-paper"
REPO_NAME="nico-bachner/${PACKAGE_NAME}"


cd /usr/local

function installDependency {
    if brew ls --versions $1 > /dev/null
    then
        # The package is installed
    else
        brew install $1
    fi
}

installDependency pandoc
installDependency shc

function download {
    sudo git clone https://github.com/${REPO_NAME}.git
    if [ -d ${PACKAGE_NAME} ]
    then
        echo "Download Successful"
    fi
}

if [ ! -d ${PACKAGE_NAME} ]
then
    download
else
    echo "It seems a program called '${PACKAGE_NAME}' already exists"
    echo "Would you like to replace it? | Y/n"
    read replace
    if [ $replace = "Y" ]
    then
        rm -rf ${PACKAGE_NAME}
        download
    else
        echo "Installation Aborted"
    fi
fi

cd ${PACKAGE_NAME}/src

shc -f ${PACKAGE_NAME}.sh -o /usr/local/bin/${PACKAGE_NAME}
rm ${PACKAGE_NAME}.sh.x.cd

if [ -e /usr/local/bin/${PACKAGE_NAME} ]
then
    echo "Installation Successful"
    exit 0
else
    echo "Installation Failed"
    exit 1
fi