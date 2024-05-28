return {
	"folke/todo-comments.nvim",
	cmd = { "TodoTrouble", "TodoTelescope" },
	event = "VeryLazy",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = true,
  -- stylua: ignore
  keys = {
    -- { "]T", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
    -- { "[T", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
    -- { "<leader>tf", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
    -- { "<leader>tF", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
    { "<leader>tt", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    { "<leader>tT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
  },
}
-- event = "VimEnter",
-- opts = { signs = false },
