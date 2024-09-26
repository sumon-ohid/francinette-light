#!/bin/bash
WHITE='\033[0;37m' 
BLUE='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

GOINFRE_DIR="/home/${USER}/goinfre/${USER}"
francinette_data="${GOINFRE_DIR}/francinette-light"

if ls -l $HOME | grep "francinette-light" &> /dev/null; then
    mkdir -p $HOME/.tmp_francinette
    git clone https://github.com/sumon-ohid/francinette-light.git $HOME/.tmp_francinette/francinette-light

    source $HOME/.tmp_francinette/francinette-light/utils/move_tmp.sh
    source $HOME/.tmp_francinette/francinette-light/utils/remove_docker.sh
    source $HOME/.tmp_francinette/francinette-light/utils/remove_zshrc.sh

    rm -rf $francinette_data

    mkdir -p $francinette_data
    mv $HOME/.tmp_francinette/francinette-light/* $francinette_data
    if ls -l $HOME/.tmp_francinette | grep "francinette.tar" &> /dev/null; then
        mv $HOME/.tmp_francinette/francinette.tar $francinette_data
    fi

    rm -rf $HOME/.tmp_francinette

    source $francinette_data/install.sh

    echo -e "${BLUE}[Francinette] ${WHITE}Updated ${GREEN}OK"
fi
if ! ls -l $HOME | grep "francinette-light" &> /dev/null; then
    echo -e "${BLUE}[Francinette] ${WHITE}Updated ${RED}ERROR (francinette not installed...)"
fi
