export DOTFILES=$HOME/.dotfiles

export WORDCHARS=${WORDCHARS/\//}

export EDITOR=nvim
export MANPAGER='nvim +Man!'
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

export TMUXDOTDIR="$XDG_CONFIG_HOME/tmux"

export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cache/.bun/bin"
export PATH="$PATH:/opt/brew/bin"

export DO_NOT_TRACK=1

export FZF_DEFAULT_OPTS_FILE=$XDG_CONFIG_HOME/fzf/.fzfrc

export CDPATH="$CDPATH:$XDG_DATA_HOME/nvim/site/pack/local/opt"

export CMAKE_POLICY_VERSION_MINIMUM=3.5
