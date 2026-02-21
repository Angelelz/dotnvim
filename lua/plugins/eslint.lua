-- Use eslint_d via nvim-lint instead of the ESLint LSP server.
-- eslint_d runs as a daemon, avoiding Node.js startup cost on each lint.
-- Lints on save (BufWritePost) and when entering insert mode (InsertLeave).
return {
  -- Disable the ESLint LSP server from LazyVim extra
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        eslint = { enabled = false },
      },
    },
  },

  -- Install eslint_d via Mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "eslint_d" },
    },
  },

  -- Configure nvim-lint to use eslint_d
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      linters_by_ft = {
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        vue = { "eslint_d" },
      },
      -- LazyVim's nvim-lint extra triggers on BufWritePost and InsertLeave by default.
      -- If you want more control, you can set events here.
    },
  },
}
