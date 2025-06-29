return {
  -- { "github/copilot.vim" },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter", -- "BufReadPost"
    -- keys = {
    --   {
    --     "<C-a>",
    --     function() require("copilot.suggestion").accept() end,
    --     desc = "Copilot: Accept suggestion",
    --     mode = { "i" },
    --   },
    --   {
    --     "<C-x>",
    --     function() require("copilot.suggestion").dismiss() end,
    --     desc = "Copilot: Dismiss suggestion",
    --     mode = { "i" },
    --   },
    --   {
    --     "<C-\\>",
    --     function() require("copilot.panel").open() end,
    --     desc = "Copilot: Show panel",
    --     mode = { "n", "i" },
    --   },
    -- },
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        -- hide_during_completion = true,
        keymap = {
          accept = false, -- handled by nvim-cmp / blink.cmp
          next = "<M-]>",
          prev = "<M-[>",
          -- accept_word = "<C-l>",
          -- accept_line = "<C-j>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",                          -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}


-- init = function()
-- vim.api.create_user_command("Copilot", "Toggle Copilot suggestions", function()
--   require("copilot.suggestion").toggle_auto_trigger()
-- end)
-- end,
