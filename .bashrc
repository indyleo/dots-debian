# My .Bashrc Config

# Other Exports
export HISTCONTROL=ignoredups:erasedups # no duplicate entries

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

# Nala completion
_nala_completion() {
    local IFS=$'
'
    COMPREPLY=( $( env COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   _NALA_COMPLETE=complete_bash $1 ) )
    return 0
}
complete -o default -F _nala_completion nala

# Aliases
source $HOME/.aliasrc 2>/dev/null

# Functions
source $HOME/.functionrc 2>/dev/null

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
