#!/bin/bash
set -e

WHITE='\033[0;37m' 
BLUE='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
BWhite='\033[1;37m' 
NC='\033[0m'

USER="$(whoami)"
OS="$(uname)"

if [[ "$OS" == "Darwin" ]]; then
    # macOS
    HOME_DIR="/Users/${USER}"
    SGOINFRE_DIR="${HOME_DIR}/sgoinfre"
else
    # Linux
    HOME_DIR="/home/${USER}"
    SGOINFRE_DIR="/sgoinfre/${USER}"
fi

francinette_data="${SGOINFRE_DIR}"

if [ ! -d "$francinette_data" ]; then
    mkdir -p "$francinette_data"
fi

if ! ls -l "$SGOINFRE_DIR" | grep "francinette-light" &> /dev/null; then
    git clone https://github.com/sumon-ohid/francinette-light.git "$francinette_data/francinette-light"
fi

chmod +x "$francinette_data/francinette-light/run.sh"

if ! ls -l "$francinette_data" | grep "francinette.tar" &> /dev/null; then
    docker build -t francinette-light "$francinette_data"
    docker image save francinette-light > "$francinette_data/francinette.tar"
fi

if ls -l "$francinette_data" | grep "francinette.tar" &> /dev/null; then
    docker load < "$francinette_data/francinette.tar"
fi

source "$francinette_data/francinette-light/utils/install_zshrc.sh"

echo -e "${BLUE}[Francinette] ${GREEN}Installation completed!\n${WHITE}Use the ${BWhite}paco${WHITE} or ${BWhite}francinette${WHITE} commands in your project folder."

exec "$SHELL"