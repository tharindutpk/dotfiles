-- Entry point. Everything else is reached from these five lines, in this order:
--
--   1. vim.loader  caches every Lua module required below it -- so it is first
--   2. leaders     must be set before any mapping is defined
--   3. config      options, keymaps, autocmds -- including the PackChanged
--                  hooks, which have to exist before a plugin can install
--   4. plugins     vim.pack.add() + setup(), in dependency order
--   5. config.lsp  last: needs blink.cmp's completion capabilities

vim.loader.enable()

-- Stamped here so the dashboard can report how long the config took to load.
vim.g.start_time = vim.uv.hrtime()

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config")
require("plugins")
require("config.lsp")
