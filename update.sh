#!/bin/bash
WHITE='\033[0;37m' 
BLUE='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'
if ls -l $HOME | grep "francinette-light" &> /dev/null; then
    mkdir -p $HOME/.tmp_francinette
    git clone https://github.com/WaRtr0/francinette-light.git $HOME/.tmp_francinette/francinette-light

    source $HOME/.tmp_francinette/francinette-light/utils/move_tmp.sh
    source $HOME/.tmp_francinette/francinette-light/utils/remove_docker.sh
    source $HOME/.tmp_francinette/francinette-light/utils/remove_zshrc.sh

    rm -rf $HOME/francinette-light

    mkdir -p $HOME/francinette-light
    mv $HOME/.tmp_francinette/francinette-light/* $HOME/francinette-light/
    if ls -l $HOME/.tmp_francinette | grep "francinette.tar" &> /dev/null; then
        mv $HOME/.tmp_francinette/francinette.tar $HOME/francinette-light/
    fi

    rm -rf $HOME/.tmp_francinette

    source $HOME/francinette-light/install.sh

    
    echo -e "${BLUE}[Francinette] ${WHITE}Updated ${GREEN}OK"
fi
if ! ls -l $HOME | grep "francinette-light" &> /dev/null; then
    echo -e "${BLUE}[Francinette] ${WHITE}Updated ${RED}ERROR (francinette not installed...)"
fi
