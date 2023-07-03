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

# Ranger Not Loading Default Config
export RANGER_LOAD_DEFAULT_RC=false
### End Of Exports ###

# Histroy
export HISTCONTROL=ignoredups:erasedups # no duplicate entries
export HISTFILE="$XDG_CACHE_HOME"/history
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

# Rangercd Bind
bind '"\C-x":"rangercd\C-m"'

# Ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

# Startup Stuff
# neofetch
# pfetch
colorscript -r

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

### Aliases ###
# Making ls Better
alias ls='exa --group-directories-first --color=auto' # Basic exa But with Some Nice Flags
alias la='exa -a --group-directories-first --color=auto' # Show Hidden Files
alias ll='exa -lF --group-directories-first --color=auto' # Show In Listing Form 
alias l='exa -alF --group-directories-first --color=auto' # My Favourite
alias lt='exa -a --tree --group-directories-first --color=always ' # Tree Listing
alias l.='exa -a | egrep "^\."' # Show Only Hidden File

# Cat to Bat Alias
alias cat='batcat -pn --pager=""'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# PS Aliases
alias psa="ps auxf"
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# Confirm Before Doing Something Or The Output Being Verbose Or Both
alias rm='rm -iv'
alias cp='cp -irv'
alias mv='mv -iv'
alias ln='ln -i'
alias rmdir='rmdir -v'
alias mkdir='mkdir -pv'

# Nice Aliases To Have
alias wq='exit'
alias rn='ranger'
alias rncd='rangercd'
alias ping='ping -c 10'
alias src='source'
alias df='df -h'
alias mimetype='file --mime-type'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias wal='find ~/Pictures/Wallpapers/ -type f | shuf -n 1 | xargs xwallpaper --stretch'
alias xwal='xwallpaper --stretch'

# Get Error Messages From Journalctl
alias jctl='journalctl -p 3 -xb'

# Yt-dlp Aliases
alias yta-aac='yt-dlp --extract-audio --audio-format aac '
alias yta-best='yt-dlp --extract-audio --audio-format best '
alias yta-flac='yt-dlp --extract-audio --audio-format flac '
alias yta-m4a='yt-dlp --extract-audio --audio-format m4a '
alias yta-mp3='yt-dlp --extract-audio --audio-format mp3 '
alias yta-opus='yt-dlp --extract-audio --audio-format opus '
alias yta-vorbis='yt-dlp --extract-audio --audio-format vorbis '
alias yta-wav='yt-dlp --extract-audio --audio-format wav '
alias ytv-best='yt-dlp -f bestvideo+bestaudio '

# Xresources Aliases
alias load='xrdb -load ~/.Xresources'
alias merge='xrdb -merge ~/.Xresources'

# CD Aliases
alias home='cd ~'
alias conf='cd ~/.config'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias bd='cd "$OLDPWD"'

# Neovim Aliases
alias vim='nvim'
alias svi='sudo nvim'
alias shconf='nvim $HOME/.bashrc'
alias pfconf='nvim $HOME/.profile'
alias wmconf='nvim $XDG_CONFIG_HOME/awesome/rc.lua'
alias kiconf='nvim $XDG_CONFIG_HOME/kitty/kitty.conf'
alias viconf='nvim $XDG_CONFIG_HOME/nvim/init.lua'
alias poconf='nvim $XDG_CONFIG_HOME/polybar/config.ini'
alias piconf='nvim $XDG_CONFIG_HOME/picom/picom.conf'
alias sxconf='nvim $XDG_CONFIG_HOME/sxhkd/sxhkdrc'

# Trash Aliases
alias trash='trash -iv'
alias trashl='trash-list'
alias trashr='trash-restore'
alias trashrm='trash-rm'
alias trashe='trash-empty'

# GPG encryption
alias gpg-check='gpg --keyserver-options auto-key-retrieve --verify'
alias gpg-retrieve='gpg --keyserver-options auto-key-retrieve --receive-keys'

# Git Aliases
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias stat='git status'
alias tag='git tag'
alias newtag='git tag -a'

# Shell Aliases
alias srb='source ~/.bashrc'
alias rs='reset'
alias cl='clear'

# Chmod Aliases
alias mxp='chmod a+x'
alias mxm='chmod a-x'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# Cargo Aliases
alias carin='cargo install'
alias carun='cargo uninstall'
alias carrm='cargo remove'
alias carup='cargo update'
alias carcl='cargo clean'

# Go Aliases
alias gin='go install'
alias gge='go get'
alias gli='go list'

# Flatpak Aliases
alias flatin='flatpak install'
alias flatun='flatpak uninstall'
alias flatup='flatpak update'
alias flatse='flatpak search'
alias flatru='flatpak run'
alias flatki='flatpak kill'

# Making APT Better
alias aptin='sudo apt install'
alias aptup='sudo apt update && sudo apt upgrade'
alias aptud='sudo apt update'
alias aptug='sudo apt upgrade'
alias aptrm='sudo apt remove'
alias aptpu='sudo apt purge'
### End Of Aliases ###

### Functions ###
# Easier Navigation
up() {
  local d=""
  local limit="$1"

  # Default to limit of 1
  if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
    limit=1
  fi

  for ((i=1;i<=limit;i++)); do
    d="../$d"
  done

  # perform cd. Show error if cd fails
  if ! cd "$d"; then
    echo "Couldn't go up $limit dirs.";
  fi
}

# Copy and go to the directory
cpg() {
	if [ -d "$2" ]; then
		cp "$1" "$2" && cd "$2"
	else
		cp "$1" "$2"
	fi
}

# Move and go to the directory
mvg() {
	if [ -d "$2" ]; then
		mv "$1" "$2" && cd "$2"
	else
		mv "$1" "$2"
	fi
}

# Create and go to the directory
mkdirg() {
	mkdir -p "$1"
	cd "$1"
}

# APT To Nala
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

# Archive Extraction
extract() {
  if [ -f "$1" ]; then
    case $1 in
      *.tar.bz2) tar xjf "$1"    ;;
      *.tar.gz)  tar xzf "$1"    ;;
      *.bz2)     bunzip2 "$1"    ;;
      *.rar)     unrar x "$1"    ;;
      *.gz)      gunzip "$1"     ;;
      *.tar)     tar xf "$1"     ;;
      *.tbz2)    tar xjf "$1"    ;;
      *.tgz)     tar xzf "$1"    ;;
      *.zip)     unzip "$1"      ;;
      *.Z)       uncompress "$1" ;;
      *.7z)      7z x "$1"       ;;
      *.deb)     ar x "$1"       ;;
      *.tar.xz)  tar xf "$1"     ;;
      *.tar.zst) unzstd "$1"     ;;
      *)         echo "'$1' cannot be extracted via extract" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Be Lazy With Git
lazygall() {
	git add .
	git commit -m "$1"
	git push
}

lazygup() {
	git add -u
	git commit -m "$1"
	git push
}

# Ramger CD
rangercd() {
    tmp="$(mktemp)"
    ranger --choosedir="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        command rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"                                               
    fi
}
### End Of Functions ###

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
