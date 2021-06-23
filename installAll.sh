#!/bin/bash
sudo pacman -S yay

yay -S $(cat ~/dotfiles/dependencies)
