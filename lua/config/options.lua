-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Use the native TypeScript 7 LSP (`tsc --lsp`). web-manager aliases the
-- `typescript` package to `@typescript/typescript6`, which does not ship
-- tsserver.js, so vtsls / typescript-tools cannot start a JS tsserver.
vim.g.lazyvim_ts_lsp = "tsgo"
