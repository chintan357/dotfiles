-- https://github.com/olimorris/dotfiles/blob/main/.config/nvim/lua/plugins/coding.lua
return {
  "olimorris/codecompanion.nvim",
  cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions", "CodeCompanionCmd" },
  -- version = "^18.0.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- "ravitemer/codecompanion-history.nvim", -- Save and load conversation history
    "MeanderingProgrammer/render-markdown.nvim",
    -- "ravitemer/mcphub.nvim",
  },
  keys = {
    -- { "<C-a>", "<cmd>CodeCompanionActions<CR>", mode = { "n", "v" }, },
    { "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<CR>", mode = { "n", "v" } },
    { "ga", "<cmd>CodeCompanionChat Add<CR>", mode = { "v" } },
  },
  opts = {
    adapters = {
      acp = {
        opts = {
          show_presets = false,
        },
        gemini_cli = function()
          return require("codecompanion.adapters").extend("gemini_cli", {
            defaults = {
              auth_method = "oauth-personal",
            },
          })
        end,
        opencode = function()
          return require("codecompanion.adapters").extend("opencode", {
            commands = {
              default = { "opencode", "acp" },
              -- copilot_sonnet_4_5 = { "opencode", "acp", "-m", "github-copilot/claude-sonnet-4.5", },
            },
          })
        end,
      },
      http = {
        opts = {
          show_model_choices = true,
          show_presets = false,
        },
        gemini = function()
          return require("codecompanion.adapters").extend("gemini", {
            env = {
              api_key = "cmd:cat ~/private/gemini",
            },
            schema = {
              model = {
                default = "gemini-3-flash-preview",
                temperature = 0.1,
              },
              reasoning_effort = "none",
            },
          })
        end,
        openrouter = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "https://openrouter.ai/api",
              api_key = "cmd:cat ~/private/or",
              chat_url = "/v1/chat/completions",
            },
            schema = {
              model = {
                default = "openai/gpt-5.2-chat",
              },
            },
          })
        end,
      },
    },
    extensions = {
      -- history = {
      --   enabled = true,
      --   opts = {
      --     keymap = "gh",
      --     save_chat_keymap = "sc",
      --     auto_save = false,
      --     auto_generate_title = true,
      --     continue_last_chat = false,
      --     delete_on_clearing_chat = false,
      --     picker = "snacks",
      --     enable_logging = false,
      --     dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
      --   },
      -- },
      -- mcphub = {
      --   callback = "mcphub.extensions.codecompanion",
      --   opts = {
      --     make_vars = true,
      --     make_slash_commands = true,
      --     show_result_in_chat = true,
      --   },
      -- },
    },
    interactions = {
      chat = {
        opts = {
          system_prompt = "",
        },
        adapter = {
          name = "openrouter",
          model = "openai/gpt-5.3-chat",
          -- model = "anthropic/claude-haiku-4.5",
          -- model = "moonshotai/kimi-k2-0905",
        },
        roles = {
          llm = function(adapter)
            local model_name = ""
            if adapter.schema and adapter.schema.model and adapter.schema.model.default then
              local model = adapter.schema.model.default
              if type(model) == "function" then
                model = model(adapter)
              end
              model_name = " (" .. model .. ")"
            end
            return "  " .. adapter.formatted_name .. model_name
          end,
          user = "cpatel",
        },
      },
      inline = {
        adapter = "openrouter",
      },
      cmd = {
        adapter = "openrouter",
      },
      background = {
        -- adapter = {
        --   name = "",
        --   model = "",
        -- },
      },
    },
    -- opts = {
    --   log_level = "DEBUG",
    -- },
    display = {
      action_palette = {
        provider = "default",
      },
      chat = {
        auto_scroll = false,
        show_token_count = false,
        show_header_separator = true,
        -- show_references = true,
        -- show_settings = false,
        icons = { tool_success = "󰸞" },
        fold_context = true,
      },
      -- diff = { provider = "mini_diff", },
    },
  },
  init = function()
    vim.cmd([[cab cc CodeCompanion]])
  end,
}

-- {
--   "Davidyz/VectorCode", -- Index and search code in your repositories
--   version = "*",
--   build = "pipx upgrade vectorcode",
--   dependencies = { "nvim-lua/plenary.nvim" },
-- },
-- vectorcode = {
--   opts = {
--     add_tool = true,
--   },
-- },
