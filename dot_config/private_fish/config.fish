set -U fish_greeting

fish_vi_key_bindings

# Wayland specific envvars
#set -gx MOZ_ENABLE_WAYLAND 1
#set -gx MOZ_DBUS_REMOTE 1
#set -gx MOZ_WEBRENDER 1
#set -gx MOZ_ACCELERATED 1
#set -gx XDG_SESSION_TYPE wayland
#set -gx _JAVA_AWT_WM_NONREPARENTING 1

# Make default programs
set -gx BROWSER firefox
set -gx EDITOR nvim
set -gx FILE nnn
set -gx READER zathura
set -gx PAGER "bat --plain"
set -gx STATUSBAR waybar
set -gx TERMINAL alacritty
set -gx VISUAL ewrap

# Set cursor theme
# set -gx XCURSOR_THEME Adwaita
# set -gx SWAY_CURSOR_THEME Adwaita
# set -gx XCURSOR_SIZE 16
# set -gx SWAY_CURSOR_SIZE 16

# Desktop settings for screen casting
# set -gx XDG_CURRENT_DESKTOP sway

#set LIBVA_DERIVE_NAME nvidia
#set XDG_SESSION_TYPE wayland
#set GDM_BACKEND navidia-drm
#set __GLX_VENDOR_LIBRARY_NAME nvidia
#set WLR_NO_HARDWARE_CURSORS 1

# Set bat as man pager
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Customize PATH
set -gx GOPATH $HOME/go
set -gx PATH $HOME/.node/bin $HOME/.yarn/bin $HOME/.local/bin /usr/lib/go/bin $GOPATH/bin $HOME/.cargo/bin $HOME/.local/share/gem/ruby/3.0.0/bin $PATH

# FZF options
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git --exclude node_modules'
set -gx FZF_DEFAULT_OPTS '--height 50% --layout=reverse --border --info=inline --marker="*" --bind "ctrl-y:execute(echo {+} | wl-copy)" --bind "ctrl-a:select-all" --bind "?:toggle-preview"'
set fzf_history_opts --sort --exact --history-size=30000
set fzf_fd_opts --hidden --follow --exclude=.git
set fzf_preview_dir_cmd exa --all --color=always

fzf_configure_bindings --git_status=\e\cs --history=\cr --variables --git_log=\e\cl --directory=\cp

# BAT options
set -gx BAT_CONFIG_PATH $HOME/.config/bat/bat.conf

# ripgrep options
set -gx RIPGREP_CONFIG_PATH $HOME/.config/ripgrep/config

# SSH environment file
set -gx SSH_ENV $HOME/.ssh/environment

# nnn settings
set -gx NNN_FIFO /tmp/nnn.fifo
set -gx NNN_OPENER handlr-open
set -gx NNN_SSHFS_OPTS sshfs -o follow_symlinks
set -gx NNN_USE_EDITOR 1
set -gx NNN_COLORS 2136
set -gx NNN_TRASH 2 # configure gio trash
# d: detail mode
# e: open text files in terminal
# u: use selection, don't prompt to choose between selection and hovered entry
# r: show cp/mv progress
# U: show file's owner and group in status bar
set -gx NNN_OPTS dreuUH
set -gx NNN_PLUG "k:pskill;t:preview-tui;o:fzopen;m:nmount;z:autojump;h:fzhist;c:diffs;v:fzplug;p:preview-tabbed;"
set -gx NNN_BMS "d:$HOME/Downloads/;c:$HOME/.local/share/chezmoi/;v:$HOME/.config/nvim/;w:$HOME/work;"

# z settings
set -U Z_DATA "$HOME/.z"
set -U ZO_METHOD nvim

# Grim settings
set -gx GRIM_DEFAULT_DIR "$HOME/pictures/screenshots"

# NPM exports
set -gx NODE_PATH $HOME/.node/lib/node_modules

# PARUZ config
set -gx PARUZ yay

# Cargo
set -gx CARGO_NET_GIT_FETCH_WITH_CLI true

if test -e $HOME/.config/fish/functions/local.fish
    source $HOME/.config/fish/functions/local.fish
end

if test -e $HOME/.config/fish/abbr
    source $HOME/.config/fish/abbr/yarn.fish
    source $HOME/.config/fish/abbr/docker.fish
end

alias c="clear"
alias cat="bat"
alias ch="clipman pick --print0 --tool=CUSTOM --tool-args=\"fzf --prompt 'pick > ' --bind 'tab:up' --cycle --read0\""
alias chgrp='chgrp --preserve-root'
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'
alias ff='firefox'
alias g="git"
alias gt="gotestsum --format standard-verbose -- -cover"
alias lg='lazygit'
alias ll='exa -la --git --icons'
alias logme="script -f /tmp/(date)+\"%d-%b-%y_%H-%M-%S\"_shell.log"
alias ls='exa'
alias lzd='lazydocker'
alias mkdir='mkdir -p -v'
alias N='sudo -E nnn -deH'
alias ping='ping -c 5'
alias q="exit"
alias :q="exit"
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias xdg-open="handlr open"
alias yaegi='rlwrap yaegi'
alias se="sudoedit"
alias home="cd ~"


# kubectl
alias k='kubectl'
alias kg='kubectl get'
alias kd='kubectl describe'
alias kdp='kubectl describe pod'
alias kdd='kubectl describe deployment'
alias krm='kubectl delete'
alias kgall='kubectl get --all-namespaces all'
alias kgp='kubectl get pod'
alias kgd='kubectl get deployments'
alias kgsvc='kubectl get service'
alias kl='kubectl logs --all-containers=true'
alias kei='kubectl exec -it'

# docker
alias dcleannone='docker rmi (docker images | grep "<none>" | awk \'{print $3}\')'
alias dstopall='docker ps -a | awk \'{print $1}\' | tail -n +2 | xargs docker stop'
alias dremoveall='docker ps -a | awk \'{print $1}\' | tail -n +2 | xargs docker rm -fv'

# git pull++

alias gpullall='fd --type d --hidden \'.git$\' | rev | cut -d \'/\' -f2- | rev | xargs -I{} bash -c \'echo {} && git -C {} status -b -s && git -C {} pull && echo\''

alias gpullallfast='fd --type d --hidden \'.git$\' | rev | cut -d \'/\' -f2- | rev | xargs -P10 -I{} git -C {} pull'

# other
alias get-local-ip="ifconfig \
                    | grep 'inet ' \
                    | grep -v '127.0.0.1' \
                    | awk '{print $2}'"
alias get-ext-ip="http -b ipinfo.io/ip"
alias urldecode='python3 -c "import sys, urllib.parse as ul; \
    print(ul.unquote_plus(sys.argv[1]))"'
alias urlencode='python3 -c "import sys, urllib.parse as ul; \
    print (ul.quote_plus(sys.argv[1]))"'
alias weather="http -b v2.wttr.in"

starship init fish | source
zoxide init fish | source
direnv hook fish | source


# Nightfox Color Palette
# Style: nightfox
# Upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/nightfox/nightfox_fish.fish
set -l foreground cdcecf
set -l selection 283648
set -l comment 526175
set -l red c94f6d
set -l orange f4a261
set -l yellow dbc074
set -l green 81b29a
set -l purple 9d79d6
set -l cyan 63cdcf
set -l pink d67ad2

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

set -U __done_min_cmd_duration 10000
set -U __done_exclude n

# Start Sway at login
# if status is-login
#     if test -z "$DISPLAY" -a $XDG_VTNR = 1 -a (tty) = /dev/tty1 -a "(pgrep sway)"
#         sway
#     end
# end

# ensure tmux is running
alias tat="exec ~/.local/bin/tat"
#if status is-interactive
#and not set -q TMUX
#  tat
#end
#

function nvim-chad
    env NVIM_APPNAME=nvim-chad nvim
end

function nvim-astro
    env NVIM_APPNAME=nvim-astro nvim
end

function nvims
    set items nvim-astro nvim-chad nvim-chadder
    set config (printf "%s\n" $items | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
    if [ -z $config ]
        echo "Nothing selected"
        return 0
    else if [ $config = "default" ]
        set config ""
    end
    env NVIM_APPNAME=$config nvim $argv
end


# abbreviates
set -U ABBR_TIPS_PROMPT "\n󰌵 \e[1m{{ .abbr }}\e[0m => {{ .cmd }}"
set -U ABBR_TIPS_ALIAS_WHITELIST # Not set

set -U ABBR_TIPS_REGEXES '(^(\w+\s+)+(-{1,2})\w+)(\s\S+)' '(^( ?\w+){3}).*' '(^( ?\w+){2}).*' '(^( ?\w+){1}).*'

alias bsh=replay
