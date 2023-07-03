#!/usr/bin/env bash

PWD=`pwd`
CONFIG=~/.config

# Create symlinks for all config files
cp -frs $PWD/vim/.vimrc ~/.vimrc
cp -frs $PWD/git/.gitconfig ~/.gitconfig
cp -frs $PWD/git/.git-prompt.sh ~/.git-prompt.sh
cp -frs $PWD/tmux/plugins ~/.tmux/
cp -frs $PWD/tmux/.tmux.conf ~/.tmux.conf
cp -frs $PWD/tmuxinator/ $CONFIG

case $TERM in
  "foot-extra")
    echo -n "Using foot terminal config"
    cp -frs $PWD/foot/ $CONFIG/foot/
    ;;
  "linux" | "screen"*)
    echo -n "Warning: Running in virtual terminal. Cannot determine what config to use.. skipping"
    ;;
  *)
    echo -n "No specific terminal config to handle.. skipping"
    ;;
esac
