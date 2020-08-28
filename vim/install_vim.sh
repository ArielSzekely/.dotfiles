#!/bin/bash

echo 'Linking vim'
rm -rf ~/.vimrc
rm -rf ~/.vim
ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/.dotfiles/vim/.vim ~/.vim
