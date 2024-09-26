#!/bin/bash

RC_FILE="$HOME/.zshrc"

# Remove the specific blocks for Docker and aliases
sed -i '/#francinette/,+16d' "$RC_FILE"
# sed -i '/if ! systemctl status docker | grep "running" &> \/dev\/null; then/,+5d' "$RC_FILE"
# sed -i '/if ! docker image ls | grep "francinette-light" &> \/dev\/null; then/,+4d' "$RC_FILE"
# sed -i '/if ! docker ps | grep "francinette-light" &> \/dev\/null; then/,+4d' "$RC_FILE"
sed -i '/alias francinette=/d' "$RC_FILE" || true
sed -i '/alias paco=/d' "$RC_FILE" || true

WHITE='\033[0;37m' 
BLUE='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
BWhite='\033[1;37m' 
NC='\033[0m'
echo -e "${BLUE}[Francinette] ${WHITE}zshrc params removed"