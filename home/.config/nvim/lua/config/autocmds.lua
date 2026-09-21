local function augroup(name)
  return vim.api.nvim_create_augroup("tharindutpk_" .. name, { clear = true })
end
local autocmd = vim.api.nvim_create_autocmd

-- Parsers are rebuilt when nvim-treesitter updates, or their ABI drifts out of
-- sync. Updates only: on a fresh install this fires before nvim-treesitter is
-- loaded, while :TSUpdate does not exist yet.
autocmd("PackChanged", {
  group = augroup("pack_treesitter"),
  desc = "Rebuild parsers after nvim-treesitter changes",
  callback = function(args)
    if args.data.spec.name == "nvim-treesitter" and args.data.kind == "update" then
      vim.schedule(function()
        vim.cmd("TSUpdate")
      end)
    end
  end,
})

autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  desc = "Highlight on yank",
  callback = function()
    vim.hl.on_yank()
  end,
})

autocmd("BufReadPost", {
  group = augroup("last_location"),
  desc = "Restore last cursor position",
  callback = function(event)
    local mark = vim.api.nvim_buf_get_mark(event.buf, '"')
    if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(event.buf) then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  desc = "Reload buffers changed outside Nvim",
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

autocmd("FileType", {
  group = augroup("close_with_q"),
  desc = "Close throwaway buffers with q",
  pattern = {
    "checkhealth",
    "gitsigns-blame",
    "help",
    "man",
    "nvim-pack",
    "qf",
    "query",
    "startuptime",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false

    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, { buffer = event.buf, silent = true, desc = "Quit buffer" })
    end)
  end,
})
