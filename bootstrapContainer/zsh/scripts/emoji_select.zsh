#!/bin/bash

selectedSmiley="$(fzf --layout=reverse --exact < "$HOME"/.config/emojis_list | cut --fields=1 --delimiter=' ')"
echo -n "$selectedSmiley" | xsel --primary
echo -n "$selectedSmiley" | xsel --clipboard
