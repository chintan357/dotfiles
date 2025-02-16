return {
  {
    "github/copilot.vim",
    enabled = false,
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = {
            adapter = "gemini",
          },
          inline = {
            adapter = "openai",
          },
        },
        adapters = {
          openai = function()
            return require("codecompanion.adapters").extend("openai", {
              env = {
                -- api_key = "cmd:op read op://personal/OpenAI/credential --no-newline",
                api_key = "cmd:cat ~/private/oanvim",
              },
            })
          end,
          gemini = function()
            return require("codecompanion.adapters").extend("gemini", {
              model = {
                default = "gemini-2.0-flash"
              },
              env = {
                api_key = "cmd:cat ~/private/gemini-nvim",
              },
            })
          end,
        },
      })
      -- vim.api.nvim_set_keymap({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
      vim.keymap.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>",
        { noremap = true, silent = true })
      vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

      -- Expand 'cc' into 'CodeCompanion' in the command line
      vim.cmd([[cab cc CodeCompanion]])
    end,
  }
}
-- https://github.com/yetone/avante.nvim
