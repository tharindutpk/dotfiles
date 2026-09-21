-- Replaces typescript-tools.nvim. vtsls is the same TypeScript extension VS
-- Code ships, wrapped as a plain language server -- so it is a mason package
-- and an lsp/<name>.lua file like everything else here, with no plugin, no
-- plenary and no nvim-lspconfig behind it.
---@type vim.lsp.Config
return {
  cmd = { "vtsls", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  -- Lock files first so a package inside a monorepo resolves to its own root
  -- rather than the repository's.
  root_markers = {
    "package-lock.json",
    "pnpm-lock.yaml",
    "yarn.lock",
    "bun.lock",
    "bun.lockb",
    "tsconfig.json",
    "package.json",
    ".git",
  },
  init_options = {
    hostInfo = "neovim",
  },
  settings = {
    vtsls = {
      -- Use the project's own TypeScript rather than the one bundled with the
      -- server, so diagnostics match what `tsc` says in CI.
      autoUseWorkspaceTsdk = true,
      experimental = {
        completion = { enableServerSideFuzzyMatch = true },
      },
    },
    typescript = {
      updateImportsOnFileMove = { enabled = "always" },
      suggest = { completeFunctionCalls = true },
      -- Off until <leader>th turns them on; see lua/config/lsp.lua.
      inlayHints = {
        parameterNames = { enabled = "literals" },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = false },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        enumMemberValues = { enabled = true },
      },
    },
    javascript = {
      updateImportsOnFileMove = { enabled = "always" },
      inlayHints = {
        parameterNames = { enabled = "literals" },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = false },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        enumMemberValues = { enabled = true },
      },
    },
  },
}
