vim.schedule(function()
  require("fzf-lua").setup({ winopts = { height = 0.80, row = 0.5 } })
end)

local M = {}

---@param picker string
---@param opts? table
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
