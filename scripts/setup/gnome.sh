#!/usr/bin/env bash
set -euo pipefail

sudo apt update
sudo apt install -y \
  chrome-gnome-shell \
  gnome-shell-extension-manager \
  gnome-tweaks

echo "GNOME Extensions から以下を手動インストールしてください:"
echo "- Tiling Shell"
echo "- Rounded Window Corners"
echo "- Blur my Shell"

DCONF="$(dirname "${BASH_SOURCE[0]}")/../../gnome/tilingshell.dconf"
if [[ -f "$DCONF" ]]; then
  dconf load / < "$DCONF"
fi
