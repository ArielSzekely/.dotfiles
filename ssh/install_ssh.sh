#!/bin/bash

echo 'Linking ssh'
rm ~/.ssh/ssh-servers
rm ~/.ssh/config
ln -s ~/.dotfiles/ssh/ssh-config/ssh-servers ~/.ssh/ssh-servers
if [ "$(~/.dotfiles/scripts/is-mac.sh)" ]; then
  ln -s ~/.dotfiles/ssh/ssh-config/mac-config ~/.ssh/config
else
  ln -s ~/.dotfiles/ssh/ssh-config/config ~/.ssh/config
fi
