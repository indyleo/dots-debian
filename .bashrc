# My .Bashrc Config

# Ignore Upper And Lowercase When TAB Completion
bind "set completion-ignore-case on"

# Exports
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/Applications:$PATH"
export PATH="/var/lib/flatpak/exports/bin/:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export EDITOR="nvim" 
export VISUAL="nvim"
export PAGER="moar"

# Changing ls To lsd
alias ls='lsd -alFh' # <-- My Favourite
alias la='lsd -a' # <-- Show Hidden Files
alias ll='lsd -lhF' # <-- Show In Listing Form 
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
alias psa='ps aux'
alias rezsh='reset && zsh'
alias rebash='reset && bash'

# Vim aliases
alias vim='nvim'
alias nvm='bob'
alias zconf='nvim $HOME/.zshrc'
alias bconf='nvim $HOME/.bashrc'
alias vconf='cd $HOME/.config/nvim/'

# Gedit aliases
alias gd='gedit'
alias zconfv='gedit $HOME/.zshrc'
alias bconfv='gedit $HOME/.bashrc'
alias vconfv='nautilus ~/.config/nvim/'

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

