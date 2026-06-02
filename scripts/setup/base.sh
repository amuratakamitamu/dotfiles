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
  dconf-cli
