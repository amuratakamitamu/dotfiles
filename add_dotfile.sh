#!/usr/bin/env bash
# $HOME 配下のファイルを dotfiles/home/ に取り込み、シンボリックリンクに置き換える
# 例: ./add_dotfile.sh ~/.config/foo/config
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

if [[ $# -ne 1 || "$1" == "-h" || "$1" == "--help" ]]; then
  echo "Usage: $0 <file-under-HOME>"
  exit 1
fi

src="$(realpath -s "$1")"

if [[ ! -f "$src" || -L "$src" ]]; then
  echo "Error: $src は通常ファイルではありません" >&2
  exit 1
fi

if [[ "$src" != "$HOME"/* ]]; then
  echo "Error: $src は \$HOME 配下にありません" >&2
  exit 1
fi

rel="${src#"$HOME"/}"
dest="$DOTFILES_DIR/home/$rel"

if [[ -e "$dest" ]]; then
  echo "Error: $dest は既に存在します" >&2
  exit 1
fi

mkdir -p "$(dirname "$dest")"
mv "$src" "$dest"
ln -s "$dest" "$src"
echo "registered: $src"
