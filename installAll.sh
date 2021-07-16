#!/bin/bash
pacman -S yay git base-devel
yay -S $(cat dependencies | awk '{print $1}') 
stow config tmux zsh
