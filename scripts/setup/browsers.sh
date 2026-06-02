#!/usr/bin/env bash
set -euo pipefail

sudo apt update
sudo apt install -y curl wget gpg ca-certificates

# Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg \
  https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

sudo curl -fsSLo /etc/apt/sources.list.d/brave-browser-release.sources \
  https://brave-browser-apt-release.s3.brave.com/brave-browser.sources

sudo apt update
sudo apt install -y brave-browser

# Microsoft Edge
tmp_deb="$(mktemp --suffix=.deb)"
wget -O "$tmp_deb" "https://go.microsoft.com/fwlink?linkid=2149051"
sudo apt install -y "$tmp_deb"
rm -f "$tmp_deb"
