#!/usr/bin/env bash
set -euo pipefail

sudo apt update
sudo apt install -y \
  curl \
  wget \
  gpg \
  ca-certificates \
  apt-transport-https \
  tree \
  micro \
  dconf-cli \
  gh \
  git-lfs

git lfs install
echo "gh auth login を実行してください (git の認証に使います)"
