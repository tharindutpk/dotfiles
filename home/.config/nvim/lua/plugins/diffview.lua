vim.schedule(function()
  require("diffview").setup({
    enhanced_diff_hl = true,
    view = { merge_tool = { layout = "diff3_mixed" } },
    file_panel = { win_config = { width = 32 } },
    keymaps = {
      view = { { "n", "q", "<cmd>DiffviewClose<CR>", { desc = "Close diffview" } } },
      file_panel = { { "n", "q", "<cmd>DiffviewClose<CR>", { desc = "Close diffview" } } },
      file_history_panel = { { "n", "q", "<cmd>DiffviewClose<CR>", { desc = "Close diffview" } } },
    },
  })
end)

local map = vim.keymap.set

map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Diff working tree" })
map("n", "<leader>gm", "<cmd>DiffviewOpen origin/HEAD...HEAD<CR>", { desc = "Diff against merge base" })
map("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", { desc = "History of this file" })
map("n", "<leader>gH", "<cmd>DiffviewFileHistory<CR>", { desc = "History of this branch" })
map("v", "<leader>gh", "<Esc><cmd>'<,'>DiffviewFileHistory<CR>", { desc = "History of selection" })
map("n", "<leader>gq", "<cmd>DiffviewClose<CR>", { desc = "Close diffview" })
