local map = vim.keymap.set

map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode (alt)" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

map("n", "<C-h>", "<C-w><C-h>", { desc = "Focus left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Focus right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Focus lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Focus upper window" })

map("n", "<leader>tl", "<cmd>set list!<CR>", { desc = "Toggle whitespace" })
map("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "Toggle line wrap" })

local function pack(opts)
  return function()
    vim.pack.update(nil, opts)
  end
end
map("n", "<leader>ps", pack(), { desc = "Update packages" })
map("n", "<leader>pl", pack({ offline = true }), { desc = "List packages (offline)" })
map("n", "<leader>pr", pack({ target = "lockfile" }), { desc = "Roll packages back to the lockfile" })
