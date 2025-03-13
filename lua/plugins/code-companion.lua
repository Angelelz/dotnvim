return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    strategies = {
      chat = {
        adapter = "gemini",
      },
      inline = {
        adapter = "gemini",
      },
    },
    window = {
      layout = "horizontal", -- float|vertical|horizontal|buffer
      position = "bottom", -- left|right|top|bottom (nil will default depending on vim.opt.plitright|vim.opt.splitbelow)
      border = "single",
      height = 0.5,
      width = 0.45,
      relative = "editor",
      opts = {
        breakindent = true,
        cursorcolumn = false,
        cursorline = false,
        foldcolumn = "0",
        linebreak = true,
        list = false,
        numberwidth = 1,
        signcolumn = "no",
        spell = false,
        wrap = true,
      },
    },
    adapters = {
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          name = "gemini", -- Give this adapter a different name to differentiate it from the default ollama adapter
          schema = {
            model = {
              default = "gemini-2.0-flash-exp",
            },
          },
        })
      end,
    },
  },
}
