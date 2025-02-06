export PATH="$HOME/go/bin:/usr/local/bin:/usr/bin:/snap/bin:$PATH"

# SSH_AUTH_SOCK set to GPG to enable using gpgagent as the ssh agent.
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz compinit && compinit

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   # mkdir -p "$(dirname $ZINIT_HOME)"
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

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

setopt auto_cd

export LD_LIBRARY_PATH=/usr/local/lib

# P10k customizations
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Fix for password store
export PASSWORD_STORE_GPG_OPTS='--no-throw-keyids'

bindkey -v
bindkey '^o' autosuggest-accept

# [ -s "$HOME/.svm/svm.sh" ] && source "$HOME/.svm/svm.sh"
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

alias l="eza -a --icons"
alias lt="eza -aT --icons"

eval "$(zoxide init zsh)"

function __zoxide_cd() {
  cd "$1" && l
}

alias cd=z
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"

alias ccache="sudo rm -rf ~/.cache /tmp"

alias python="python3"
alias py="python3"
alias c=clear && printf '\e[3J'
alias t="tmux"
alias vsc="code ."
alias zshrc="vim ~/.zshrc"
alias aptu="sudo apt update && sudo apt upgrade"
alias apti="f() { sudo apt-get install -y $1 };f"

alias genenvexample="sed 's/=.*/=/' .env > .env.example"

# dir's aliases
alias -g winhome=/mnt/c/Users/skewbik

# bun completions
[ -s "/home/skewbik/.bun/_bun" ] && source "/home/skewbik/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Automatically start tmux and restore session
if [[ -z "$TMUX" ]]; then
  tmux new-session \; run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh
fi



. "/home/skewbik/.deno/env"

# fnm
FNM_PATH="/home/skewbik/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/skewbik/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# git
alias gac="git add -A && git commit"
alias gs="git status"
alias gl="git log --oneline --graph --decorate --all"
