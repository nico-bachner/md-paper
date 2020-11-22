#!/bin/sh

if brew ls --versions md-paper
then
    echo "md-paper already installed via homebrew"
    exit 1
else
    function WARNING {
        echo -e "\e[1;31mWARNING: \e[0;31m${1}"
    }
    
    if ! brew ls --versions pandoc >/dev/null
    then
        WARNING "Pandoc was not found on your machine. You will need to install pandoc for this program to work."
    fi

    if ! latex -v >/dev/null
    then
        WARNING "This program requires a TeX distribution to work, but none were found."
    fi

    if [ -e /usr/local/bin/md-paper ]
    then
        WARNING "It seems a program called 'md-paper' already exists. To install please rename or delete the existing program and try again" 
        exit 1
    else
        # install main script in binary folder
        curl -s https://raw.githubusercontent.com/nico-bachner/md-paper/master/src/md-paper.sh -o /usr/local/bin/md-paper 
        chmod +x /usr/local/bin/md-paper

        # install the rest to /usr/local/md-paper
        sudo mkdir /usr/local/md-paper
        sudo curl -s https://raw.githubusercontent.com/nico-bachner/md-paper/master/src/template.tex -o /usr/local/md-paper/template.tex
        sudo curl -s https://raw.githubusercontent.com/nico-bachner/md-paper/master/src/tex.sh -o /usr/local/md-paper/tex.sh
        sudo curl -s https://raw.githubusercontent.com/nico-bachner/md-paper/master/src/pdf.sh -o /usr/local/md-paper/pdf.sh
        
        if [ -e /usr/local/bin/md-paper ] && [ -e /usr/local/md-paper/tex.sh ] && [ -e /usr/local/md-paper/pdf.sh ] && [ -e /usr/local/md-paper/template.tex ]
        then
            echo "md-paper: installation successful"
            exit 0
        else
            echo "md-paper: installation failed"
            exit 1
        fi
    fi
fi