if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -U compinit; compinit

# source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source $HOME/dev/zsh-vi-mode/zsh-vi-mode.plugin.zsh
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


function zshaddhistory() {
  # defang naughty commands; the entire history entry is in $1
  if [[ $1 =~ "cp\ *|mv\ *|rm\ *|cat\ *\>|pv\ *|dd\ *|shutdown\ *" ]]; then
    1="# $1"
  fi
  # write to usual history location
  print -sr -- ${1%%$'\n'}
  # do not save the history line. if you have a chain of zshaddhistory
  # hook functions, this may be more complicated to manage, depending
  # on what those other hooks do (man zshall | less -p zshaddhistory)
  return 1
}

function zvm_vi_yank () {
  zvm_yank
  printf %s "${CUTBUFFER}" | wl-copy
  zvm_exit_visual_mode
}
