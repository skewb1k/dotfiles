if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -U compinit; compinit

# +---------+
# | ALIASES |
# +---------+
source $ZDOTDIR/aliases.zsh

bindkey -v
bindkey '^o' autosuggest-accept
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^R' history-incremental-search-backward

eval "$(zoxide init zsh)"
function __zoxide_cd() {
	builtin cd "$1" && l
}

# yazi helper https://yazi-rs.github.io/docs/quick-start#shell-wrapper
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	sudo yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

setopt HIST_SAVE_NO_DUPS

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source $ZDOTDIR/.p10k.zsh

# bun completions
[ -s "/home/skewbik/.bun/_bun" ] && source "/home/skewbik/.bun/_bun"
