---@type vim.lsp.Config
return {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
  -- ruff and ty both attach to Python: ty owns hover, ruff lint and format.
  on_init = function(client)
    client.server_capabilities.hoverProvider = false
  end,
}
