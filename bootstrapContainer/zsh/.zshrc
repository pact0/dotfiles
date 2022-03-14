# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
export EDITOR=nvim
export VISUAL=nvim
export TERM=xterm-256color


alias tat="~/.local/bin/tat"
alias emoji="~/scripts/emoji_select.zsh"
#~/.local/share/Trash/
alias trashdir='cd ~/.local/bin/tat'

alias rm='echo "This is not the command you are looking for. user trash instead"; false'
# \rm file-without-hope -- to overcome ^
# set history
HISTFILESIZE=1000000000
HISTSIZE=1000000000
HISTFILE=~/.zsh_history
SAVEHIST=1000000000
setopt appendhistory
setopt share_history
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$(yarn global bin):$PATH"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell
setopt auto_cd # cd by typing directory name if it's not a command
setopt correct_all # autocorrect commands
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
# +---------+
# | HISTORY |
# +---------+

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.


# +---------+
# | ALIASES |
# +---------+
AUDIO="mpv --input-ipc-server=/tmp/mpvsocket"
alias radio2="$AUDIO http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_med/llnw/bbc_radio_two.m3u8"
alias radio4="$AUDIO http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_med/llnw/bbc_radio_fourfm.m3u8"
alias classic="$AUDIO http://icy-e-bab-04-cr.sharp-stream.com/absoluteradio.mp3"
alias absolute="$AUDIO 'http://network.absoluteradio.co.uk/core/audio/mp3/live.pls?service=vrbb'"
alias magic="$AUDIO 'http://www.radiofeeds.co.uk/bauer.pls?station=magicnational.mp3.m3u'"

alias ytaudio='mpv --ytdl-format="bestaudio"'
#Always make all directories necesary
alias mkdir='mkdir -p'

alias cat="bat"
# fuzzy select file to edit
alias p='nvim `fzf --preview="bat --color always {}"`'


source ~/dotfiles/zsh/scripts/fzf_scripts.zsh
source ~/dotfiles/zsh/aliases
#
# vi mode

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"



# alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F -h'
# alias ll='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F -hl'
# alias la='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F -hlA'
type -p exa > /dev/null && alias la='exa --all --colour always --icons -F'
type -p exa > /dev/null && alias lt='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F -hlt'
type -p exa > /dev/null && alias ls='exa --icons --colour always -F '
type -p exa > /dev/null && alias ll='exa --icons --colour always -F --long --git -b '
type -p exa > /dev/null && alias tree='exa -T --all --colour always --icons'
#alias ltag='ls -t | ag'
alias dev="cd ~/Documents/dev"
alias ra='ranger'
alias h='history'
alias grep='grep --color=tty -d skip'

type -p nvim > /dev/null && alias vim="nvim"
type -p nvim > /dev/null && alias v="nvim"
type -p nvim > /dev/null && alias vimdiff="nvim -d"

alias se="sudoedit"
alias home="cd ~"


# Add this to your zshrc or bzshrc file
_not_inside_tmux() { [[ -z "$TMUX" ]] }

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}

ensure_tmux_is_running

man() {
	env \
		LESS_TERMCAP_md=$'\e[1;36m' \
		LESS_TERMCAP_me=$'\e[0m' \
		LESS_TERMCAP_se=$'\e[0m' \
		LESS_TERMCAP_so=$'\e[1;40;92m' \
		LESS_TERMCAP_ue=$'\e[0m' \
		LESS_TERMCAP_us=$'\e[1;32m' \
			man "$@"
}
# Man without options will use fzf to select a page
#
function man(){
	export	LESS_TERMCAP_md=$'\e[1;36m'
	export	LESS_TERMCAP_me=$'\e[0m'
	export	LESS_TERMCAP_se=$'\e[0m'
	export	LESS_TERMCAP_so=$'\e[1;40;92m'
	export	LESS_TERMCAP_ue=$'\e[0m'
	export	LESS_TERMCAP_us=$'\e[1;32m'
	MAN="/usr/bin/man"
	if [ -n "$1" ]; then
		$MAN "$@"
		return $?
	else
		$MAN -k . | fzf --reverse --preview="echo {1,2} | sed 's/ (/./' | sed -E 's/\)\s*$//' | xargs $MAN" | awk '{print $1 "." $2}' | tr -d '()' | xargs -r $MAN
		return $?
	fi
}

function cd() {
	# Try a normal cd
	builtin cd "$@" 2> /dev/null
	if [ $? = 0 ]; then
		# If we get here cd was successful so do a ls
		ls
	else
		# If we get here, cd was not successful
		if [ -f "$1" ]; then
			# If there is a file there, try and open it in vim
			# ToDo: smarter open so it will open in zathura if it's a pdf for
			# example
			$EDITOR "$1"
		else
			# Otherwise fail clearly
			echo "Can't cd"
		fi
	fi
	#updatePath
}

function mkcd() {
	mkdir -p "$1"
	cd "$1"
}

plugins=(... sudo autojump )
#plugin+=(zsh-vi-mode)
# starship
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"


# bind k j in vim mode to fuzzy search and arrows in normal mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

source ~/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/plugins/fzf-tab/fzf-tab.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export XAUTHORITY=/home/pacto/.Xauthority

export XAUTHORITY=/home/pacto/.Xauthority

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
