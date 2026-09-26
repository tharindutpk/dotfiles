local ensure_installed = {
  -- language servers
  "bash-language-server",
  "clangd",
  "gopls",
  "lua-language-server",
  "ruff",
  "svelte-language-server",
  "ty",
  "vtsls",

  -- formatters
  "clang-format",
  "gofumpt",
  "goimports",
  "prettierd",
  "shfmt",
  "sql-formatter",
  "stylua",

  -- linters
  "biome",
  "markdownlint",
  "shellcheck",
}

vim.schedule(function()
  require("mason").setup()
  require("fidget").setup()

  require("mason-tool-installer").setup({
    ensure_installed = ensure_installed,
    run_on_start = false,
  })

  require("mason-tool-installer").check_install(false)
end)
