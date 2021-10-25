#!/bin/bash
pacman -S yay git base-devel ripgrep fd bat 
yay -S $(cat dependencies | awk '{print $1}') 
yay -S nerd-fonts-complete exa
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
stow config tmux zsh
chsh -s $(which zsh)
