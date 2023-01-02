#!/usr/bin/env bash

PWD=`pwd`

# Create symlinks for all config files
cp -frs $PWD/vim/.vimrc ~/.vimrc
cp -frs $PWD/git/.gitconfig ~/.gitconfig
cp -frs $PWD/git/.git-prompt.sh ~/.git-prompt.sh
cp -frs $PWD/tmux/plugins ~/.tmux/
cp -frs $PWD/tmux/.tmux.conf ~/.tmux.conf
cp -frs $PWD/tmuxinator/ ~/.config/

