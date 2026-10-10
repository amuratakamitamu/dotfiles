# dotfiles

```
home/      $HOME にリンクされる設定ファイル (.bashrc, .gitconfig, .tmux.conf, .config/, .claude/ など)
gnome/     GNOME 拡張の dconf
scripts/   Ubuntu セットアップ・更新スクリプト
```

## 使い方

```bash
git clone git@github.com:amuratakamitamu/dotfiles.git ~/dotfiles
~/dotfiles/install.sh   # home/ 以下を $HOME にシンボリックリンク (既存は ~/.dotbackup/ に退避)
~/dotfiles/setup.sh     # アプリ等のインストールメニュー
```

新しい設定ファイルを管理対象にする:

```bash
~/dotfiles/add_dotfile.sh ~/.config/foo/config
```

## Claude Code

`home/.claude/` には共有したい設定だけを置く (`CLAUDE.md`, `settings.json`, `skills/`)。
`settings.json` には Orca のフック・statusLine も含む (Orca が無い環境では何もしない)。
認証情報・履歴・セッションはコミットしない。

VSCode の設定・拡張機能は Settings Sync で同期しているので、ここでは管理しない。
