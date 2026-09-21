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
