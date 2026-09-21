-- persistence saves on VimLeavePre, so the schedule tick is early enough;
-- restoring is always explicit.
vim.schedule(function()
  require("persistence").setup({})
end)

local function session(fn, opts)
  return function()
    require("persistence")[fn](opts)
  end
end

local map = vim.keymap.set

map("n", "<leader>Ss", session("load"), { desc = "Restore session for this directory" })
map("n", "<leader>Sl", session("load", { last = true }), { desc = "Restore last session" })
map("n", "<leader>Sd", session("stop"), { desc = "Do not save this session" })
