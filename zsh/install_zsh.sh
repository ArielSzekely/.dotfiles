#!/bin/bash

echo 'Linking zsh'

# Clone oh-my-zsh if it isn't installed already
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo 'Installing .oh-my-zsh'
  ./zsh/install_oh_my_zsh.sh
fi

rm ~/.zshrc
rm -f ~/.oh-my-zsh/custom/completion.zsh
rm -f ~/.oh-my-zsh/custom/navigation.zsh
rm -f ~/.oh-my-zsh/custom/source-vim.zsh
rm -f ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
rm -f ~/.oh-my-zsh/custom/themes/arielszekely.zsh-theme
rm -f ~/.oh-my-zsh/custom/themes/arielszekely.zsh-theme
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh/.oh-my-zsh/custom/completion.zsh ~/.oh-my-zsh/custom/completion.zsh
ln -s ~/.dotfiles/zsh/.oh-my-zsh/custom/source-vim.zsh ~/.oh-my-zsh/custom/source-vim.zsh
ln -s ~/.dotfiles/zsh/.oh-my-zsh/custom/navigation.zsh ~/.oh-my-zsh/custom/navigation.zsh
ln -s ~/.dotfiles/zsh/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
ln -s ~/.dotfiles/zsh/.oh-my-zsh/custom/themes/arielszekely.zsh-theme ~/.oh-my-zsh/custom/themes/arielszekely.zsh-theme

