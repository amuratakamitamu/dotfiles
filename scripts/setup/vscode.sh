#!/usr/bin/env bash
set -euo pipefail

tmp_deb="$(mktemp --suffix=.deb)"

wget -O "$tmp_deb" \
  "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"

sudo apt install -y "$tmp_deb"
rm -f "$tmp_deb"
