# 🏠 Tharindu’s Dotfiles

A minimal and modular dotfiles setup for macOS — managed with [GNU Stow](https://www.gnu.org/software/stow/) and [Homebrew](https://brew.sh).
This setup is designed for fast, clean, and reproducible workstation provisioning with carefully tuned defaults for terminal, shell, and editor environments.

---

## ✨ Features

- **Homebrew + Brewfile** for automatic package management
- **GNU Stow** for symlink management
- Preconfigured **Fish shell**, **Neovim**, **Ghostty**, **Zed**, **Zellij**, and **Yazi**
- Global `.gitignore` and quiet shell login (`.hushlogin`)
- Sensible defaults for fonts, themes, and UI scaling

---

## 🧩 Directory Structure

```
├── brew/
│   └── Brewfile               # All Homebrew dependencies
├── config/
│   └── .config/
│       ├── aerospace/         # Aerospace window manager (macOS)
│       ├── bat/               # Syntax highlighting for cat
│       ├── fish/              # Fish shell configuration
│       ├── ghostty/           # Ghostty terminal configuration
│       ├── nvim/              # Neovim configuration
│       ├── yazi/              # Yazi file manager configuration
│       ├── zed/               # Zed editor configuration
│       └── zellij/            # Zellij terminal multiplexer configuration
├── git/
│   └── .gitignore_global
├── misc/
│   └── .hushlogin
└── LICENSE
```

---

## ⚙️ Installation

### 1. Clone the repository

```bash
git clone --recursive git@github.com:tharindutpk/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

### 2. Install Homebrew and packages

If you don’t already have [Homebrew](https://brew.sh) installed:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then install all packages from the `Brewfile`:

```bash
brew bundle --file=brew/Brewfile
```

> 💡 You can re-run this command anytime to sync your installed packages with the Brewfile.

---

## 🪄 Setting up with GNU Stow

Install GNU Stow if you haven’t:

```bash
brew install stow
```

Each folder (e.g. `config`, `git`, `misc`) can be symlinked to your home directory:

```bash
stow -d ~/.dotfiles -t ~ config
stow -d ~/.dotfiles -t ~ git
stow -d ~/.dotfiles -t ~ misc
```

Or, to stow everything at once:

```bash
stow -d ~/.dotfiles -t ~ */
```

To **unstow** (remove symlinks):

```bash
stow -D config
```

---

## 🖋 Recommended Fonts & UI Settings

To make the setup look perfect:

- **Font:** [Hack Nerd Font Mono] (https://www.nerdfonts.com/font-downloads)
- **Terminal Font Size:** 13–14 pt or 17 in more spaced display setting
- **Editor Font Size:** 14–15 pt (depending on DPI)
- **Ghostty theme:** Use a dark theme like `Catppuccin Mocha` or `iTerm2 Default`

You can install fonts via Homebrew too:

```bash
brew install font-hack-nerd-font
```

---

## 🧠 Notes

- Always back up your configs before making big changes.
- You can test updates in a new branch before merging into `main`.
- Use `brew bundle dump` to regenerate your Brewfile after adding/removing packages.
- If you use multiple machines, simply `git pull` and `stow` again to sync configs.

---

## 🪶 License

This repository is licensed under the [MIT License](./LICENSE).
