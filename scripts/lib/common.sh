#!/usr/bin/env bash

log_info() {
  echo "✅ $*"
}

log_warn() {
  echo "⚠️  $*"
}

log_error() {
  echo "❌ $*" >&2
}

log_run() {
  echo "🚀 $*"
}

log_done() {
  echo "🎉 $*"
}

confirm() {
  local message="$1"
  read -rp "❓ $message [y/N]: " answer
  case "$answer" in
    y|Y|yes|YES) return 0 ;;
    *) return 1 ;;
  esac
}
