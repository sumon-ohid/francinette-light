#!/bin/bash

RC_FILE="$HOME/.zshrc"
OS="$(uname)"

if ! grep "francinette-light" "$RC_FILE" &> /dev/null; then
    if [[ "$OS" == "darwin"* ]]; then
        # macOS
        printf "\nif ! launchctl list | grep -q docker; then" >> "$RC_FILE"
        printf "\n\t\techo \"[Francinette] Starting Docker...\"" >> "$RC_FILE"
        printf "\n\t\topen --background -a Docker" >> "$RC_FILE"
        printf "\n\t\tsleep 1" >> "$RC_FILE"
        printf "\n\t\texec \"$SHELL\"" >> "$RC_FILE"
        printf "\nfi" >> "$RC_FILE"
    else
        # Linux
        printf "\nif ! systemctl status docker | grep \"running\" &> /dev/null; then" >> "$RC_FILE"
        printf "\n\t\techo \"[Francinette] Starting Docker...\"" >> "$RC_FILE"
        printf "\n\t\tsudo systemctl start docker" >> "$RC_FILE"
        printf "\n\t\tsleep 1" >> "$RC_FILE"
        printf "\n\t\texec \"$SHELL\"" >> "$RC_FILE"
        printf "\nfi" >> "$RC_FILE"
    fi

    printf "\nif ! docker image ls | grep \"francinette-light\" &> /dev/null; then" >> "$RC_FILE"
    printf "\n\t\techo \"[Francinette] Loading the docker container\"" >> "$RC_FILE"
    printf "\n\t\tdocker load < %s/home/${USER}/sgoinfre/${USER}/francinette-light/francinette.tar" "$HOME" >> "$RC_FILE"
    printf "\n\t\texec \"$SHELL\"" >> "$RC_FILE"
    printf "\nfi" >> "$RC_FILE"

    if [[ "$OS" == "darwin"* ]]; then
        # macOS
        printf "\nif ! docker ps | grep \"francinette-light\" &> /dev/null; then" >> "$RC_FILE"
        printf "\n\tif docker run -d -i -v %s:/home -v %s/sgoinfre:/sgoinfre -v %%s/home/${USER}/sgoinfre/${USER}/francinette-light/logs:/francinette/logs-t --name run-paco francinette-light /bin/bash 2>&1 | grep \"already\" &> /dev/null; then" "$HOME" "$HOME" "$HOME" >> "$RC_FILE"
        printf "\n\t\tdocker start run-paco" >> "$RC_FILE"
        printf "\n\tfi" >> "$RC_FILE"
        printf "\nfi" >> "$RC_FILE"
    else
        # Linux
        printf "\nif ! docker ps | grep \"francinette-light\" &> /dev/null; then" >> "$RC_FILE"
        printf "\n\tif docker run -d -i -v /home:/home -v /goinfre:/goinfre -v /sgoinfre:/sgoinfre -v %s/home/${USER}/sgoinfre/${USER}/francinette-light/logs:/francinette/logs-t --name run-paco francinette-light /bin/bash 2>&1 | grep \"already\" &> /dev/null; then" "$HOME" >> "$RC_FILE"
        printf "\n\t\tdocker start run-paco" >> "$RC_FILE"
        printf "\n\tfi" >> "$RC_FILE"
        printf "\nfi" >> "$RC_FILE"
    fi
fi

if ! grep "francinette=" "$RC_FILE" &> /dev/null; then
    printf "\nalias francinette=%s/home/${USER}/sgoinfre/${USER}/francinette-light/run.sh\n" "$HOME" >> "$RC_FILE"
fi

if ! grep "paco=" "$RC_FILE" &> /dev/null; then
    printf "\nalias paco=%s/home/${USER}/sgoinfre/${USER}/francinette-light/run.sh\n" "$HOME" >> "$RC_FILE"
fi

WHITE='\033[0;37m' 
BLUE='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
BWhite='\033[1;37m' 
NC='\033[0m'
echo -e "${BLUE}[Francinette] ${WHITE}zshrc params installed"