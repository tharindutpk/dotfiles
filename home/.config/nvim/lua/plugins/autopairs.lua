vim.pack.add({
  { src = "https://github.com/windwp/nvim-autopairs" },
}, { confirm = false })

vim.schedule(function()
  require("nvim-autopairs").setup({})
end)
