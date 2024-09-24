#!/bin/bash
mkdir -p $HOME/.tmp_francinette
if ls -l $HOME/francinette-light | grep "francinette.tar" &> /dev/null; then
    mv /home/$USER/francinette-light/francinette.tar /home/$USER/.tmp_francinette/
fi