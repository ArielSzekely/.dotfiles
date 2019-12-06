#!/bin/bash

echo 'Linking ssh'
rm ~/.ssh/config
ln -s ~/.dotfiles/ssh/ssh-config/config ~/.ssh/config
