#!/bin/bash

echo 'Linking tmux'
rm -f ~/.tmux
rm ~/.tmux.conf
ln -s ~/.dotfiles/tmux/.tmux ~/.tmux
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
