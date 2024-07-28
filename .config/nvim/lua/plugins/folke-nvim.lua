return {
	{
		"folke/twilight.nvim",
		opts = {
			dimming = {
				alpha = 0.25, -- amount of dimming
				-- we try to get the foreground from the highlight groups or fallback color
				color = { "Normal", "#ffffff" },
				term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
				inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
			},
			context = 10, -- amount of lines we will try to show around the current line
			treesitter = true, -- use treesitter when available for the filetype
			-- treesitter is used to automatically expand the visible text,
			-- but you can further control the types of nodes that should always be fully expanded
			expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
				"function",
				"method",
				"table",
				"if_statement",
			},
			exclude = {}, -- exclude these filetypes
		},
	},
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		-- event = "BufEnter",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true,
  -- stylua: ignore
  keys = {
    { "]T", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
    { "[T", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
    -- { "<leader>tf", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
    -- { "<leader>tF", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
    { "<leader>tt", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    { "<leader>tT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
  },
	},
	-- event = "VimEnter",
	-- opts = { signs = false },
}
