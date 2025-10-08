if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Set up Ghostty's shell integration.
if test -n "$GHOSTTY_RESOURCES_DIR"
    source $GHOSTTY_RESOURCES_DIR/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish
end

set fish_greeting
set -g fish_key_bindings fish_vi_key_bindings

set -gx fish_vi_force_cursor 1
set -gx fish_cursor_default block
set -gx fish_cursor_insert line blink
set -gx fish_cursor_visual block
set -gx fish_cursor_replace_one underscore

set -g fish_prompt_pwd_dir_length 0

# Aliases
alias cfg="cd ~/.config"
alias dls="cd ~/.dotfiles"
alias cn="cd ~/.config/nvim"
alias obs="cd ~/code/personal/obsidian"

# Zellij aliases
alias zls="zellij ls"
alias zka="zellij ka"
alias zda="zellij da"

# aliases for project directory
alias cdir="cd ~/code/"

# Helper alias for cleaning files
alias mustcleancachenow="npm cache clean --force && go clean -modcache && brew cleanup --prune=all && n prune && rm -rf ~/.cargo/registry && uv cache clean && rm -rf ~/.npm/_npx && sudo log erase --all"

# Node (N)
set -Ux N_PREFIX $HOME/.n
fish_add_path $N_PREFIX/bin
fish_add_path ~/.cargo/bin

