local function try_lint()
  if vim.bo.modifiable and vim.bo.buftype == "" then
    require("lint").try_lint()
  end
end

vim.schedule(function()
  -- biome only lints here (prettierd formats), so it needs no biome.json: with
  -- none it applies its recommended rules.
  local biome = { "biomejs" }

  require("lint").linters_by_ft = {
    bash = { "shellcheck" },
    javascript = biome,
    javascriptreact = biome,
    json = biome,
    markdown = { "markdownlint" },
    sh = { "shellcheck" },
    svelte = biome,
    typescript = biome,
    typescriptreact = biome,
  }

  vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
    group = vim.api.nvim_create_augroup("tharindutpk_lint", { clear = true }),
    desc = "Run linters for the current file",
    callback = try_lint,
  })

  -- The autocmd misses the file Nvim was started with, read before this ran.
  try_lint()
end)

vim.keymap.set("n", "<leader>l", try_lint, { desc = "Lint current file" })
