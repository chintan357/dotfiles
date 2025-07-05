-- { "github/copilot.vim" }
return {
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   -- event = "InsertEnter",
  --   event = "BufReadPost",
  --   -- build = ":Copilot auth",
  --   opts = {
  --     suggestion = {
  --       auto_trigger = true,
  --       keymap = {
  --         accept = "<Tab>",
  --         accept_line = "<M-l>",
  --       },
  --     },
  --   },
  --   config = function(_, opts)
  --     require("copilot").setup(opts)
  --   end,
  -- },
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   dependencies = {
  --     { "zbirenbaum/copilot.lua" },
  --     { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
  --   },
  --   build = "make tiktoken",                          -- Only on MacOS or Linux
  --   opts = {
  --     -- See Configuration section for options
  --   },
  --   -- See Commands section for default commands if you want to lazy load on them
  -- },
}


-- init = function()
-- vim.api.create_user_command("Copilot", "Toggle Copilot suggestions", function()
--   require("copilot.suggestion").toggle_auto_trigger()
-- end)
-- end,

--   {
--     "<C-a>",
--     function() require("copilot.suggestion").accept() end,
--     mode = { "i" },
--   },
--
-- require("copilot.suggestion").toggle_auto_trigger()
