cfg() {
  local dir="$HOME/.config/$*"
  nvim "$dir" --cmd "cd $dir"
}

_cfg() {
  # list all files and dirs one level deep
  local -a entries
  entries=("${(@f)$(command ls -1A "$HOME/.config")}")

  compadd -Q -S '' -a entries -r -- ${(M)entries:#*/}
}

compdef _cfg cfg

