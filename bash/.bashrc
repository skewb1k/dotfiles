# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR="nvim"

# TODO: move it out of .bashrc.
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/lib/rustup/bin:$PATH"

export FZF_DEFAULT_OPTS_FILE="$HOME/.config/fzf/.fzfrc"

export HISTCONTROL='ignoredups'
export HISTSIZE=10000
export HISTFILESIZE=10000

PROMPT_COMMAND=__prompt_command
__prompt_command() {
	local exit_status="$?"

	PS1='\[\e[34m\]\W\[\e[0m\]'
	PS1+='$([ \j -gt 0 ] && echo "\[\e[33m\] \jj\[\e[0m\]")'
	if [ $exit_status == 0 ]; then
		PS1+='\[\e[0;32m\]'
	else
		PS1+='\[\e[0;31m\]'
	fi
	PS1+=' $ \[\e[0m\]'
}

alias gd="git diff"
alias gdp='git diff $(git merge-base refs/remotes/origin/HEAD HEAD)'
alias gp="git push"
alias gc="git commit -v"
alias gl="git log --oneline --graph --decorate"
alias gla="gl --all"
alias gln="gl -n 20"
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
