-- https://github.com/olimorris/dotfiles/blob/main/.config/nvim/plugin/ai.lua
return {
  "olimorris/codecompanion.nvim",
  cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions", "CodeCompanionCmd" },
  version = "^19.0.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "MeanderingProgrammer/render-markdown.nvim",
  },
  keys = {
    { "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<CR>", mode = { "n", "v" } },
    { "ga", "<cmd>CodeCompanionChat Add<CR>", mode = { "v" } },
    -- { "<C-a>", "<cmd>CodeCompanionActions<CR>", mode = { "n", "v" }, },
  },
  opts = {
    adapters = {
      http = {
        opts = {
          show_model_choices = true,
          show_presets = false,
        },
        openrouter = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "https://openrouter.ai/api",
              api_key = "cmd:cat ~/private/or",
              chat_url = "/v1/chat/completions",
            },
            schema = {
              model = {
                default = "openai/gpt-chat-latest",
                -- default = "openai/gpt-5.6-luna",
              },
            },
          })
        end,
      },
    },
    interactions = {
      chat = {
        opts = {
          system_prompt = "",
        },
        adapter = "openrouter",
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
    },
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
