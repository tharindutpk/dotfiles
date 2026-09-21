local o = vim.o

o.number = true
o.relativenumber = true
o.cursorline = true
o.scrolloff = 10
o.signcolumn = "yes" -- always shown, so text never shifts sideways
o.showmode = false -- lualine shows the mode
o.winborder = "solid"
o.mouse = "a"

-- Deferred: resolving the clipboard provider shells out, which is measurable at
-- startup, and nothing can be yanked before the first draw.
vim.schedule(function()
  o.clipboard = "unnamedplus"
end)

-- Nvim's own ftplugins put noexpandtab back for go, gomod and make.
o.shiftwidth = 2
o.tabstop = 2
o.expandtab = true
o.breakindent = true
o.undofile = true

o.ignorecase = true
o.smartcase = true
o.splitright = true
o.splitbelow = true

o.listchars = "tab:» ,trail:·,nbsp:␣" -- shown by <leader>tl
o.updatetime = 250 -- drives CursorHold, and with it LSP reference highlighting
o.timeoutlen = 300
o.inccommand = "split"
o.confirm = true
