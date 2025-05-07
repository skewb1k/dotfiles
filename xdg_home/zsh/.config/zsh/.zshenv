export DOTFILES="$HOME/.dotfiles"

# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_PICTURES_DIR=$HOME/pictures

# git
export GIT_DOT_DIR="$XDG_CONFIG_HOME/git"
export GIT_CONFIG_GLOBAL="$GIT_DOT_DIR/.gitconfig"

export TERM=xterm-256color

# editor
export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export VISUAL="nvim"

# zsh
export HISTFILE="$ZDOTDIR/.zhistory"    
export HISTSIZE=20000                  
export SAVEHIST=20000                 

# tmux
export TMUXDOTDIR="$XDG_CONFIG_HOME/tmux"

# export TERM="xterm-256color"

export GOPATH="$HOME/.local/go"

export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.cargo/bin

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH=$PATH:$HOME/.cache/bin

export PATH="$HOME/.bun/bin:$PATH"
# Disable Bun telemetry
export DO_NOT_TRACK=1

