# Path Variables
if [ -d "$HOME/go/bin/" ] ;
  then PATH="$HOME/go/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ] ;
  then PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.local/scripts" ] ;
  then PATH="$HOME/.local/scripts:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi

if [ -d "$HOME/.local/share/bob/nvim-bin" ] ;
  then PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
fi

# XDG Exports
if [ -z "$XDG_CONFIG_HOME" ] ; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

if [ -z "$XDG_DATA_HOME" ] ; then
    export XDG_DATA_HOME="$HOME/.local/share"
fi

if [ -z "$XDG_CACHE_HOME" ] ; then
    export XDG_CACHE_HOME="$HOME/.cache"
fi

# Some Nice Exports
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
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

# Gh Completions
eval "$(gh completion -s bash)"

# Rustup
. "$HOME/.cargo/env"
