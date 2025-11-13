autoload -U compinit
compinit

bindkey -e

PS1="%F{blue}%~%f%(1j. %F{yellow}%jj%f.) %(?.%F{green}$%f.%F{red}$%f) "

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt HIST_EXPIRE_DUPS_FIRST # Expire dup event first when trimming hist
setopt HIST_FIND_NO_DUPS      # Do not display previously found event
setopt HIST_IGNORE_ALL_DUPS   # Delete old event if new is dup
setopt HIST_IGNORE_DUPS       # Do not record consecutive dup events
setopt HIST_IGNORE_SPACE      # Do not record event starting with a space
setopt HIST_SAVE_NO_DUPS      # Do not write dup event to hist file

# TODO: don't append "not found command" to history
# https://www.zsh.org/mla/users//2014/msg00715.html
# function zshaddhistory() {
# 	whence ${${(z)1}[1]} >| /dev/null || return 1
# }

# yazi helper https://yazi-rs.github.io/docs/quick-start#shell-wrapper
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

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

alias gdiff="git diff --no-index"

alias cdr='cd $(git rev-parse --show-toplevel)'

alias ls="ls --color=auto"
