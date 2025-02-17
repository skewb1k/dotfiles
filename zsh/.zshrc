# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

plugins=(git docker)

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM="xterm-256color"
export LD_LIBRARY_PATH=/usr/local/lib
export EDITOR="hx"

export BUN_INSTALL="$HOME/.bun"
export GOPATH="$HOME/.local/go"

export PATH="$BUN_INSTALL/bin:$HOME/.local/bin:$GOPATH/bin:/usr/local/bin:/usr/bin:/snap/bin"

# Fix for password store
export PASSWORD_STORE_GPG_OPTS='--no-throw-keyids'

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent


autoload -Uz compinit && compinit

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light ohmyzsh/ohmyzsh
zinit ice depth=1
zinit light romkatv/powerlevel10k

zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

setopt auto_cd

# P10k customizations
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

bindkey -v
bindkey '^o' autosuggest-accept
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^R' history-incremental-search-backward

alias l="eza -a --icons"
alias lt="eza -aT --icons"

# yazi helper https://yazi-rs.github.io/docs/quick-start#shell-wrapper
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

eval "$(zoxide init zsh)"
function __zoxide_cd() {
  cd "$1" && l
}
alias cd=z
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"

alias ccache="sudo rm -rf ~/.cache /tmp"
alias aptu="sudo apt update && sudo apt upgrade"
alias apti="f() { sudo apt-get install -y $1 };f"

alias c=clear && printf '\e[3J'

alias python="python3"
alias py="python3"

alias t="tmux"
alias m="make"
alias vsc="code ."

alias zshrc="$EDITOR ~/.zshrc"
alias sourcez="source ~/.zshrc"

alias genenvexample="sed 's/=.*/=/' .env > .env.example"

# dirs aliases
alias -g winhome=/mnt/c/Users/skewbik

# bun completions
[ -s "/home/skewbik/.bun/_bun" ] && source "/home/skewbik/.bun/_bun"

# git
alias gac="git add -A && git commit -v"
alias gl="git log --oneline --graph --decorate --all"
alias gs="git status"

# docker
alias dsp="docker system prune -af && docker volume prune -af"
