export DOTFILES="$HOME/.dotfiles"

# XDG
export XDG_CONFIG_HOME=$HOME/.config


# git
export GIT_DOT_DIR="$XDG_CONFIG_HOME/git"
export GIT_CONFIG_GLOBAL="$GIT_DOT_DIR/.gitconfig"

# editor
export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export VISUAL="nvim"

# zsh
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# tmux
export TMUXDOTDIR="$XDG_CONFIG_HOME/tmux"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM="xterm-256color"
export LD_LIBRARY_PATH=/usr/local/lib

export BUN_INSTALL="$HOME/.bun"
export GOPATH="$HOME/.local/go"

# export PATH="$BUN_INSTALL/bin:$HOME/.local/bin:$GOPATH/bin:/usr/local/bin:/usr/bin:/snap/bin"

export SCREENSHOT="$HOME/pictures/screenshots"

export TERMINAL="ghostty"
export NO_AT_BRIDGE=1
