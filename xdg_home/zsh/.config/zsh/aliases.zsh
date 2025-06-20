alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"

if [[ -n $ZSH_VERSION ]] && command -v eza >/dev/null 2>&1; then
  alias l="eza --icons"
  alias la="eza -a --icons"
  alias lt="eza -T --icons"
  alias lta="eza -aT --icons"
fi

alias python="python3"
alias py="python3"

alias t="tmux"
alias m="make"
alias nv="nvim ."

alias nvimdiff="nvim -d"

# yazi helper https://yazi-rs.github.io/docs/quick-start#shell-wrapper
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
	cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# git
function gdnolock() {
  if [[ "$#" -eq 0 ]]; then
    command git diff ':(exclude)package-lock.json' ':(exclude)pnpm-lock.yaml' ':(exclude)*.lock' ':(exclude)go.sum'
  else
    command git diff "$@"
  fi
}

alias gp='git push'
alias gpf='git push --force-with-lease'
alias gb="git branch"
alias gd="gdnolock"
alias gc="git add -A && git commit -v"
alias gl="git log --oneline --graph --decorate --all"
alias gll="git --no-pager log --oneline --graph --decorate --all -n 20"
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

alias f='fzf --print0 | xargs -0 -o nvim'

# docker
alias d="docker"
alias dsp="docker system prune -af && docker volume prune -af"

alias lsz="du -ahd 1 | sort -hr"

if [[ -n $ZSH_VERSION ]] && command -v nvim >/dev/null 2>&1; then
  alias vimdiff='nvim -d'
fi


alias pacls="comm -23 <(pacman -Qqt | sort) <(pacman -Qqg base | sort)"

alias g='gtrash'
alias gm='g put'
alias rm="echo -e 'If you want to use rm really, then use \"\\\\rm\" instead.'; false"

alias yay='yay --noconfirm'

