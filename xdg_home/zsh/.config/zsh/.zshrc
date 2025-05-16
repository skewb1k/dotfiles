if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -U compinit; compinit

# source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source /home/skewbik/dev/zsh-vi-mode/zsh-vi-mode.plugin.zsh
ZVM_VI_HIGHLIGHT_BACKGROUND=black
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

source $ZDOTDIR/aliases.zsh

source $XDG_CONFIG_HOME/fzf/.fzfrc

# bindkey -v
bindkey '^O' autosuggest-accept
bindkey '^P' up-history
bindkey '^N' down-history

eval "$(zoxide init zsh)"
function __zoxide_cd() {
	builtin cd "$1" && l
}

setopt HIST_SAVE_NO_DUPS

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source $ZDOTDIR/.p10k.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue

