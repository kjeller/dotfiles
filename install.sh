#!/usr/bin/env bash

check_if_sudo () {
  if [[ "$EUID" = 0 ]]; then
    echo "Already sudo user.. continuing"
  else
    sudo -k
    if sudo false; then
      echo "Error: sudo is required for this step"
      exit 1
    fi
  fi
}

PWD=`pwd`
CONFIG=~/.config
SYSTEMD_USER_SERVICE_PATH=/etc/systemd/user
USR=$USER

# Create config folder if not already created
mkdir -p $CONFIG

# Create symlinks for all config files
cp -frs $PWD/vim/.vimrc ~/.vimrc
cp -frs $PWD/git/.gitconfig ~/.gitconfig
cp -frs $PWD/git/.git-prompt.sh ~/.git-prompt.sh
cp -frs $PWD/tmux/plugins ~/.tmux/
cp -frs $PWD/tmux/.tmux.conf ~/.tmux.conf
cp -frs $PWD/tmuxinator/ $CONFIG

# Determine what desktop/wm configs to use based on current desktop in use
case $XDG_CURRENT_DESKTOP in
    "sway")
      echo "Using sway window manager configs"
      mkdir -p ~/.config/sway/config.d/
      cp -frs $PWD/sway/config ~/.config/sway/config
      cp -frs $PWD/sway/config.d/*.conf ~/.config/sway/config.d/
      ;;
    *)
      echo "No configuration files for $XDG_CURRENT_DESKTOP.. skipping"
    ;;
esac

# Determine what terminal configs to install based on terminal capabilities
# Not really ideal since different terminals may use same capability.
case $TERM in
  "foot"*)
    echo "Using foot terminal config"
    mkdir -p $CONFIG/foot/
    cp -frs $PWD/foot/* $CONFIG/foot/
    ;;
  "linux" | "screen"*)
    echo "Warning: Running in virtual terminal. Cannot determine what config to use.. skipping"
    ;;
  *)
    echo "No specific terminal config to handle.. skipping"
    ;;
esac

# Rclone private config and service setup
# see https://www.stralman.dev/post/mount_with_rclone/ if you want to configure this yourself
if [ -d "$PWD/rclone" ]; then
  RCLONE_SERVICE=rclone@.service

  if [ ! -f "$SYSTEMD_USER_SERVICE_PATH/$RCLONE_SERVICE" ]; then
    echo "Templated rclone service needs to be moved to $SYSTEMD_USER_SERVICE_PATH"
    check_if_sudo

    sudo cp -frs $PWD/rclone/service/$RCLONE_SERVICE $SYSTEMD_USER_SERVICE_PATH/$RCLONE_SERVICE
    echo -n "Telling systemd dameon to look for new services"
    systemctl --user daemon-reload
    echo "..done"
  else
    echo "rclone user service config $RCLONE_SERVICE already exists.. skipping"
  fi
  
  mkdir -p ~/.config/rclone/
  cp -frs $PWD/rclone/conf/* ~/.config/rclone/

  for i in $PWD/rclone/conf/*.env; do
    if [ -f "$i" ]; then
      echo "Sourcing file to determine what mount path to create $i"
      source "$i"
      SERVICE_NAME="`basename $MOUNT_DIR`"
      IS_RUNNING="`systemctl --user list-units | grep -c rclone@$SERVICE_NAME`"

      if [ $IS_RUNNING -eq 1 ]; then
        echo "Service $SERVICE_NAME already configured and running.. skipping"
        continue
      fi

      echo "rclone config mount paths may require a path that needs to be created by sudo user.."
      check_if_sudo
      
      echo "Creating mount path $MOUNT_DIR for service $SERVICE_NAME"
      sudo mkdir -p "$MOUNT_DIR"
      sudo chown $USR $MOUNT_DIR
      echo "Start templated service for $SERVICE_NAME remote"
      systemctl --user enable rclone@$SERVICE_NAME
      systemctl --user start rclone@$SERVICE_NAME
    fi
  done

else
  echo "Could not find $PWD/rclone.. skipping"
fi

