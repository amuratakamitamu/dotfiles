#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$DOTFILES_DIR/scripts/lib/common.sh"

SAFE_SCRIPTS=(base ime browsers vscode gnome shortcuts)

run_script() {
  local script="$1"

  if [[ ! -f "$script" ]]; then
    log_error "スクリプトが見つかりません: $script"
    return 1
  fi

  log_run "実行: $script"
  bash "$script"
  log_done "完了: $script"
}

while true; do
  cat <<'MENU'

🛠 Ubuntu dotfiles installer

1) apt更新と基本ツールの導入
   - curl / wget / gpg / ca-certificates / tree / micro / dconf-cli / gh / git-lfs

2) 日本語入力環境の導入
   - fcitx5-mozc / im-config
   - fcitx5 の既定入力メソッド化
   - 実行後のログアウト・再ログイン

3) ブラウザの導入
   - Brave Browser
   - Microsoft Edge

4) VSCode の導入
   - 公式 stable deb の取得
   - apt による deb インストール

5) GNOME拡張機能環境の導入
   - chrome-gnome-shell
   - gnome-shell-extension-manager
   - gnome-tweaks
   - tilingshell.dconf の適用

6) スクリーンショットショートカットの変更
   - <Super><Shift>s への割り当て

7) GRUBメニュー表示の拡大
   - GRUB_GFXMODE=800x600 の設定
   - update-grub の実行
   - 実行後の再起動

8) 1〜6 の一括実行
   - GRUB設定を除外した安全実行

9) 1〜7 の完全一括実行
   - GRUB設定を含む実行

q) 終了

MENU

  read -rp "選択: " choice

  case "$choice" in
    1) run_script "$DOTFILES_DIR/scripts/setup/base.sh" ;;
    2) run_script "$DOTFILES_DIR/scripts/setup/ime.sh" ;;
    3) run_script "$DOTFILES_DIR/scripts/setup/browsers.sh" ;;
    4) run_script "$DOTFILES_DIR/scripts/setup/vscode.sh" ;;
    5) run_script "$DOTFILES_DIR/scripts/setup/gnome.sh" ;;
    6) run_script "$DOTFILES_DIR/scripts/setup/shortcuts.sh" ;;
    7)
      if confirm "GRUB設定の書き換えと update-grub の実行"; then
        run_script "$DOTFILES_DIR/scripts/setup/grub.sh"
      fi
      ;;
    8)
      for s in "${SAFE_SCRIPTS[@]}"; do run_script "$DOTFILES_DIR/scripts/setup/$s.sh"; done
      ;;
    9)
      for s in "${SAFE_SCRIPTS[@]}"; do run_script "$DOTFILES_DIR/scripts/setup/$s.sh"; done

      if confirm "GRUB設定の書き換えと update-grub の実行"; then
        run_script "$DOTFILES_DIR/scripts/setup/grub.sh"
      fi
      ;;
    q|Q) exit 0 ;;
    *) log_warn "無効な選択" ;;
  esac
done
