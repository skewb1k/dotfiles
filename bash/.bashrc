# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR='nvim'

# TODO: move PATH exports out of .bashrc.
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/lib/rustup/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# TODO: remove FZF_DEFAULT_OPTS_FILE export.
export FZF_DEFAULT_OPTS_FILE="$HOME/.config/fzf/.fzfrc"

export HISTCONTROL='ignoredups'
export HISTSIZE=10000
export HISTFILESIZE=10000

alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1='\W $ '
