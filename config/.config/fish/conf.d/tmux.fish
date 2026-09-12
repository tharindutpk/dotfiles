# Scripts from the dotfiles' `bin` stow package.
fish_add_path -m $HOME/.local/bin

# Smarter `cd` -- jumps to directories by frecency once they have been visited.
if command -q zoxide
    zoxide init fish | source
end

abbr -a ts tmux-sessionizer
abbr -a ta 'tmux attach -t'
abbr -a tl 'tmux ls'
abbr -a tn 'tmux new -s'
abbr -a tk 'tmux kill-session -t'
