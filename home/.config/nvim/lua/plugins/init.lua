vim.pack.add({
  -- appearance and core editing
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
  "https://github.com/nvim-mini/mini.nvim",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  "https://github.com/MeanderingProgrammer/treesitter-modules.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/folke/snacks.nvim",

  -- tooling
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
  "https://github.com/j-hui/fidget.nvim",
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1") },
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/mfussenegger/nvim-lint",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/sindrets/diffview.nvim",
  "https://github.com/mrcjkb/rustaceanvim",

  -- ui
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/akinsho/bufferline.nvim",

  -- files
  "https://github.com/nvim-tree/nvim-tree.lua",
  "https://github.com/stevearc/oil.nvim",

  -- editing helpers
  "https://github.com/rmagatti/alternate-toggler",
  "https://github.com/saghen/blink.indent",
  "https://github.com/folke/persistence.nvim",

  "https://github.com/folke/which-key.nvim",
}, { confirm = false })

-- Configured in dependency order. Anything the first draw does not need is
-- wrapped in vim.schedule() inside its file, which runs it on the next loop
-- tick -- after the UI is up, before you can press a key.

-- appearance and core editing
require("plugins.catppuccin")
require("plugins.mini")
require("plugins.treesitter")
require("plugins.snacks")

-- tooling
require("plugins.fzf")
require("plugins.mason")
require("plugins.blink")
require("plugins.conform")
require("plugins.lint")
require("plugins.gitsigns")
require("plugins.diffview")

-- ui
require("plugins.lualine")
require("plugins.bufferline")

-- files
require("plugins.nvim-tree")
require("plugins.oil")

-- editing helpers
require("plugins.util")
require("plugins.persistence")

require("plugins.which-key")
