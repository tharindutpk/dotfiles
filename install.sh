#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

[ "$(uname -s)" = Darwin ] || { echo "macOS only" >&2; exit 1; }

echo "==> homebrew"
command -v brew >/dev/null 2>&1 || \
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# A fresh Homebrew install is not on this shell's PATH yet.
command -v brew >/dev/null 2>&1 || eval "$(/opt/homebrew/bin/brew shellenv)"

# Runs before stow, because this is what installs stow.
brew bundle --file=Brewfile

echo "==> symlinking"
# Stow folds any directory that does not exist yet. Pre-create the ones this
# repo shares with the rest of the system, so ~/.config stays a real directory
# and each app inside it folds into a single link instead.
mkdir -p "$HOME/.config" "$HOME/.local/bin" "$HOME/.cargo"

# -R (restow) also clears links to files since deleted from the repo, so this
# line is safe to re-run. --ignore: stow does not read .gitignore, and a Finder
# .DS_Store in the repo collides with the real ~/.DS_Store and aborts the run.
stow -R --ignore='\.DS_Store' -t "$HOME" home

echo "==> toolchains"
command -v mise >/dev/null 2>&1 || {
  echo "mise not found on PATH after brew bundle" >&2
  exit 1
}
mise install

echo "==> done. if fish is not your login shell yet:"
echo "     echo \$(command -v fish) | sudo tee -a /etc/shells"
echo "     chsh -s \$(command -v fish)"
