vim.pack.add({
  { src = "https://github.com/ibhagwan/fzf-lua" },
}, { confirm = false })

-- fzf-lua is ~14ms to require and configure, and nothing needs it before the
-- first draw. `vim.schedule` runs this on the next loop tick -- after the UI
-- is up, and long before any of the mappings below can be pressed.
vim.schedule(function()
  require("fzf-lua").setup({
    winopts = {
      height = 0.80,
      width = 0.80,
      row = 0.5,
      backdrop = 60,
    },
  })
end)

local M = {}

--- Return a function that opens the named fzf-lua picker.
---
--- Exported because lua/config/lsp.lua binds the `gr*` mappings to pickers too,
--- and closing over the module here keeps `require("fzf-lua")` off the path
--- that runs whenever a language server attaches.
---@param picker string Name of a field on the fzf-lua module, e.g. "files".
---@param opts? table Picker options.
---@return fun()
function M.pick(picker, opts)
  return function()
    require("fzf-lua")[picker](opts)
  end
end

local map = vim.keymap.set

map("n", "<leader>sh", M.pick("help_tags"), { desc = "Search help" })
map("n", "<leader>sk", M.pick("keymaps"), { desc = "Search keymaps" })
map("n", "<leader>sf", M.pick("files"), { desc = "Search files" })
map("n", "<leader>sw", M.pick("grep_cword"), { desc = "Search current word" })
map("n", "<leader>sg", M.pick("live_grep_native"), { desc = "Search by grep" })
map("n", "<leader>sl", M.pick("grep", { resume = true }), { desc = "Search by last" })
map("n", "<leader>sd", M.pick("lsp_document_diagnostics"), { desc = "Search diagnostics" })
map("n", "<leader>so", M.pick("oldfiles", { cwd_only = true }), { desc = "Search old files" })
map("n", "<leader>sn", M.pick("files", { cwd = vim.fn.stdpath("config") }), { desc = "Search neovim files" })
map("n", "<leader>s/", M.pick("buffers"), { desc = "Search in open files" })
map("n", "<leader>/", M.pick("grep_curbuf"), { desc = "Fuzzily search in current buffer" })
map("n", "<leader><leader>", M.pick("buffers"), { desc = "Find existing buffers" })

return M
