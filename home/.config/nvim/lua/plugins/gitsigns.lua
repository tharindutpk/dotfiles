vim.schedule(function()
  require("gitsigns").setup({
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },

    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")

      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      -- ]c and [c keep their built-in meaning inside a diff window.
      local function nav(direction, key)
        return function()
          if vim.wo.diff then
            vim.cmd.normal({ key, bang = true })
          else
            gitsigns.nav_hunk(direction)
          end
        end
      end

      local function selection()
        return { vim.fn.line("."), vim.fn.line("v") }
      end

      map("n", "]c", nav("next", "]c"), "Jump to next git change")
      map("n", "[c", nav("prev", "[c"), "Jump to previous git change")

      -- stage_hunk toggles in gitsigns v1: on a staged hunk it unstages, which
      -- is why there is no separate undo mapping.
      map("n", "<leader>hs", gitsigns.stage_hunk, "Git stage/unstage hunk")
      map("v", "<leader>hs", function()
        gitsigns.stage_hunk(selection())
      end, "Git stage/unstage hunk")
      map("n", "<leader>hr", gitsigns.reset_hunk, "Git reset hunk")
      map("v", "<leader>hr", function()
        gitsigns.reset_hunk(selection())
      end, "Git reset hunk")
      map("n", "<leader>hS", gitsigns.stage_buffer, "Git stage buffer")
      map("n", "<leader>hR", gitsigns.reset_buffer, "Git reset buffer")

      map("n", "<leader>hp", gitsigns.preview_hunk, "Git preview hunk")
      map("n", "<leader>hi", gitsigns.preview_hunk_inline, "Git preview hunk inline")
      map("n", "<leader>hb", gitsigns.blame_line, "Git blame line")
      map("n", "<leader>hd", gitsigns.diffthis, "Git diff against index")
      map("n", "<leader>hD", function()
        gitsigns.diffthis("@")
      end, "Git diff against last commit")

      map("n", "<leader>tb", gitsigns.toggle_current_line_blame, "Toggle git blame line")
    end,
  })
end)
