#!/bin/bash

echo 'Linking vim'
rm -rf ~/.vimrc
rm -rf ~/.vim
ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/.dotfiles/vim/.vim ~/.vim

echo 'Installing vim plugins'
git -C ~/.dotfiles submodule update --init vim/.vim/pack/plugins/start/yats.vim
