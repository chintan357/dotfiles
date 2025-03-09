return {
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
            adapter = "openai",
            -- adapter = "gemini",
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

      vim.cmd([[cab cc CodeCompanion]])
    end,
  },
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  --   opts = {
  --     -- add any opts here
  --     -- for example
  --     provider = "openai",
  --     openai = {
  --       endpoint = "https://api.openai.com/v1",
  --       model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
  --       timeout = 30000,  -- timeout in milliseconds
  --       temperature = 0,  -- adjust if needed
  --       max_tokens = 4096,
  --       -- reasoning_effort = "high" -- only supported for reasoning models (o1, etc.)
  --     },
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = "make",
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --     "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
  --     "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
  --     -- "zbirenbaum/copilot.lua",        -- for providers='copilot'
  --     -- {
  --     --   -- support for image pasting
  --     --   "HakonHarnes/img-clip.nvim",
  --     --   event = "VeryLazy",
  --     --   opts = {
  --     --     -- recommended settings
  --     --     default = {
  --     --       embed_image_as_base64 = false,
  --     --       prompt_for_file_name = false,
  --     --       drag_and_drop = {
  --     --         insert_mode = true,
  --     --       },
  --     --       -- required for Windows users
  --     --       use_absolute_path = true,
  --     --     },
  --     --   },
  --     -- },
  --   },
  -- }

}
