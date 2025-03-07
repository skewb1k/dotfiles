alias cd=z
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"

alias python="python3"
alias py="python3"

alias t="tmux"
alias m="make"

alias sourcez="source $ZDOTDIR/.zshrc"

# alias genenvexample="sed 's/=.*/=/' .env > .env.example"

# dirs aliases
alias -g winhome=/mnt/c/Users/skewbik

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# git
alias g='git'
alias gp='git push'
# alias gr='git branch -r'
# alias gplo='git pull origin'
alias gb="git branch"
alias gd="git diff"
alias gco='git checkout'
alias gac="git add -A && git commit -v"
alias gl="git log --oneline --graph --decorate --all"
alias gs="git status"

# docker
alias dsp="docker system prune -af && docker volume prune -af"

alias sp="sudo pacman"

