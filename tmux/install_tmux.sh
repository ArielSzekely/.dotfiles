#!/bin/bash

echo 'Linking tmux'
rm ~/.tmux.conf
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
