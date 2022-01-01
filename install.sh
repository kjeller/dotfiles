#!/bin/bash

PWD=`pwd`

# Create symlinks for all config files
cp -frs $PWD/vim/.vimrc ~/.vimrc
cp -frs $PWD/git/.gitconfig ~/.gitconfig
cp -frs $PWD/tmux/.tmux.conf ~/.tmux.conf
cp -frs $PWD/tmuxinator/ ~/.config/

