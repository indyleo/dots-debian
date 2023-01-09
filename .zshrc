# My .Zshrc Config

# Exports
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/Applications:$PATH"
export PATH="$HOME/.local/share/neovim/bin/:$PATH"
export PATH="/var/lib/flatpak/exports/bin/:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export EDITOR="nvim" 
export VISUAL="nvim"

# Enable colors
autoload -U colors && colors

# Histroy
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char
# Fix backspace bug when switching modes
bindkey -v '^?' backward-delete-char

# Edit line in vim with "ctrl-e"
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Change cursor shape for different vi modes
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

# Changing ls To lsd
alias ls='lsd -alFh' # <-- My Favourite
alias la='lsd -a' # <-- Show Hidden Files
alias ll='lsa -lhF' # <-- Show In Listing Form 
alias l.='lsd -a | egrep "^\."'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# HeadsetControl aliases
alias h1='headsetcontrol -l 0'
alias hb='headsetcontrol -b'
alias hc='headsetcontrol'

# Nice aliases To have
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
alias wconf='nvim $HOME/.config/awesome/rc.lua'

# Gedit aliases
alias gd='gedit'
alias zconfv='gedit $HOME/.zshrc'
alias bconfv='gedit $HOME/.bashrc'
alias tconfv='gedit $HOME/.config/alacritty/alacritty.yml'
alias wconfv='gedit $HOME/.config/awesome/rc.lua'

# Fun Aliases
alias nf='neofetch'
alias pf='pfetch'
alias fm='fm6000'
alias cr='colorscript -r'
alias lc='lolcat'
alias cm='cmatrix'

# Trash Aliases
alias trash='trash -iv'
alias trashl='trash-list'
alias trashr='trash-restore'
alias trashr='trash-restore'
alias trashm='trash-rm'
alias trashe='trash-empty'

# Making APT Better
alias aptup='sudo apt update && sudo apt upgrade'
alias aptug='sudo apt upgrade'
alias aptud='sudo apt update'
alias aptin='sudo apt install'
alias aptrm='sudo apt remove'
alias aptpu='sudo apt purge'
alias aptcl='sudo apt clean'

# Convert APT to Nala
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
eval "$(starship init zsh)"

# Startup itmes
# cr
 nf
# fm
# pf

# Turning on Autojump & Syntax-Highlighting
source /usr/share/autojump/autojump.sh 2>/dev/null
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null