#!/bin/bash
WHITE='\033[0;37m' 
BLUE='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
BWhite='\033[1;37m' 
NC='\033[0m'

USER = $(whoami)
francinette_data = /home/${USER}/sgoinfre/${USER}/francinette-light
if [ ! -d $francinette_data ]; then
	mkdir -p $francinette_data
fi

if ! ls -l /home/${USER}/sgoinfre/${USER} | grep "francinette-light" &> /dev/null; then
	git clone https://github.com/sumon-ohid/francinette-light.git $francinette_data
fi

chmod +x $francinette_data/run.sh

if ! ls -l $francinette_data | grep "francinette.tar" &> /dev/null; then
	docker build -t francinette-light $francinette_data
	docker image save francinette-light > $francinette_data/francinette.tar
fi

if ls -l $francinette_data | grep "francinette.tar" &> /dev/null; then
	docker load < $francinette_data/francinette.tar
fi

source $francinette_data/utils/install_zshrc.sh

echo -e "${BLUE}[Francinette] ${GREEN}Installation completed!\n${WHITE}Use the ${BWhite}paco${WHITE} or ${BWhite}francinette${WHITE} commands in your project folder."

exec "$SHELL"
