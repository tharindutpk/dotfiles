-- Plugins are loaded in dependency order, not alphabetically:
--   * the colorscheme first, so everything else can theme against it;
--   * blink before anything that reads LSP capabilities;
--   * which-key last, so its groups are registered after every mapping exists.
--
-- Each file calls `vim.pack.add()` and then configures its plugin. Anything
-- the first screen draw does not depend on is wrapped in `vim.schedule()`,
-- which runs it on the next loop tick -- after the UI is up, before you can
-- press a key. That is the whole lazy-loading story here: no framework, no
-- helper module, five words per plugin.

-- appearance and core editing
require("plugins.catppuccin")
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
require("plugins.autopairs")
require("plugins.util")
require("plugins.persistence")
require("plugins.lang")

require("plugins.which-key")
