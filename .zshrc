# Clear
clear

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Tmux Helper
tmuxhelper

# Enable colors
autoload -U colors && colors

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$XDG_CACHE_HOME/history-zsh

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Completions
eval "$(gh completion -s zsh)"
eval "$(nala --show-completion zsh)"
fpath=($HOME/Zsh-Plugins/zsh-completions/src $fpath)

# Startup
fastfetch

# vi mode
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
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
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
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and functions if exists.
[[ -f "$HOME/.aliasrc" ]] && source "$HOME/.aliasrc"
[[ -f "$HOME/.functionrc" ]] && source "$HOME/.functionrc"

# Bindkeys
bindkey -s '^x' 'lc\n'
bindkey -s '^a' 'tmuxhelper\n'

# OMP prompt
eval "$(oh-my-posh init zsh --config ${XDG_CONFIG_HOME-$HOME/.config}/ohmyposh/base.toml)"

# Fzf
source <(fzf --zsh)

# Search history
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Zoxide
eval "$(zoxide init zsh --cmd cd)"

# Loading zsh plugins (LAST)
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source ~/Zsh-Plugins/zsh-autopair/autopair.zsh 2>/dev/null
source ~/Zsh-Plugins/zsh-history-substring-search/zsh-history-substring-search.zsh 2>/dev/null
source ~/Zsh-Plugins/zsh-you-should-use/you-should-use.plugin.zsh 2>/dev/null
