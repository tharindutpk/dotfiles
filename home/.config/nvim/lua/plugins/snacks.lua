vim.pack.add({
  { src = "https://github.com/folke/snacks.nvim" },
}, { confirm = false })

--- Dashboard footer: plugin count and how long the config took to load.
---
--- snacks ships a `startup` section for exactly this, but it reads
--- `lazy.stats`, and this config uses vim.pack. So: count it here instead.
---
--- Captured on the first render, so reopening the dashboard later in the
--- session keeps reporting startup numbers rather than the session's age.
---@type { total: integer, ms: number|nil }|nil
local stats

---@type snacks.dashboard.Gen
local function startup_section()
  if not stats then
    local total = 0

    -- `vim.pack.get()` defaults to info=true, which runs git per plugin and
    -- costs ~100ms. The count needs neither, so ask for none.
    for _, plugin in ipairs(vim.pack.get(nil, { info = false })) do
      if plugin.active then
        total = total + 1
      end
    end

    stats = {
      total = total,
      -- No stamp means init.lua lost its first lines; show the count anyway
      -- rather than erroring out and taking the whole dashboard with it.
      ms = vim.g.start_time and math.floor((vim.uv.hrtime() - vim.g.start_time) / 1e5 + 0.5) / 10 or nil,
    }
  end

  local text = {
    { "⚡ ", hl = "footer" },
    { tostring(stats.total), hl = "special" },
    { " plugins loaded", hl = "footer" },
  }

  if stats.ms then
    text[#text + 1] = { " in ", hl = "footer" }
    text[#text + 1] = { stats.ms .. "ms", hl = "special" }
  end

  return { align = "center", text = text }
end

-- Eager on purpose: bigfile and quickfile have to be in place before the first
-- buffer is read, and the dashboard has to exist before VimEnter.
require("snacks").setup({
  bigfile = { enabled = true }, -- disable heavy features on huge files
  quickfile = { enabled = true }, -- render the file before plugins finish loading

  -- Replaces toggleterm. Same idea, one less plugin, and it is already here.
  terminal = {
    win = { position = "bottom", height = 0.3 },
  },

  -- fzf-lua owns every picker in this config (lua/plugins/fzf.lua and the LSP
  -- mappings in lua/config/lsp.lua). Off by default, but stated explicitly so
  -- the dashboard keeps routing its Recent Files and Projects sections to
  -- fzf-lua, and so a future snacks release cannot flip the default.
  picker = { enabled = false },

  dashboard = {
    sections = {
      { section = "header" },
      { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
      { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
      { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
      { padding = 1 },
      startup_section,
    },
  },
})

local map = vim.keymap.set

map({ "n", "t" }, "<C-\\>", function()
  require("snacks").terminal.toggle()
end, { desc = "Toggle terminal" })

map("n", "<leader>gg", function()
  require("snacks").lazygit()
end, { desc = "Lazygit" })
