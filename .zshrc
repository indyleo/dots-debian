# My .Zshrc Config

# Exports
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/Applications:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export PATH="/var/lib/flatpak/exports/bin/:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export EDITOR="nvim" 
export VISUAL="nvim"
export PAGER="moar"

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
alias ll='lsd -lhF' # <-- Show In Listing Form 
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
alias psa='ps aux'
alias rezsh='reset && zsh'
alias rebash='reset && bash'

# Vim aliases
alias vim='nvim'
alias nvm='bob'
alias zconf='nvim $HOME/.zshrc'
alias bconf='nvim $HOME/.bashrc'
alias vconf='cd $HOME/.config/nvim/'

# Gnome Text Editor aliases
alias gt='gnome-text-editor'
alias zconfv='gnome-text-editor $HOME/.zshrc'
alias bconfv='gnome-text-editor $HOME/.bashrc'
alias vconfv='nautilus ~/.config/nvim/'

# Fun Aliases
alias nf='neofetch'
alias lc='lolcat'
alias cm='cmatrix'

# Trash Aliases
alias trash='trash -iv'
alias trashl='trash-list'
alias trashr='trash-restore'
alias trashm='trash-rm'
alias trashe='trash-empty'

# Making DNF Better
alias dnfup='sudo dnf update && sudo dnf upgrade'
alias dnfug='sudo dnf upgrade'
alias dnfud='sudo dnf update'
alias dnfin='sudo dnf install'
alias dnfrm='sudo dnf remove'

# Starship prompt
eval "$(starship init zsh)"

# Turning on Syntax Highlighting 
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
