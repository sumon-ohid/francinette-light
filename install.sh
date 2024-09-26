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
SGOINFRE_DIR="/home/${USER}/goinfre/${USER}"
francinette_data="${SGOINFRE_DIR}/francinette-light"

# if [ $francinette_data ]; then
#     rm -rf $francinette_data
# fi

# mkdir -p $francinette_data

# Clone the repository if it doesn't exist in sgoinfre
if [ ! -d "$francinette_data" ]; then
    git clone https://github.com/sumon-ohid/francinette-light.git "$francinette_data"
fi

# Ensure the run.sh script is executable
chmod +x "$francinette_data/run.sh"
chmod +x "$francinette_data/utils/install_zshrc.sh"

# Build the Docker image and save it as a tar file if it doesn't exist
if [ ! -f "$francinette_data/francinette.tar" ]; then
    docker build -t francinette-light "$francinette_data"
    docker image save francinette-light > "$francinette_data/francinette.tar"
fi

# Load the Docker image from the tar file
if [ -f "$francinette_data/francinette.tar" ]; then
    docker load < "$francinette_data/francinette.tar"
fi

# Source the Zsh configuration script
source "$francinette_data/utils/install_zshrc.sh"

echo -e "${BLUE}[Francinette] ${GREEN}Installation completed!\n${WHITE}Use the ${BWhite}paco${WHITE} or ${BWhite}francinette${WHITE} commands in your project folder."

exec "$SHELL"