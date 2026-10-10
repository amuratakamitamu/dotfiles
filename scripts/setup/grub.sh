#!/usr/bin/env bash
set -euo pipefail

if grep -q '^#\?GRUB_GFXMODE=' /etc/default/grub; then
  sudo sed -i 's/^#\?GRUB_GFXMODE=.*/GRUB_GFXMODE=800x600/' /etc/default/grub
else
  echo 'GRUB_GFXMODE=800x600' | sudo tee -a /etc/default/grub >/dev/null
fi

sudo update-grub
echo "再起動してください"
