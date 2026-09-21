# y: open Yazi, and cd to wherever you quit it.
#
# Fish loads this file the first time you run `y`, instead of defining the
# function in every new shell -- and this directory is where `funcsave` writes,
# so functions you save from the prompt land in the repo alongside it.
function y
  set tmp (mktemp -t "yazi-cwd.XXXXXX")
  command yazi $argv --cwd-file="$tmp"
  if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
    builtin cd -- "$cwd"
  end
  command rm -f -- "$tmp"
end
