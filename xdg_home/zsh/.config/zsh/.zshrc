if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -U compinit; compinit

bindkey -e
bindkey '^y' autosuggest-accept
bindkey '^p' up-history
bindkey '^n' down-history

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source $ZDOTDIR/.p10k.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZDOTDIR/cfg.zsh

source $ZDOTDIR/aliases.zsh

source $XDG_CONFIG_HOME/fzf/.fzfrc

if hash nvim 2>/dev/null; then
  export EDITOR=nvim

  # Use nvim as manpager `:h Man`
  export MANPAGER='nvim +Man!'
else
  export EDITOR=vim
fi

HISTSIZE=2000
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space

# don't append "not found command" to history
# https://www.zsh.org/mla/users//2014/msg00715.html
# function zshaddhistory() {
# 	whence ${${(z)1}[1]} >| /dev/null || return 1
# }

edit-buffer-in-split() {
  TMPFILE=$(mktemp -t edit-buffer.XXXXXX.zsh)
  print -r -- "$BUFFER" >| "$TMPFILE"
  tmux split-window -v -p 20 "nvim $TMPFILE; tmux wait-for -S nvim-done"
  tmux wait-for nvim-done
  BUFFER=$(<"$TMPFILE")
  CURSOR=${#BUFFER}
  rm "$TMPFILE"
  zle reset-prompt
}


zle -N edit-buffer-in-split
bindkey '^u' edit-buffer-in-split

setopt HIST_SAVE_NO_DUPS

ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue

function zvm_vi_yank () {
  zvm_yank
  printf %s "${CUTBUFFER}" | wl-copy
  zvm_exit_visual_mode
}
