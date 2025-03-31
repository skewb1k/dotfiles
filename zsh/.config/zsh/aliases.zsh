# alias cd=z
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"

alias python="python3"
alias py="python3"

alias t="tmux"
alias m="make"
alias hx="helix"

alias sourcez="source $ZDOTDIR/.zshrc"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# git
alias g='git'
alias gp='git push'
alias gb="git branch"
alias gd="git diff"
alias gc="git add -A && git commit -v"
alias gl="git log --oneline --graph --decorate --all"
alias gs="git status"
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit -m "[WIP]: $(date)"'

gsq() {
  if [[ $# -eq 0 ]]; then
    echo "Usage: gsq <number_of_commits_to_squash>"
    return 1
  fi

  local num_commits="$1"

  if ! [[ "$num_commits" =~ ^[0-9]+$ ]]; then
    echo "Error: Number of commits must be a positive integer."
    return 1
  fi

  local start_point
  start_point=$(git log -n "$num_commits" --pretty=format:"%H" | tail -n 1)

  git reset --soft HEAD~"$num_commits"

  gc
}


alias cdr='cd $(git rev-parse --show-toplevel)'

# docker
alias dsp="docker system prune -af && docker volume prune -af"

alias sp="sudo pacman"

alias lsz="du -ahd 1 | sort -hr"

alias vimdiff='nvim -d'

