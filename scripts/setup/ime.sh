#!/usr/bin/env bash
set -euo pipefail

sudo apt update
sudo apt install -y fcitx5-mozc im-config

im-config -n fcitx5

echo "ログアウトして再ログインしてください"
echo "確認コマンド:"
echo 'echo $GTK_IM_MODULE'
echo 'echo $QT_IM_MODULE'
echo 'echo $XMODIFIERS'
