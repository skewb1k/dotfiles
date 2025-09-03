# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

autoload -U compinit; compinit

bindkey -e
bindkey '\e/' autosuggest-accept

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source $HOME/.p10k.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
setopt HIST_EXPIRE_DUPS_FIRST  # Expire dup event first when trimming hist
setopt HIST_FIND_NO_DUPS       # Do not display previously found event
setopt HIST_IGNORE_ALL_DUPS    # Delete old event if new is dup
setopt HIST_IGNORE_DUPS        # Do not record consecutive dup events
setopt HIST_IGNORE_SPACE       # Do not record event starting with a space
setopt HIST_SAVE_NO_DUPS       # Do not write dup event to hist file

# don't append "not found command" to history
# https://www.zsh.org/mla/users//2014/msg00715.html
# function zshaddhistory() {
# 	whence ${${(z)1}[1]} >| /dev/null || return 1
# }

if command -v mise >/dev/null 2>&1; then
  eval "$("$(command -v mise)" activate zsh)"
fi


alias python="python3"
alias py="python3"
alias ls="ls --color=auto"

alias task="go-task"

alias nv="nvim ."

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
alias gp="git push"
alias gc="git commit -v"
alias gl="git log --oneline --graph --decorate --all"
alias gll="git --no-pager log --oneline --graph --decorate --all -n 20"
alias gs="git status"
alias gcne="git commit --amend --no-edit"
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit -m "[WIP]: $(date -u)"'

alias cdr='cd $(git rev-parse --show-toplevel)'

alias fo='fzf --print0 | xargs -0 -o nvim'

alias d="docker"

alias g='gtrash'
alias gm='g put'

alias yay='yay --noconfirm'
