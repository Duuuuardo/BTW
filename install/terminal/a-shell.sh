#!/bin/bash

# Install zsh if not present
yay -S --needed --noconfirm zsh starship

# Configure the bash shell using BTW defaults (fallback)
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak
cp ~/.local/share/btw/configs/bashrc ~/.bashrc

# Configure the zsh shell using BTW defaults
[ -f ~/.zshrc ] && cp ~/.zshrc ~/.zshrc.bak
cp ~/.local/share/btw/configs/zshrc ~/.zshrc

# Load the PATH for use later in the installers
source ~/.local/share/btw/defaults/zsh/shell

[ -f ~/.inputrc ] && mv ~/.inputrc ~/.inputrc.bak
# Configure the inputrc using BTW defaults
cp ~/.local/share/btw/configs/inputrc ~/.inputrc

# Change default shell to zsh
if [ "$SHELL" != "$(which zsh)" ]; then
  chsh -s $(which zsh)
fi
