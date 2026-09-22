# cleanup: clear dev-tool caches and old versions to get disk space back.
#
# Everything removed here is re-downloaded or rebuilt on demand, so the only
# cost is a slower first build or install afterwards. Tools that are not
# installed are skipped.
function cleanup
  set -l before (df -k $HOME | awk 'NR == 2 { print $4 }')

  if command -q brew
    echo "==> homebrew"
    # Orphaned dependencies, old versions, and every cached download.
    brew autoremove
    brew cleanup --prune=all
  end

  if command -q npm
    echo "==> npm"
    npm cache clean --force
    # `cache clean` only empties _cacache; npx packages and logs sit beside it.
    set -l npm_cache (npm config get cache)
    command rm -rf $npm_cache/_npx $npm_cache/_logs
  end

  if command -q corepack
    echo "==> corepack"
    corepack cache clean
  end

  if command -q go
    echo "==> go"
    # Build, test and fuzz caches, plus every downloaded module.
    go clean -cache -testcache -fuzzcache -modcache
  end

  set -l cargo_home ~/.cargo
  set -q CARGO_HOME; and set cargo_home $CARGO_HOME
  if test -d $cargo_home
    echo "==> cargo"
    # registry/ and git/ are download caches. build/ is where build.build-dir
    # in ~/.cargo/config.toml puts every project's intermediate artifacts.
    # Leaves bin/, config.toml and credentials alone.
    command rm -rf $cargo_home/registry $cargo_home/git $cargo_home/build
  end

  if command -q uv
    echo "==> uv"
    uv cache clean
  end

  # Last, so npm and go above still run on the versions they started with.
  if command -q mise
    echo "==> mise"
    # Versions no tracked config asks for any more, e.g. the Node and Go left
    # behind each time "lts" and "latest" move on.
    mise prune --yes
    mise cache clear
  end

  echo "==> neovim logs"
  command rm -f $XDG_STATE_HOME/nvim/lsp.log $XDG_STATE_HOME/nvim/log

  set -l after (df -k $HOME | awk 'NR == 2 { print $4 }')
  set -l freed (math "max(0, $after - $before)")
  if test $freed -ge 1048576
    printf '==> done, freed %.1f GB\n' (math "$freed / 1048576")
  else
    printf '==> done, freed %d MB\n' (math "floor($freed / 1024)")
  end
end
