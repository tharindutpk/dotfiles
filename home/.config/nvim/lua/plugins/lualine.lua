vim.schedule(function()
  require("lualine").setup({
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = { "NvimTree", "snacks_dashboard" },
      },
    },
    sections = {
      lualine_b = { "branch" },
      lualine_c = { { "filename", file_status = true, path = 1 } },
      lualine_x = { "diff", "diagnostics", "encoding", "fileformat", "filetype" },
    },
    extensions = { "mason", "nvim-tree", "oil" },
  })
end)
