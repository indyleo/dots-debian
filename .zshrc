# Clear
clear

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function Tmux_Prompt() {
  # Prompt the user to confirm if they want to start a tmux session
  echo -n "Do you want to start a tmux session? (yes/no): "
  read -r user_response

  case $user_response in
    yes|y)
      echo "Options:"
      echo "1. Restore an existing tmux session"
      echo "2. Start a new tmux session"
      echo -n "Choose an option (1/2): "
      read -r option

      case $option in
        1)
          # Display a numbered list of active tmux sessions
          existing_sessions=$(tmux list-sessions 2>/dev/null | awk -F: '{print $1}')

          if [ -z "$existing_sessions" ]; then
            echo "No active tmux sessions found."
            return
          fi

          echo "Active tmux sessions:"
          select session in $existing_sessions; do
            if [ -n "$session" ]; then
              tmux attach-session -t "$session"
              return
            else
              echo "Invalid selection."
            fi
          done
          ;;
        2)
          # Prompt the user to enter a name for the new session
          echo -n "Enter a name for the new tmux session: "
          read -r session_name

          if [ -n "$session_name" ]; then
            tmux new-session -s "$session_name"
          else
            echo "Session name cannot be empty."
          fi
          ;;
        *)
          echo "Invalid option. Returning to Shell."
          ;;
      esac
      ;;
    no|n)
      # Return to the Shell without taking further action
      echo "Returning to Shell."
      ;;
    *)
      echo "Invalid input. Returning to Shell."
      ;;
  esac
}

# Check if already in a tmux session and call the function accordingly
if [ -z "$TMUX" ]; then
  Tmux_Prompt
else
  echo "\n"
fi

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
[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"
[ -f "$HOME/.functionrc" ] && source "$HOME/.functionrc"

# lfcd
bindkey -s '^x' 'lc\n'

# Starship prompt
eval "$(starship init zsh)"

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
