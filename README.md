# dotfiles

macOS setup — fish, Ghostty, Neovim, mise, yazi, lazygit, Zed — managed with
GNU Stow.

## Install

```sh
git clone git@github.com:tharindutpk/dotfiles.git ~/.dotfiles
~/.dotfiles/install.sh
```

`install.sh` installs Homebrew and everything in the `Brewfile`, links `home/`
into `$HOME`, then installs Node and Go with mise. Rust comes from rustup,
separately. It is safe to re-run.

## How the linking works

`home/` mirrors `$HOME`: `home/.gitconfig` becomes `~/.gitconfig`, and
`home/.config/nvim` becomes `~/.config/nvim`.

Stow **folds**: each `~/.config/<app>` is a single symlink to its directory
here, so a file you create under it is already in the repo. Stow only folds a
directory that does not exist yet, which is why `install.sh` runs
`mkdir -p ~/.config` first — otherwise it would link all of `~/.config` into
this repo.

After adding a new app directory under `home/`:

```sh
stow -R --ignore='\.DS_Store' -t ~ home
```

## What is not committed

State that apps write into their own config directories — see `.gitignore`.
The rule is: commit inputs, ignore outputs. `nvim-pack-lock.json` is the
exception that proves it: Neovim writes it, but it pins plugin revisions that
nothing else can rebuild, so it is committed.

Machine-specific git settings go in `~/.gitconfig.local`, which
`.gitconfig` includes and git never sees.
