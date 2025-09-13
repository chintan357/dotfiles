-- Auto-command to customize chat buffer behavior
-- vim.api.nvim_create_autocmd('BufEnter', {
--   pattern = 'copilot-*',
--   callback = function()
--     vim.opt_local.relativenumber = false
--     vim.opt_local.number = false
--     vim.opt_local.conceallevel = 0
--   end,
-- })

return {
  "olimorris/codecompanion.nvim",
  cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions", "CodeCompanionCmd" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "j-hui/fidget.nvim", -- Display status
    "nvim-treesitter/nvim-treesitter",
    -- "ravitemer/codecompanion-history.nvim", -- Save and load conversation history
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
  init = function()
    vim.cmd([[cab cc CodeCompanion]])
  end,
  config = function()
    require("codecompanion").setup({
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
            show_result_in_chat = true,
          },
        },
      },
      strategies = {
        chat = {
          adapter = {
            name = "copilot",
            model = "gpt-4o",
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
          keymaps = {
            send = {
              modes = {
                i = { "<C-CR>", "<C-s>" },
              },
            },
            completion = {
              modes = {
                i = "<C-x>",
              },
            },
          },
          slash_commands = {
            ["buffer"] = {
              keymaps = {
                modes = {
                  i = "<C-b>",
                },
              },
            },
            ["fetch"] = {
              keymaps = {
                modes = {
                  i = "<C-f>",
                },
              },
            },
            ["help"] = {
              opts = {
                max_lines = 1000,
              },
            },
            ["image"] = {
              keymaps = {
                modes = {
                  i = "<C-i>",
                },
              },
              opts = {
                dirs = { "~/Documents/Screenshots" },
              },
            },
          },
        },
        inline = {
          adapter = "copilot",
        },
        cmd = {
          adapter = "copilot",
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
      adapters = {
        http = {
          opts = {
            show_model_choices = false,
            show_defaults = false,
          },
          gemini = function()
            return require("codecompanion.adapters").extend("gemini", {
              env = {
                api_key = "cmd:cat ~/private/gemini-nvim",
              },
              schema = {
                model = {
                  default = "gemini-2.5-flash",
                  temperature = 0.1,
                },
                reasoning_effort = "none",
              },
            })
          end,
          -- tavily = function()
          --   return require("codecompanion.adapters").extend("tavily", {
          --     env = {
          --       api_key = "cmd:op read op://personal/Tavily_API/credential --no-newline",
          --     },
          --   })
          -- end,
        },
      },
    })

    vim.cmd([[cab cc CodeCompanion]])
  end,
}

-- vim.api.nvim_set_keymap({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
-- vim.keymap.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
-- vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

--     opts = {
--       prompt_library = {
--         ["Maths tutor"] = {
--           strategy = "chat",
--           description = "Chat with your personal maths tutor",
--           opts = {
--             index = 4,
--             ignore_system_prompt = true,
--             intro_message = "Welcome to your lesson! How may I help you today? ",
--           },
--           prompts = {
--             {
--               role = "system",
--               content = [[You are a helpful maths tutor.
-- You explain concepts, solve problems, and provide step-by-step solutions for maths.
-- The user has an MPhys in Physics, is knowledgeable in maths but out of practice, and is an experienced programmer.
-- Relate maths concepts to programming where possible.
--
-- When responding, use this structure:
-- 1. Brief explanation of the topic
-- 2. Definition
-- 3. Simple example and a more complex example
-- 4. Programming analogy or Python example
-- 5. Summary of the topic
-- 6. Question to check user understanding
--
-- You must:
-- - Use only H3 headings and above for section separation
-- - Show your work and explain each step clearly
-- - Relate maths concepts to programming terms where applicable
-- - Use inline LaTeX for equations between $ signs (e.g., $y$)
-- - Use block LaTeX for standalone equations between $$ signs (e.g., $$y$$)
-- - Format all mathematical explanations and solutions in LaTeX code blocks (triple backticks with 'latex') for direct use in TeX files
-- - Use Python for coding examples (triple backticks with 'python')
-- - Make answers concise for easy transfer to Notion and Anki
-- - End with a flashcard-ready summary or question
--
-- If the user requests only part of the structure, respond accordingly.]],
--             },
--           },
--         },
--         ["Test workflow"] = {
--           strategy = "workflow",
--           description = "Use a workflow to test the plugin",
--           opts = {
--             index = 4,
--           },
--           prompts = {
--             {
--               {
--                 role = "user",
--                 content = "Generate a Python class for managing a book library with methods for adding, removing, and searching books",
--                 opts = {
--                   auto_submit = false,
--                 },
--               },
--             },
--             {
--               {
--                 role = "user",
--                 content = "Write unit tests for the library class you just created",
--                 opts = {
--                   auto_submit = true,
--                 },
--               },
--             },
--             {
--               {
--                 role = "user",
--                 content = "Create a TypeScript interface for a complex e-commerce shopping cart system",
--                 opts = {
--                   auto_submit = true,
--                 },
--               },
--             },
--             {
--               {
--                 role = "user",
--                 content = "Write a recursive algorithm to balance a binary search tree in Java",
--                 opts = {
--                   auto_submit = true,
--                 },
--               },
--             },
--             {
--               {
--                 role = "user",
--                 content = "Generate a comprehensive regex pattern to validate email addresses with explanations",
--                 opts = {
--                   auto_submit = true,
--                 },
--               },
--             },
--             {
--               {
--                 role = "user",
--                 content = "Create a Rust struct and implementation for a thread-safe message queue",
--                 opts = {
--                   auto_submit = true,
--                 },
--               },
--             },
--             {
--               {
--                 role = "user",
--                 content = "Write a GitHub Actions workflow file for CI/CD with multiple stages",
--                 opts = {
--                   auto_submit = true,
--                 },
--               },
--             },
--             {
--               {
--                 role = "user",
--                 content = "Create SQL queries for a complex database schema with joins across 4 tables",
--                 opts = {
--                   auto_submit = true,
--                 },
--               },
--             },
--             {
--               {
--                 role = "user",
--                 content = "Write a Lua configuration for Neovim with custom keybindings and plugins",
--                 opts = {
--                   auto_submit = true,
--                 },
--               },
--             },
--             {
--               {
--                 role = "user",
--                 content = "Generate documentation in JSDoc format for a complex JavaScript API client",
--                 opts = {
--                   auto_submit = true,
--                 },
--               },
--             },
--           },
--         },
--       },
--     },
