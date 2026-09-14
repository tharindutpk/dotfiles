set -g fish_greeting
set -g fish_key_bindings fish_vi_key_bindings
set -gx EDITOR nvim
set -gx N_PREFIX $HOME/.n

# One call, first entry wins. Folders that don't exist yet are skipped.
fish_add_path -g ~/.local/bin $N_PREFIX/bin ~/.cargo/bin \
  /opt/homebrew/bin /opt/homebrew/sbin /opt/homebrew/opt/curl/bin \
  /Applications/Ghostty.app/Contents/MacOS

if status is-interactive
  abbr -a cfg 'cd ~/.config'
  abbr -a dls 'cd ~/.dotfiles'
  abbr -a cn 'cd ~/.config/nvim'
  abbr -a obs 'cd ~/Notes/obsidian'

  abbr -a ts tmux-sessionizer
  abbr -a ta 'tmux attach -t'
  abbr -a tl 'tmux ls'
  abbr -a tn 'tmux new -s'
  abbr -a tk 'tmux kill-session -t'

  # Ctrl-F: fuzzy-switch tmux projects, same as prefix + f inside tmux.
  bind --mode insert ctrl-f 'tmux-sessionizer; commandline -f repaint'
  bind --mode default ctrl-f 'tmux-sessionizer; commandline -f repaint'
end
