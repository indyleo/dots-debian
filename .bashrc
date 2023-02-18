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

# Startup itmes
 nf
