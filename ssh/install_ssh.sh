#!/bin/bash

echo 'Linking ssh'
rm ~/.ssh/ssh-servers
rm ~/.ssh/config
rm ~/.ssh/generic-config
ln -s ~/.dotfiles/ssh/ssh-config/ssh-servers ~/.ssh/ssh-servers
ln -s ~/.dotfiles/ssh/ssh-config/generic-config ~/.ssh/generic-config
if [ "$(~/.dotfiles/scripts/is-mac.sh)" == 1 ]; then
  ln -s ~/.dotfiles/ssh/ssh-config/mac-config ~/.ssh/config
else
  ln -s ~/.dotfiles/ssh/ssh-config/config ~/.ssh/config
fi
