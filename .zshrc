export PROMPT='%F{#83a598}%2~ %#%f '

# Set locale
export LANG=en_US.UTF-8

# Enable colors
export CLICOLOR=1

# Disable .lesshst file
export LESSHISTFILE=/dev/null

# Aliases
alias nv=nvim\ .

# Enable forward-history-search by <C-s>
stty -ixon

# Enable VIM mode
bindkey -v
bindkey ^R history-incremental-search-backward
bindkey ^S history-incremental-search-forward
bindkey -M viins 'fj' vi-cmd-mode
export KEYTIMEOUT=100

# BREW
# Add home brew to path
export PATH=/opt/homebrew/bin:$PATH
# Add autocomplete from homebrew pkgs
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
fi

# RUST
export CARGO_HOME=$HOME/.local/share/cargo
