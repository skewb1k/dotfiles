if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if hash nvim 2>/dev/null; then
  export EDITOR=nvim

  # Use nvim as manpager `:h Man`
  export MANPAGER='nvim +Man!'
else
  export EDITOR=vim
fi

# don't append "not found command" to history
# https://www.zsh.org/mla/users//2014/msg00715.html
function zshaddhistory() {
	whence ${${(z)1}[1]} >| /dev/null || return 1
}

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

setopt HIST_SAVE_NO_DUPS

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source $ZDOTDIR/.p10k.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue

HISTSIZE=2000
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space

function zvm_vi_yank () {
  zvm_yank
  printf %s "${CUTBUFFER}" | wl-copy
  zvm_exit_visual_mode
}
