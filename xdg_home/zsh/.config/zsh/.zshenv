export DOTFILES=$HOME/.dotfiles

export WORDCHARS=${WORDCHARS/\//}

if hash nvim 2>/dev/null; then
	export EDITOR=nvim
	export MANPAGER='nvim +Man!'
else
	export EDITOR=vim
fi

export SUDO_EDITOR=$EDITOR
export VISUAL=$EDITOR

# XDG
export XDG_PICTURES_DIR="$HOME/pictures"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# git
export GIT_DOT_DIR="$XDG_CONFIG_HOME/git"
export GIT_CONFIG_GLOBAL="$GIT_DOT_DIR/.gitconfig"

export TERM=xterm-256color

export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=20000
export SAVEHIST=20000

export TMUXDOTDIR="$XDG_CONFIG_HOME/tmux"

export GOPATH="$HOME/.local/go"

export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cache/bin"
export PATH="$PATH:$HOME/.bun/bin"
export PATH="$PATH:/opt/brew/bin"

export DO_NOT_TRACK=1

# export LESS='-iRMx4'

export FZF_DEFAULT_OPTS_FILE=$XDG_CONFIG_HOME/fzf/.fzfrc
