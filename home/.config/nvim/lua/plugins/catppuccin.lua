-- `name` is not optional here. Without it vim.pack takes the name from the
-- repository -- catppuccin/*nvim* -- and installs a plugin directory called
-- "nvim", which is both confusing and a collision waiting to happen.
vim.pack.add({
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
}, { confirm = false })

-- Eager, and it has to be: a colorscheme applied after the first draw is a
-- visible flash of the default theme.
require("catppuccin").setup({
  flavour = "mocha",
  no_italic = true,
  -- `default_integrations` already covers blink_cmp, blink_indent, fzf,
  -- gitsigns, nvimtree and treesitter_context; only the ones that ship
  -- disabled need listing here.
  integrations = {
    diffview = true,
    fidget = true,
    mason = true,
    nvim_surround = true,
    snacks = true,
    which_key = true,
  },
  compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
})

vim.cmd.colorscheme("catppuccin")
