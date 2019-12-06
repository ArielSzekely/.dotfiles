#!/bin/bash

echo 'Linking zsh'

# Clone oh-my-zsh if it isn't installed already
if [ -d '$/.oh-my-zsh' ]; then
  echo 'Installing .oh-my-zsh'
  ./install_oh_my_zsh.sh
fi

rm ~/.zshrc
rm -rf ~/.oh-my-zsh/custom
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh/.oh-my-zsh/custom ~/.oh-my-zsh/custom
