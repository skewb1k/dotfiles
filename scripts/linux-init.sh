#!/bin/sh
sudo apt update
sudo apt upgrade
sudo apt-get install -y zsh curl wget gpg git fonts-font-awesome nodejs tree make htop fzf grep neofetch tmux vim neovim ca-certificates gzip gnupg coreutils

# eza
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

# zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

cd ~

# zsh
curl -O https://raw.githubusercontent.com/skewb1k/dotfiles/refs/heads/main/zsh/.zshrc
curl -O https://raw.githubusercontent.com/skewb1k/dotfiles/refs/heads/main/zsh/.p10k.zsh

# tmux
curl -O https://raw.githubusercontent.com/skewb1k/dotfiles/refs/heads/main/tmux/.tmux.conf

# docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
