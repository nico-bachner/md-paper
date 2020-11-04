#!/bin/sh

REPO_NAME="md-paper"

cd $HOME

brew install pandoc
brew install shc

if [ ! -d md-paper ]
then
    git clone https://github.com/nico-bachner/${REPO_NAME}
fi

cd $REPO_NAME

shc -f paper.sh -o paper
mv paper /usr/local/bin
rm paper.sh.x.c