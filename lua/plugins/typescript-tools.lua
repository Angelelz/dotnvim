-- Use typescript-tools.nvim instead of vtsls for TypeScript.
-- Communicates directly with tsserver via its native protocol from Lua,
-- eliminating the Node.js wrapper overhead. Better for large monorepos.
return {
  -- Disable vtsls (provided by LazyVim's lang.typescript extra)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = { enabled = false },
      },
    },
  },

  -- typescript-tools.nvim: native Lua tsserver integration
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    opts = {
      settings = {
        -- Spawn a separate tsserver instance for diagnostics so that
        -- completions / go-to-definition never get blocked by diagnostic computation.
        separate_diagnostic_server = true,

        -- Only publish diagnostics when leaving insert mode (not on every keystroke)
        publish_diagnostic_on = "insert_leave",

        -- Expose all available code actions (organize imports, fix all, etc.)
        expose_as_code_action = "all",

        -- Performance tweaks for large codebases
        complete_function_calls = false,
        include_completions_with_insert_text = true,

        -- Memory limit -- "auto" means no limit; set a number (MB) to cap it
        tsserver_max_memory = 16384,

        -- Disable code lens (experimental, can hurt performance)
        code_lens = "off",

        tsserver_file_preferences = {
          includeInlayParameterNameHints = "none",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = false,
          includeInlayVariableTypeHints = false,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = false,
          includeInlayFunctionLikeReturnTypeHints = false,
          includeInlayEnumMemberValueHints = false,
        },
      },
    },
  },
}
