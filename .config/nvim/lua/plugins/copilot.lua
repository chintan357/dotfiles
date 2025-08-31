-- { "github/copilot.vim" }
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      panel = {
        -- enabled = true,
        enabled = false,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>",
        },
        layout = {
          position = "bottom", -- | top | left | right | bottom |
          ratio = 0.4,
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 75,
        trigger_on_accept = true,
        keymap = {
          accept = "<Tab>",
          accept_line = "<M-l>",
          accept_word = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      -- filetypes = {
      --   yaml = false,
      --   markdown = false,
      --   help = false,
      --   gitcommit = false,
      --   gitrebase = false,
      --   hgcommit = false,
      --   svn = false,
      --   cvs = false,
      --   ["."] = false,
      -- },
      -- copilot_node_command = "node", -- Node.js version must be > 20
      -- workspace_folders = {},
      -- copilot_model = "",
    },
    init = function()
      vim.keymap.set("n", "yoc", function()
        require("copilot.suggestion").toggle_auto_trigger()
      end)

      -- vim.api.create_user_command("Copilot", "Toggle Copilot suggestions", function()
      --   require("copilot.suggestion").toggle_auto_trigger()
      -- end)
    end,
  },

  -- require("copilot.suggestion").toggle_auto_trigger()

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    -- build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
  },
}

--   { "<C-a>", function() require("copilot.suggestion").accept() end, mode = { "i" }, },
--   keys = {
--     { "<C-a>", function() require("copilot.suggestion").accept() end, mode = { "i" }, },
--     { "<C-x>", function() require("copilot.suggestion").dismiss() end, mode = { "i" }, },
--     { "<C-\\>", function() require("copilot.panel").open() end, mode = { "n", "i" }, },
--   },
