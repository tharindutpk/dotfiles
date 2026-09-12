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
├── bin/
│   └── .local/bin/            # Scripts on PATH (tmux-sessionizer)
├── brew/
│   └── Brewfile               # All Homebrew dependencies
├── config/
│   └── .config/
│       ├── aerospace/         # Aerospace window manager (macOS)
│       ├── bat/               # Syntax highlighting for cat
│       ├── fish/              # Fish shell configuration
│       ├── ghostty/           # Ghostty terminal configuration
│       ├── nvim/              # Neovim configuration
│       ├── tmux/              # tmux terminal multiplexer configuration
│       ├── yazi/              # Yazi file manager configuration
│       ├── zed/               # Zed editor configuration
│       └── zellij/            # Zellij configuration (kept as a fallback)
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
stow -d ~/.dotfiles -t ~ bin
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

## 🖥 tmux

Sessions are projects, windows are tasks, panes are splits. A session survives
closing the terminal, rebooting the terminal app, and dropping an SSH
connection — that is the whole reason to use it.

The prefix is **`Ctrl-a`**. `Ctrl-a Ctrl-a` sends a literal `Ctrl-a` through, so
beginning-of-line still works in fish.

| keys | does |
| --- | --- |
| `Ctrl-a f` | fuzzy-pick a project, create or switch to its session |
| `Ctrl-a s` | visual session/window tree |
| `Ctrl-a d` | detach — everything keeps running |
| `Ctrl-a (` / `)` | previous / next session |
| `Ctrl-a c` | new window (inherits the current directory) |
| `Ctrl-a 1…9` | jump to window by number |
| `Ctrl-a \|` / `-` | split vertically / horizontally |
| `Ctrl-a h j k l` | move between panes |
| `Ctrl-a H J K L` | resize (repeatable) |
| `Ctrl-a z` | zoom the current pane |
| `Ctrl-a Enter` | copy mode — `v` select, `y` yank to the system clipboard |
| `Ctrl-a r` | reload this config |

`Ctrl-hjkl` is deliberately **not** bound: Neovim uses it for window focus.

From the shell: `tmux ls`, `tmux attach -t <name>`, `tmux kill-session -t
<name>` — abbreviated to `tl`, `ta`, `tk` in fish.

### tmux-sessionizer

`Ctrl-F` in fish, or `Ctrl-a f` inside tmux. It fuzzy-finds a project under
`~/Code`, `~/Sites` and `~/Notes`, then attaches to its session — building one
first if it does not exist, laid out by what the project contains:

| project marker | windows |
| --- | --- |
| `Cargo.toml` | editor · shell · run (`bacon`) |
| `go.mod` | editor · shell · run (`gotestsum --watch`) |
| `pyproject.toml` | editor · shell · repl (`uv run python` \| `duckdb`) |
| `package.json` | editor · shell · dev (`pnpm dev`) |
| anything else | editor · shell |

Add search roots at the top of `bin/.local/bin/tmux-sessionizer`.

## 🏃 Per-project commands

Long or repeated commands belong in a `justfile` at the project root, not in
shell history and not in the editor. `just <recipe>` runs them from anywhere in
the project, and they work the same over SSH.

```just
# Rust
check:    cargo clippy --all-targets -- -D warnings
test:     cargo nextest run
watch:    bacon
```

```just
# Go
lint:     go vet ./...
test:     gotestsum ./...
watch:    gotestsum --watch ./...
run:      go run ./cmd/server
```

`just` with no arguments runs the first recipe; `just --list` shows them all.

## 🧠 Notes

- Always back up your configs before making big changes.
- You can test updates in a new branch before merging into `main`.
- Use `brew bundle dump` to regenerate your Brewfile after adding/removing packages.
- If you use multiple machines, simply `git pull` and `stow` again to sync configs.

---

## 🪶 License

This repository is licensed under the [MIT License](./LICENSE).
