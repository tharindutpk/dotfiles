vim.pack.add({
  { src = "https://github.com/stevearc/oil.nvim" },
}, { confirm = false })

-- Eager: oil takes over directory buffers, so it has to be configured before
-- Nvim reads the argument list -- otherwise `nvim .` opens netrw. Its setup is
-- cheap.
require("oil").setup({})

vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
