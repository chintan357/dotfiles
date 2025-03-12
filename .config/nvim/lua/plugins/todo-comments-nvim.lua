return {
  "folke/todo-comments.nvim",
  -- cmd = { "TodoTrouble", "TodoTelescope" },
  event = "VeryLazy", -- "VimEnter",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = { signs = false },
  config = true,
  -- stylua: ignore
  keys = {
    -- { "]T", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
    -- { "[T", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
    -- { "<leader>tf", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
    -- { "<leader>tF", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
    -- { "<leader>tt", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    -- { "<leader>tT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
  },
}
