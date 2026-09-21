vim.pack.add({
  { src = "https://github.com/kylechui/nvim-surround" },
  { src = "https://github.com/rmagatti/alternate-toggler" },
  { src = "https://github.com/saghen/blink.indent" },
}, { confirm = false })

vim.schedule(function()
  require("nvim-surround").setup({})

  require("alternate-toggler").setup({})

  require("blink.indent").setup({
    static = { char = "│" },
    scope = {
      char = "│",
      highlights = { "BlinkIndentScope" },
    },
  })
end)

vim.keymap.set("n", "<leader>ta", "<cmd>ToggleAlternate<CR>", { desc = "Toggle alternate (true/false, ==/~=, ...)" })
