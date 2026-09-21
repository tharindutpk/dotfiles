#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

[ "$(uname -s)" = Darwin ] || { echo "macOS only" >&2; exit 1; }

echo "==> symlinking"
stow --no-folding -t "$HOME" home

echo "==> homebrew"
command -v brew >/dev/null 2>&1 || \
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# A fresh Homebrew install is not on this shell's PATH yet.
command -v brew >/dev/null 2>&1 || eval "$(/opt/homebrew/bin/brew shellenv)"

brew bundle --file=Brewfile

echo "==> toolchains"
command -v mise >/dev/null 2>&1 || {
  echo "mise not found on PATH after brew bundle" >&2
  exit 1
}
mise install

echo "==> done. if fish is not your login shell yet:"
echo "     echo \$(command -v fish) | sudo tee -a /etc/shells"
echo "     chsh -s \$(command -v fish)"
