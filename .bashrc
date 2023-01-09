# My .Bashrc Config

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command.
shopt -s checkwinsize

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Add an "alert" alias for long running commands
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Ignore Upper And Lowercase When TAB Completion
bind "set completion-ignore-case on"

# Exports
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/Applications:$PATH"
export PATH="/var/lib/flatpak/exports/bin/:$PATH"
export PATH="$HOME/.local/share/neovim/bin/:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export EDITOR="nvim" 
export VISUAL="nvim"

# Changing ls To lsd
alias ls='lsd -alFh' # <-- My Favourite
alias la='lsd -a' # <-- Show Hidden Files
alias ll='lsa -lhF' # <-- Show In Listing Form 
alias l.='lsd -a | egrep "^\."'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Headsetcontrol aliases
alias h1='headsetcontrol -l 0'
alias hb='headsetcontrol -b'
alias hc='headsetcontrol'

# Nice aliases to have
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias wq='exit'

# Vim aliases
alias vim='nvim'
alias nvm='bob'
alias zconf='nvim $HOME/.zshrc'
alias bconf='nvim $HOME/.bashrc'
alias vconf='cd $HOME/.config/nvim/'
alias tconf='nvim $HOME/.config/alacritty/alacritty.yml'

# Gedit aliases
alias gd='gedit'
alias zconfv='gedit $HOME/.zshrc'
alias bconfv='gedit $HOME/.bashrc'
alias tconfv='gedit $HOME/.config/alacritty/alacritty.yml'

# Fun aliases
alias nf='neofetch'
alias pf='pfetch'
alias fm='fm6000'
alias cr='colorscript -r'
alias lc='lolcat'
alias cm='cmatrix'

# Trash aliases
alias trash='trash -iv'
alias trashl='trash-list'
alias trashr='trash-restore'
alias trashr='trash-restore'
alias trashm='trash-rm'
alias trashe='trash-empty'

# Making APT better
alias aptup='sudo apt update && sudo apt upgrade'
alias aptug='sudo apt upgrade'
alias aptud='sudo apt update'
alias aptin='sudo apt install'
alias aptrm='sudo apt remove'
alias aptpu='sudo apt purge'
alias aptcl='sudo apt clean'

# Convert APT to nala
apt() { 
  command nala "$@"
}
sudo() {
  if [ "$1" = "apt" ]; then
    shift
    command sudo nala "$@"
  else
    command sudo "$@"
  fi
}

# Starship prompt
eval "$(starship init bash)"

# Startup itmes
# cr
 nf
# fm
# pf

# Turning on Autojump
source /usr/share/autojump/autojump.sh 2>/dev/null

