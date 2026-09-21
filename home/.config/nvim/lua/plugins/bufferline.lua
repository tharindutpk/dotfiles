vim.pack.add({
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/akinsho/bufferline.nvim" },
}, { confirm = false })

-- Deferred, which also fixes an ordering trap: the catppuccin highlights below
-- are generated from catppuccin's *configured* palette, so this has to run
-- after plugins/catppuccin.lua has called setup().
vim.schedule(function()
  require("bufferline").setup({
    options = {
      show_buffer_close_icons = false,
      offsets = {
        {
          filetype = "NvimTree",
          highlight = "Directory",
          separator = true,
          text = "File Explorer",
        },
      },
    },
    highlights = require("catppuccin.special.bufferline").get_theme(),
  })
end)

local map = vim.keymap.set

map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
map("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", { desc = "Delete other buffers" })
map("n", "<leader>br", "<cmd>BufferLineCloseRight<CR>", { desc = "Delete buffers to the right" })
map("n", "<leader>bl", "<cmd>BufferLineCloseLeft<CR>", { desc = "Delete buffers to the left" })
