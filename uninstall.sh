#!/bin/bash

mkdir -p $HOME/.tmp_francinette

git clone https://github.com/WaRtr0/francinette-light.git $HOME/.tmp_francinette/francinette-light

source $HOME/.tmp_francinette/francinette-light/utils/remove_docker.sh
source $HOME/.tmp_francinette/francinette-light/utils/remove_zshrc.sh

rm -rf $HOME/francinette-light
rm -rf $HOME/.tmp_francinette

WHITE='\033[0;37m' 
BLUE='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color
echo -e "${BLUE}[Francinette] ${WHITE}Uninstalled ${GREEN}OK"
exec "$SHELL"
