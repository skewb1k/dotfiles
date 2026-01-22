# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR='nvim'

# TODO: move it out of .bashrc.
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/lib/rustup/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

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

alias gwip='git commit -m "wip [skip ci]"'
alias gdiff='git diff --no-index'
alias cdr='cd $(git rev-parse --show-toplevel)'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
