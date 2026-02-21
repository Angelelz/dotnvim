-- Override LazyVim's prettier extra to use prettierd (daemon) for faster formatting.
-- prettierd keeps prettier loaded in memory, avoiding Node.js startup cost on each format.
return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "prettierd" },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        vue = { "prettierd" },
        css = { "prettierd" },
        scss = { "prettierd" },
        less = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        jsonc = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        ["markdown.mdx"] = { "prettierd" },
        graphql = { "prettierd" },
        handlebars = { "prettierd" },
      },
    },
  },
}
