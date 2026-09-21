set -g fish_greeting
set -gx EDITOR nvim
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_STATE_HOME $HOME/.local/state

fish_add_path -g ~/.local/bin ~/.cargo/bin ~/go/bin \
  /opt/homebrew/bin /opt/homebrew/sbin /opt/homebrew/opt/curl/bin \
  /Applications/Ghostty.app/Contents/MacOS

if status is-interactive
  mise activate fish | source

  abbr -a cfg 'cd ~/.config'
  abbr -a dls 'cd ~/.dotfiles'
  abbr -a cn 'cd ~/.dotfiles/home/.config/nvim'
  abbr -a obs 'cd ~/Notes/obsidian'

  # y: open Yazi, and cd to wherever you quit it.
  function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
      builtin cd -- "$cwd"
    end
    command rm -f -- "$tmp"
  end
else
  mise activate fish --shims | source
end
