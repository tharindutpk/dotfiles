require("snacks").setup({
  bigfile = { enabled = true },
  quickfile = { enabled = true },
  terminal = { win = { position = "bottom", height = 0.3 } },
  picker = { enabled = false },
  dashboard = {
    sections = {
      { section = "header" },
      { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
      { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
      { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
    },
  },
})

local map = vim.keymap.set

map({ "n", "t" }, "<C-\\>", function()
  require("snacks").terminal.toggle()
end, { desc = "Toggle terminal" })

map("n", "<leader>gg", function()
  require("snacks").lazygit()
end, { desc = "Lazygit" })
