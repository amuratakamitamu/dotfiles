#!/usr/bin/env bash
# home/ 以下のファイルを $HOME の同じ位置にシンボリックリンクする
# 既存ファイルは ~/.dotbackup/<日時>/ に退避する
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
SRC_DIR="$DOTFILES_DIR/home"
BACKUP_DIR="$HOME/.dotbackup/$(date +%Y%m%d-%H%M%S)"

if [[ "${1-}" == "-h" || "${1-}" == "--help" ]]; then
  echo "Usage: $0"
  exit 0
fi

cd "$SRC_DIR"
find . -type f -print0 | while IFS= read -r -d '' rel; do
  rel="${rel#./}"
  src="$SRC_DIR/$rel"
  dest="$HOME/$rel"

  [[ "$(readlink "$dest" 2>/dev/null)" == "$src" ]] && continue

  if [[ -e "$dest" && ! -L "$dest" ]]; then
    mkdir -p "$BACKUP_DIR/$(dirname "$rel")"
    mv "$dest" "$BACKUP_DIR/$rel"
    echo "backup: $dest -> $BACKUP_DIR/$rel"
  fi

  mkdir -p "$(dirname "$dest")"
  ln -snf "$src" "$dest"
  echo "link: $dest"
done

echo "Install completed!"
