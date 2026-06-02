#!/usr/bin/env bash
set -ue

helpmsg() {
  echo "Usage: $0 <config-file-path>"
  echo "Example: $0 ~/.bashrc"
}

add_dotfile() {
  local src_path="$1"

  # ~ 展開用
  src_path="${src_path/#\~/$HOME}"

  if [ ! -e "$src_path" ]; then
    echo "Error: $src_path does not exist" >&2
    exit 1
  fi

  local dotfiles_dir="$HOME/dotfiles"
  local backup_dir="$HOME/backup"
  local filename
  filename="$(basename "$src_path")"

  local dest_path="$dotfiles_dir/$filename"

  if [ ! -d "$dotfiles_dir" ]; then
    echo "Error: $dotfiles_dir does not exist" >&2
    exit 1
  fi

  if [ -e "$dest_path" ]; then
    echo "Error: $dest_path already exists" >&2
    exit 1
  fi

  mkdir -p "$backup_dir"

  cp "$src_path" "$dest_path"
  mv "$src_path" "$backup_dir/"
  ln -s "$dest_path" "$src_path"

  echo "registered $src_path as dotfile"
}

if [ $# -ne 1 ]; then
  helpmsg
  exit 1
fi

case "$1" in
  --help|-h)
    helpmsg
    exit 0
    ;;
  *)
    add_dotfile "$1"
    ;;
esac
