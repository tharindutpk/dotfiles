if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Aliases
alias cfg="cd ~/.config"
alias dls="cd ~/.dotfiles"
alias cn="cd ~/.config/nvim"
alias obs="cd ~/code/personal/obsidian"

# Node (N)
set -Ux N_PREFIX $HOME/.n

# Fish paths
fish_add_path -m $N_PREFIX/bin
fish_add_path -m /opt/homebrew/bin
fish_add_path -m /opt/homebrew/sbin
