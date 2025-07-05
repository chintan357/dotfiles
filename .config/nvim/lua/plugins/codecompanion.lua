return
{
  "olimorris/codecompanion.nvim",
  cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "j-hui/fidget.nvim",                    -- Display status
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/codecompanion-history.nvim", -- Save and load conversation history
    "ravitemer/mcphub.nvim",
    -- "zbirenbaum/copilot.lua",
    -- {
    --   "MeanderingProgrammer/render-markdown.nvim",
    --   ft = { "markdown", "codecompanion" }
    -- },
    -- {
    --   "Davidyz/VectorCode", -- Index and search code in your repositories
    --   version = "*",
    --   build = "pipx upgrade vectorcode",
    --   dependencies = { "nvim-lua/plenary.nvim" },
    -- },
    -- {
    --   "HakonHarnes/img-clip.nvim", -- Share images with the chat buffer
    --   event = "VeryLazy",
    --   cmd = "PasteImage",
    --   opts = {
    --     filetypes = {
    --       codecompanion = {
    --         prompt_for_file_name = false,
    --         template = "[Image]($FILE_PATH)",
    --         use_absolute_path = true,
    --       },
    --     },
    --   },
    -- },
  },
  -- { "<leader>ic", "<cmd>CodeCompanion<cr>"},
  -- { "<leader>iC", "<cmd>CodeCompanionChat<cr>"},
  -- { "<leader>ia", "<cmd>CodeCompanionActions<cr>"},
  -- { "<leader>id", "<cmd>CodeCompanionCmd<cr>"},
  keys = {
    -- {
    --   "<C-a>",
    --   "<cmd>CodeCompanionActions<CR>",
    --   mode = { "n", "v" },
    -- },
    {
      "<LocalLeader>a",
      "<cmd>CodeCompanionChat Toggle<CR>",
      mode = { "n", "v" },
    },
    {
      "ga",
      "<cmd>CodeCompanionChat Add<CR>",
      mode = { "v" },
    },
  },
  -- init = function()
  --   vim.cmd([[cab cc CodeCompanion]])
  --   require("plugins.custom.spinner"):init()
  -- end,
  config = function()
    require("codecompanion").setup({
      extensions = {
        history = {
          enabled = true,
          opts = {
            keymap = "gh",
            save_chat_keymap = "sc",
            auto_save = false,
            auto_generate_title = true,
            continue_last_chat = false,
            delete_on_clearing_chat = false,
            picker = "snacks",
            enable_logging = false,
            dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
          },
        },
        -- vectorcode = {
        --   opts = {
        --     add_tool = true,
        --   },
        -- },
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true
          }
        }
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
        chat = {
          auto_scroll = false,
          show_token_count = false,
          show_header_separator = true,
          -- show_references = true,
          -- show_header_separator = false,
          -- icons = { tool_success = "󰸞", },
        },
        -- diff = { provider = "mini_diff", },
      },
      adapters = {
        --   copilot = function()
        --     return require("codecompanion.adapters").extend("copilot", {
        --       schema = {
        --         model = {
        --           default = "gemini-2.5-pro",
        --         },
        --       },
        --     })
        --   end,
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
            },
          })
        end,
      },
    })

    vim.cmd([[cab cc CodeCompanion]])
  end,
}

-- vim.api.nvim_set_keymap({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
-- vim.keymap.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
-- vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
