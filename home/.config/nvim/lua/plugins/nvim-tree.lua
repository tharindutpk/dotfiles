vim.schedule(function()
  require("nvim-tree").setup({
    hijack_cursor = true,
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
      icons = { git_placement = "after" },
    },
    diagnostics = { enable = true, show_on_dirs = true },
    filters = { git_ignored = false },
    actions = { open_file = { quit_on_open = true } },
  })
end)

local function tree(fn, opts)
  return function()
    require("nvim-tree.api").tree[fn](opts)
  end
end

local map = vim.keymap.set

map("n", "<leader>ee", tree("toggle"), { desc = "Explorer toggle" })
map("n", "<leader>ef", tree("find_file", { open = true, focus = true }), { desc = "Explorer find file" })
map("n", "<leader>ec", tree("collapse_all"), { desc = "Explorer collapse" })
map("n", "<leader>er", tree("reload"), { desc = "Explorer refresh" })
