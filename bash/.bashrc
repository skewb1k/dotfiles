# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR="nvim"
export MANPAGER="nvim +Man!"
export SUDO_EDITOR="$EDITOR"
export VISUAL="$EDITOR"

export LESS="-RF -x4"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export TMUXDOTDIR="$HOME/.config/tmux"
export FZF_DEFAULT_OPTS_FILE="$HOME/.config/fzf/.fzfrc"

export DO_NOT_TRACK=1

export CMAKE_POLICY_VERSION_MINIMUM=3.5

export HISTCONTROL='ignoredups'
export HISTSIZE=10000
export HISTFILESIZE=10000

# TODO: add exit code indicator and jobs counter.
PS1='\[\e[34m\]\W\[\e[0m\] $ '

alias gd="git diff"
alias gdp='git diff $(git merge-base refs/remotes/origin/HEAD HEAD)'
alias gp="git push"
alias gc="git commit -v"
alias gl="git log --oneline --graph --decorate --all"
alias gll="git --no-pager log --oneline --graph --decorate --all -n 20"
alias gs="git status"
alias gds="git diff --staged"
alias gcne="git commit --amend --no-edit"
alias gwip='git commit -m "[WIP]: $(date -u)"'
alias gfp='git fetch --all --prune'
alias gdiff="git diff --no-index"
alias cdr='cd $(git rev-parse --show-toplevel)'

alias ls="ls --color=auto"
alias grep="grep --color=auto"

alias ghb="gh browse"
