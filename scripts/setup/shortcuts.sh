#!/usr/bin/env bash
set -euo pipefail

if gsettings writable org.gnome.shell.keybindings show-screenshot-ui >/dev/null 2>&1; then
  gsettings set org.gnome.shell.keybindings show-screenshot-ui "['<Super><Shift>s']"
  echo "スクリーンショットUIを <Super><Shift>s に設定しました"
else
  echo "このGNOME環境では show-screenshot-ui が見つかりません"
fi
