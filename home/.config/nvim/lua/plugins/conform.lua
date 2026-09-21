require("conform").setup({
  format_on_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end

    return { timeout_ms = 500, lsp_format = "fallback" }
  end,

  formatters_by_ft = {
    bash = { "shfmt" },
    c = { "clang_format" },
    cpp = { "clang_format" },
    css = { "prettierd" },
    go = { "goimports", "gofumpt" },
    html = { "prettierd" },
    javascript = { "prettierd" },
    javascriptreact = { "prettierd" },
    json = { "prettierd" },
    jsonc = { "prettierd" },
    lua = { "stylua" },
    markdown = { "prettierd" },
    python = { "ruff_organize_imports", "ruff_format" },
    scss = { "prettierd" },
    sh = { "shfmt" },
    sql = { "sql_formatter" },
    svelte = { "prettierd" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    yaml = { "prettierd" },
  },
})

local map = vim.keymap.set

map("n", "<leader>fb", function()
  require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })

map("n", "<leader>fi", "<cmd>ConformInfo<CR>", { desc = "Formatter info" })

-- Cycles buffer-local off -> global off -> on again.
map("n", "<leader>tf", function()
  if not vim.b.disable_autoformat and not vim.g.disable_autoformat then
    vim.b.disable_autoformat = true
    vim.notify("Autoformat disabled (buffer)", vim.log.levels.INFO)
  elseif vim.b.disable_autoformat then
    vim.b.disable_autoformat = nil
    vim.g.disable_autoformat = true
    vim.notify("Autoformat disabled (global)", vim.log.levels.INFO)
  else
    vim.g.disable_autoformat = nil
    vim.b.disable_autoformat = nil
    vim.notify("Autoformat enabled", vim.log.levels.INFO)
  end
end, { desc = "Toggle autoformat" })
