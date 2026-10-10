#!/usr/bin/env bash
set -euo pipefail

tmp_deb="$(mktemp --suffix=.deb)"
wget -O "$tmp_deb" "https://discord.com/api/download/stable?platform=linux&format=deb"
sudo apt install -y "$tmp_deb"
rm -f "$tmp_deb"
