-- Servers are defined in lsp/<name>.lua and found by vim.lsp.enable() at the
-- bottom of this file.
local pick = require("plugins.fzf").pick

vim.diagnostic.config({
  severity_sort = true,
  underline = { severity = vim.diagnostic.severity.ERROR },
  virtual_text = { source = true },
  jump = {
    -- Replaces `jump = { float = true }`, which Nvim 0.14 drops.
    on_jump = function(_, bufnr)
      vim.diagnostic.open_float({ bufnr = bufnr, scope = "cursor", focus = false })
    end,
  },
})

local highlight = vim.api.nvim_create_augroup("tharindutpk_lsp_highlight", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("tharindutpk_lsp_attach", { clear = true }),
  desc = "Buffer-local LSP mappings and highlights",
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client == nil then
      return
    end
    local function map(keys, func, desc, mode)
      vim.keymap.set(mode or "n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    -- ruff and ty both attach to Python: ty owns hover, ruff lint and format.
    if client.name == "ruff" then
      client.server_capabilities.hoverProvider = false
    end

    -- fzf-lua pickers in place of the built-in gr* defaults (:help lsp-defaults).
    map("grd", pick("lsp_definitions"), "Goto definition")
    map("grt", pick("lsp_typedefs"), "Goto type definition")
    map("grr", pick("lsp_references"), "Goto references")
    map("gri", pick("lsp_implementations"), "Goto implementation")
    map("grD", vim.lsp.buf.declaration, "Goto declaration")
    map("gO", pick("lsp_document_symbols"), "Open document symbols")
    map("gW", pick("lsp_workspace_symbols"), "Open workspace symbols")
    map("grn", vim.lsp.buf.rename, "Rename")
    map("gra", vim.lsp.buf.code_action, "Code action", { "n", "x" })

    if client:supports_method("textDocument/documentHighlight", event.buf) then
      -- Cleared first: a restarted server attaches again, and would otherwise
      -- stack a second set of these on the buffer.
      vim.api.nvim_clear_autocmds({ group = highlight, buffer = event.buf })
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        group = highlight,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        group = highlight,
        callback = vim.lsp.buf.clear_references,
      })
    end

    if client:supports_method("textDocument/inlayHint", event.buf) then
      map("<leader>th", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
      end, "Toggle inlay hints")
    end
  end,
})

-- Restart and stop are built in: `:lsp restart`, `:lsp stop`, and
-- `:RustAnalyzer restart` for rust-analyzer, which rustaceanvim starts itself.
vim.lsp.enable({ "bashls", "clangd", "gopls", "lua_ls", "ruff", "svelte", "ty", "vtsls" })
