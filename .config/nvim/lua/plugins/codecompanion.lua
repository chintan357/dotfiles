return
{
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/codecompanion-history.nvim", -- Save and load conversation history
    -- "ravitemer/mcphub.nvim",
    -- {
    --     "Davidyz/VectorCode", -- Index and search code in your repositories
    --     version = "*",
    --     build = "pipx upgrade vectorcode",
    --     dependencies = { "nvim-lua/plenary.nvim" },
    -- },
  },
  -- keys = {
  -- { "<leader>ic", "<cmd>CodeCompanion<cr>",        desc = "CodeCompanion" },
  -- { "<leader>iC", "<cmd>CodeCompanionChat<cr>",    desc = "CodeCompanion Chat" },
  -- { "<leader>ia", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
  -- { "<leader>id", "<cmd>CodeCompanionCmd<cr>",     desc = "CodeCompanion CMD" },
  -- },
  -- opts = {
  -- mcphub = {
  --   callback = "mcphub.extensions.codecompanion",
  --   opts = {
  --     make_vars = true,
  --     make_slash_commands = true,
  --     show_result_in_chat = true,
  --   },
  -- },
  -- vectorcode = {
  --   opts = {
  --     add_tool = true,
  --   },
  -- },
  -- },
  -- adapters = {
  --   copilot = function()
  --     return require("codecompanion.adapters").extend("copilot", {
  --       schema = {
  --         model = {
  --           default = "gemini-2.5-pro",
  --         },
  --       },
  --     })
  --   end,
  -- }
  -- },
  config = function()
    require("codecompanion").setup({
      extensions = {
        history = {
          enabled = true,
          opts = {
            keymap = "gh",
            auto_generate_title = true,
            continue_last_chat = false,
            delete_on_clearing_chat = false,
            picker = "snacks",
            enable_logging = false,
            dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
          },

        },
      },
      strategies = {
        chat = {
          adapter = "copilot",
        },
        inline = {
          adapter = "copilot",
        },
        cmd = {
          adapter = "copilot",
        }
      },
      display = {
        action_palette = {
          width = 95,
          height = 10,
          prompt = "Prompt ",                   -- Prompt used for interactive LLM calls
          provider = "snacks",                  -- Can be "default", "telescope", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
          opts = {
            show_default_actions = true,        -- Show the default actions in the action palette?
            show_default_prompt_library = true, -- Show the default prompt library in the action palette?
          },
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
            env = {
              api_key = "cmd:cat ~/private/gemini-nvim",
              -- api_key = "cmd:op read op://personal/XXX/credential --no-newline",
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
