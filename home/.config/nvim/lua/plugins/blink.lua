require("blink.cmp").setup({
  keymap = {
    preset = "enter",
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
  },
  completion = { documentation = { auto_show = true } },
  sources = {
    providers = {
      snippets = { opts = { clipboard_register = "+" } },
    },
  },
  signature = { enabled = true },
})

-- blink does not register these itself; without them every server falls back
-- to Nvim's own capabilities and loses snippet and resolve support.
vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities(nil, true) })
