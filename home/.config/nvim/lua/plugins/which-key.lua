vim.schedule(function()
  require("which-key").setup({
    delay = 200,
    spec = {
      { "<leader>S", group = "Session" },
      { "<leader>b", group = "Buffer" },
      { "<leader>e", group = "Explorer" },
      { "<leader>f", group = "Format" },
      { "<leader>g", group = "Git", mode = { "n", "v" } },
      { "<leader>h", group = "Git hunk", mode = { "n", "v" } },
      { "<leader>p", group = "Packages" },
      { "<leader>s", group = "Search" },
      { "<leader>t", group = "Toggle" },
    },
  })
end)
