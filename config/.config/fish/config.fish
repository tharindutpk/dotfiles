if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

# Aliases
alias dls="cd ~/.dotfiles"
alias cn="cd ~/.config/nvim"
alias obs="cd ~/code/personal/obsidian"

# aliases for project directory
alias cdir="cd ~/code/"

# Helper alias for cleaning files
alias mustcleancachenow="npm cache clean --force && go clean -modcache && brew cleanup --prune=all && rm -rf ~/.cargo/registry && uv cache clean && rm -rf ~/.npm/_npx && sudo log erase --all"
