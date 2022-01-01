#!/bin/bash

PWD=`pwd`

# Create symlinks for all config files
cp -nrs $PWD/vim/.vimrc ~/.vimrc
cp -nrs $PWD/git/.gitconfig ~/.gitconfig
cp -nrs $PWD/tmux/.tmux.conf ~/.tmux.conf
cp -nrs $PWD/tmuxinator ~/.config/tmuxinator

