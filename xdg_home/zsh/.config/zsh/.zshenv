export DOTFILES="$HOME/.dotfiles"

# XDG
export XDG_CONFIG_HOME=$HOME/.config

# git
export GIT_DOT_DIR="$XDG_CONFIG_HOME/git"
export GIT_CONFIG_GLOBAL="$GIT_DOT_DIR/.gitconfig"

# editor
export EDITOR="hx"
export SUDO_EDITOR="hx"
export VISUAL="hx"

# zsh
export HISTFILE="$ZDOTDIR/.zhistory"    
export HISTSIZE=20000                  
export SAVEHIST=20000                 

# tmux
export TMUXDOTDIR="$XDG_CONFIG_HOME/tmux"

# export TERM="xterm-256color"

export GOPATH="$HOME/.local/go"

export PATH=$PATH:$GOPATH/bin

export TERMINAL="ghostty"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

