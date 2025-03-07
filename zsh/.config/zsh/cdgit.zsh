cd_up_to_git_repo() {
  # Start from the current directory
  current_dir=$(pwd)

  # Loop until reaching the root directory
  while [[ "$current_dir" != "/" ]]; do
    # Check if the current directory contains a .git directory
    if [[ -d "$current_dir/.git" ]]; then
      cd "$current_dir" || return 1
      return 0
    fi

    # Move up one directory
    current_dir=$(dirname "$current_dir")
  done

  # If no Git repository is found
  echo "No Git repository found in the directory tree."
  return 1
}

# Alias for convenience
alias cdgit="cd_up_to_git_repo"
