#!/bin/bash
pacman -S yay

yay -S $(cat dependencies)

stow config tmux zsh
