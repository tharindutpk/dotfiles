function fish_user_key_bindings
    # Ctrl-F anywhere: fuzzy-switch tmux projects. Same script the tmux
    # prefix + f binding runs, so the muscle memory is identical inside and
    # outside a session.
    bind --mode insert ctrl-f 'tmux-sessionizer; commandline -f repaint'
    bind --mode default ctrl-f 'tmux-sessionizer; commandline -f repaint'
end
