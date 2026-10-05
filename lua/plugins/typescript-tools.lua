-- typescript-tools talks to JS tsserver.js. web-manager's `typescript`
-- package is `@typescript/typescript6`, which does not include that file,
-- so the client crashes on attach. LazyVim's tsgo extra uses `tsc --lsp`
-- (TypeScript 7 native) instead; see vim.g.lazyvim_ts_lsp in options.lua.
return {
  { "pmizio/typescript-tools.nvim", enabled = false },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      -- nvim-lspconfig resolves workspace node_modules/.bin/tsc; don't wait
      -- for a Mason tsgo install that would block attach.
      opts.servers.tsgo = vim.tbl_deep_extend("force", opts.servers.tsgo or {}, {
        enabled = true,
        mason = false,
      })
    end,
  },
}
