# My .Bashrc Config

# Exports
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/Applications:$PATH"
export PATH="/var/lib/flatpak/exports/bin/:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export EDITOR="nvim" 
export VISUAL="gedit"
export PAGER="moar"

# Startup Stuff
 # neofetch
 # pfetch

# Aliases
source $HOME/.aliasrc 2>/dev/null

# Starship prompt
eval "$(starship init bash)"

# Rustup
