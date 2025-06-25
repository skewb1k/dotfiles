cfg() {
  nvim "$HOME/.config/$*"
}

_cfg() {
  local config_dir="$HOME/.config"
  # list all files and dirs one level deep
  local -a entries
  entries=("${(@f)$(command ls -1A "$config_dir")}")

  compadd -Q -S '' -a entries -r -- ${(M)entries:#*/}
}

compdef _cfg cfg

