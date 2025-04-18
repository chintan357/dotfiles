return {
  "folke/todo-comments.nvim",
  cmd = { "TodoTrouble", "TodoTelescope" },
  event = "VeryLazy", -- "VimEnter",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = { signs = false },
  config = true,
  -- stylua: ignore
  keys = {
    { "]t",         function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
    { "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
    { "<leader>tt", "<cmd>TodoTelescope<cr>",                            desc = "Todo" },
    { "<leader>tT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",    desc = "Todo/Fix/Fixme" },
    -- { "<leader>xt", "<cmd>Trouble todo toggle<cr>",                                   desc = "Todo (Trouble)" },
    -- { "<leader>xT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
    -- { "<leader>st", "<cmd>TodoTelescope<cr>",                                         desc = "Todo" },
    -- { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",                 desc = "Todo/Fix/Fixme" },
    -- { "]T", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
    -- { "[T", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
    -- { "<leader>tf", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
    -- { "<leader>tF", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
  },
}
