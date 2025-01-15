sudo apt update
sudo apt upgrade
sudo apt-get install -y zsh curl wget gpg git fonts-font-awesome nodejs eza tree make htop fzf grep neofetch tmux zoxide vim neovim ca-certificates gzip gnupg coreutils

cd ~

# zsh
curl -O https://raw.githubusercontent.com/skewb1k/dotfiles/refs/heads/main/zsh/.zshrc
curl -O https://raw.githubusercontent.com/skewb1k/dotfiles/refs/heads/main/zsh/.p10k.zsh

# tmux
curl -O https://raw.githubusercontent.com/skewb1k/dotfiles/refs/heads/main/tmux/.tmux.conf

# docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
