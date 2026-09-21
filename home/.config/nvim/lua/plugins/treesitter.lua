vim.pack.add({
  -- `main` is the rewrite. The old module system lives on `master`, which is
  -- frozen at Nvim 0.11 -- pinning the branch is what stops a future update
  -- silently swapping one for the other.
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  { src = "https://github.com/MeanderingProgrammer/treesitter-modules.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
  { src = "https://github.com/windwp/nvim-ts-autotag" },
}, { confirm = false })

-- Eager: highlighting has to be configured before the first buffer is drawn.
-- The parsers themselves are still loaded per filetype, so this costs little.
require("treesitter-modules").setup({
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "dockerfile",
    "diff",
    "go",
    "gomod",
    "gosum",
    "gowork",
    "gitcommit",
    "gitignore",
    "html",
    "javascript",
    "json",
    "lua",
    "luadoc",
    "markdown",
    "markdown_inline",
    "python",
    "query",
    "regex",
    "rust",
    "sql",
    "svelte",
    "templ",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "xml",
    "yaml",
  },
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = { enable = true },
})

vim.schedule(function()
  require("treesitter-context").setup({
    mode = "topline",
    max_lines = 2,
  })

  require("nvim-ts-autotag").setup({})
end)
