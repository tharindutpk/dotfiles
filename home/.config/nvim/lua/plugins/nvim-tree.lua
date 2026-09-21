vim.pack.add({
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-tree/nvim-tree.lua" },
}, { confirm = false })

-- netrw is left alone here; oil.nvim is the plugin that takes over directory
-- buffers in this config.
vim.schedule(function()
  require("nvim-tree").setup({
    hijack_cursor = true,
    disable_netrw = false,
    renderer = {
      group_empty = true,
      special_files = {
        "Cargo.toml",
        "Makefile",
        "README.md",
        "go.mod",
        "package.json",
        "pyproject.toml",
      },
      highlight_git = true,
      icons = {
        git_placement = "after",
        diagnostics_placement = "signcolumn",
      },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
    },
    filters = {
      git_ignored = false,
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
  })
end)

local map = vim.keymap.set

map("n", "<leader>ee", function()
  require("nvim-tree.api").tree.toggle()
end, { desc = "Explorer toggle" })

map("n", "<leader>ef", function()
  require("nvim-tree.api").tree.find_file({ open = true, focus = true })
end, { desc = "Explorer find file" })

map("n", "<leader>ec", function()
  require("nvim-tree.api").tree.collapse_all()
end, { desc = "Explorer collapse" })

map("n", "<leader>er", function()
  require("nvim-tree.api").tree.reload()
end, { desc = "Explorer refresh" })
