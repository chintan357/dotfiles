return
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
          -- adapter = "openai",
          adapter = "gemini",
        },
        inline = {
          adapter = "gemini",
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
              default = "gemini-2.5-flash-preview-04-17"
              -- "gemini-2.0-flash",
              -- "gemini-2.5-pro-exp-03-25",
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

    vim.cmd([[cab cc CodeCompanion]])
  end,
}
