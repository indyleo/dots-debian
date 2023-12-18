# My .Bashrc Config

### Exports ###
# Path Variables
if [ -d "$HOME/go/bin/" ]; then
  PATH="$HOME/go/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ]; then
  PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.local/scripts" ]; then
  PATH="$HOME/.local/scripts:$PATH"
fi

if [ -d "$HOME/Applications" ]; then
  PATH="$HOME/Applications:$PATH"
fi

if [ -d "$HOME/.local/share/bob/nvim-bin" ]; then
  PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
fi

# XDG Exports
if [ -z "$XDG_CONFIG_HOME" ]; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

if [ -z "$XDG_DATA_HOME" ]; then
    export XDG_DATA_HOME="$HOME/.local/share"
fi

if [ -z "$XDG_STATE_HOME" ]; then
    export XDG_STATE_HOME="$HOME/.local/state"
fi

if [ -z "$XDG_CACHE_HOME" ]; then
    export XDG_CACHE_HOME="$HOME/.cache"
fi

# Some Nice Exports
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"
export MANPAGER="less"
export TERM="xterm-256color"
export TERMINAL="kitty"
export COLORTERM="truecolor"
export WM="AwesomeWM"
export BROWSER="brave-browser"
export OPENER="xdg-open"
export READER="zathura"
export VIDEO="mpv"
export IMAGE="sxiv"

# Disable files
export LESSHISTFILE=-

# Less Colors 
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
### End Of Exports ###

# Histroy
export HISTCONTROL=ignoredups:erasedups # no duplicate entries
export HISTFILE="$XDG_CACHE_HOME"/history-bash
export HISTFILESIZE=10000
export HISTSIZE=5000

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# SHOPT
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize # checks term size when bash regains control

# Set keybingings to vi
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# Lfcd Bind
bind '"\C-x":"lfcd\C-m"'

# Ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

# Startup Stuff
# neofetch
# pfetch
# colorscript -r

# Turn On Bash Completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

### Completions ###
# Gh Completions
eval "$(gh completion -s bash)"

# Nala Completions
eval "$(nala --show-completion bash)"
### End Of Completions ###

# Load aliases and functions if exists.
[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"
[ -f "$HOME/.functionrc" ] && source "$HOME/.functionrc"

# Starship prompt
eval "$(starship init bash)"

# Autojump
if [ -f "/usr/share/autojump/autojump.sh" ]; then
	. /usr/share/autojump/autojump.sh
elif [ -f "/usr/share/autojump/autojump.bash" ]; then
	. /usr/share/autojump/autojump.bash
else
	echo "can't found the autojump script"
fi

# Cargo
. "$HOME/.cargo/env"
