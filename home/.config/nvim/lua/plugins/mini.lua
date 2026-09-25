require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()

vim.schedule(function()
  require("mini.pairs").setup()

  -- sa add, sd delete, sr replace, sf/sF find, sh highlight.
  require("mini.surround").setup()
end)
