return
{
  "olimorris/codecompanion.nvim",
  -- cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "j-hui/fidget.nvim",                    -- Display status
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/codecompanion-history.nvim", -- Save and load conversation history
    "ravitemer/mcphub.nvim",
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
  opts = {


  },
  -- keys = {
  -- { "<leader>ic", "<cmd>CodeCompanion<cr>",        desc = "CodeCompanion" },
  -- { "<leader>iC", "<cmd>CodeCompanionChat<cr>",    desc = "CodeCompanion Chat" },
  -- { "<leader>ia", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
  -- { "<leader>id", "<cmd>CodeCompanionCmd<cr>",     desc = "CodeCompanion CMD" },
  -- },
  -- keys = {
  --   {
  --     "<C-a>",
  --     "<cmd>CodeCompanionActions<CR>",
  --     desc = "Open the action palette",
  --     mode = { "n", "v" },
  --   },
  --   {
  --     "<Leader>a",
  --     "<cmd>CodeCompanionChat Toggle<CR>",
  --     desc = "Toggle a chat buffer",
  --     mode = { "n", "v" },
  --   },
  --   {
  --     "<LocalLeader>a",
  --     "<cmd>CodeCompanionChat Add<CR>",
  --     desc = "Add code to a chat buffer",
  --     mode = { "v" },
  --   },
  -- },
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
          adapter = {
            name = "copilot",
            -- model = "claude-sonnet-4",
          },
          roles = {
            user = "chintan357",
          },
          -- keymaps = {
          --   send = {
          --     modes = {
          --       i = { "<C-CR>", "<C-s>" },
          --     },
          --   },
          --   completion = {
          --     modes = {
          --       i = "<C-x>",
          --     },
          --   },
          -- },
          -- slash_commands = {
          --   ["buffer"] = {
          --     keymaps = {
          --       modes = {
          --         i = "<C-b>",
          --       },
          --     },
          --   },
          --   ["fetch"] = {
          --     keymaps = {
          --       modes = {
          --         i = "<C-f>",
          --       },
          --     },
          --   },
          --   ["help"] = {
          --     opts = {
          --       max_lines = 1000,
          --     },
          --   },
          --   ["image"] = {
          --     keymaps = {
          --       modes = {
          --         i = "<C-i>",
          --       },
          --     },
          --     opts = {
          --       dirs = { "~/Documents/Screenshots" },
          --     },
          --   },
          -- },
        },
        inline = {
          adapter = {
            name = "copilot",
            model = "gpt-4.1",
          },
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
        chat = {
          -- show_references = true,
          -- show_header_separator = false,
          -- show_settings = false,
          icons = {
            tool_success = "󰸞",
          },
        },
        diff = {
          provider = "mini_diff",
        },
      },
      -- opts = {
      --   log_level = "DEBUG",
      -- },
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

-- opts = {
--   prompt_library = {
--     ["Test workflow"] = {
--       strategy = "workflow",
--       description = "Use a workflow to test the plugin",
--       opts = {
--         index = 4,
--       },
--       prompts = {
--         {
--           {
--             role = "user",
--             content =
--             "Generate a Python class for managing a book library with methods for adding, removing, and searching books",
--             opts = {
--               auto_submit = false,
--             },
--           },
--         },
--         {
--           {
--             role = "user",
--             content = "Write unit tests for the library class you just created",
--             opts = {
--               auto_submit = true,
--             },
--           },
--         },
--         {
--           {
--             role = "user",
--             content = "Create a TypeScript interface for a complex e-commerce shopping cart system",
--             opts = {
--               auto_submit = true,
--             },
--           },
--         },
--         {
--           {
--             role = "user",
--             content = "Write a recursive algorithm to balance a binary search tree in Java",
--             opts = {
--               auto_submit = true,
--             },
--           },
--         },
--         {
--           {
--             role = "user",
--             content = "Generate a comprehensive regex pattern to validate email addresses with explanations",
--             opts = {
--               auto_submit = true,
--             },
--           },
--         },
--         {
--           {
--             role = "user",
--             content = "Create a Rust struct and implementation for a thread-safe message queue",
--             opts = {
--               auto_submit = true,
--             },
--           },
--         },
--         {
--           {
--             role = "user",
--             content = "Write a GitHub Actions workflow file for CI/CD with multiple stages",
--             opts = {
--               auto_submit = true,
--             },
--           },
--         },
--         {
--           {
--             role = "user",
--             content = "Create SQL queries for a complex database schema with joins across 4 tables",
--             opts = {
--               auto_submit = true,
--             },
--           },
--         },
--         {
--           {
--             role = "user",
--             content = "Write a Lua configuration for Neovim with custom keybindings and plugins",
--             opts = {
--               auto_submit = true,
--             },
--           },
--         },
--         {
--           {
--             role = "user",
--             content = "Generate documentation in JSDoc format for a complex JavaScript API client",
--             opts = {
--               auto_submit = true,
--             },
--           },
--         },
--       },
--     },
--   },
-- },
