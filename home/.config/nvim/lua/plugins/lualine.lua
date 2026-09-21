vim.pack.add({
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
}, { confirm = false })

-- Adding nvim-web-devicons here and again in bufferline.lua and nvim-tree.lua
-- is deliberate, not a mistake: vim.pack ignores every add after the first, so
-- each file stays readable on its own and the shared dependency is stated
-- wherever it is actually needed.
vim.schedule(function()
  require("lualine").setup({
    options = {
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = { "NvimTree", "snacks_dashboard" },
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = { { "filename", file_status = true, path = 1 } },
      lualine_x = { "diff", "diagnostics", "encoding", "fileformat", "filetype" },
    },
    extensions = { "mason", "nvim-tree", "oil" },
  })
end)
