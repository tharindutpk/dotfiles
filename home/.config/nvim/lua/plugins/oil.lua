-- Eager: oil has to claim directory buffers before Nvim reads the argument
-- list, or `nvim .` opens netrw.
require("oil").setup({})

vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
