#!/bin/bash

RC_FILE="$HOME/.zshrc"

# Remove Docker-related lines
sed -i '/systemctl status docker/,+4d' "$RC_FILE"
sed -i '/grep francinette-light/,+4d' "$RC_FILE"
sed -i '/docker ps/,+4d' "$RC_FILE"

# Remove the specific block for loading the docker container
sed -i '/if ! docker image ls | grep "francinette-light" &> \/dev\/null; then/,+4d' "$RC_FILE"

# Remove aliases
sed -i '/alias paco/d' "$RC_FILE"
sed -i '/alias francinette/d' "$RC_FILE"

WHITE='\033[0;37m' 
BLUE='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
BWhite='\033[1;37m' 
NC='\033[0m'
echo -e "${BLUE}[Francinette] ${WHITE}zshrc params removed"