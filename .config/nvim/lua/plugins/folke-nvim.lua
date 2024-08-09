return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				views = {
					cmdline_popup = {
						position = {
							row = 5,
							col = "50%",
						},
						size = {
							width = 60,
							height = "auto",
						},
					},
				},
				routes = {
					{
						-- view = "notify",
						view = "mini",
						filter = { event = "msg_showmode" },
					},
					{
						filter = {
							event = "msg_show",
							kind = "",
							find = "written",
						},
						opts = { skip = true },
					},
				},
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = false, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = true, -- add a border to hover docs and signature help
				},
				messages = {
					enabled = true, -- enables the Noice messages UI
					view = "mini", -- default view for messages
					view_error = "mini", -- view for errors
					view_warn = "mini", -- view for warnings
					view_history = "messages", -- view for :messages
					view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
				},
				notify = {
					enabled = false,
					view = "notify",
				},
			})
		end,

		keys = {
			{ "<leader>fn", ":Noice", desc = "Noice" },
			{
				"<leader>fh",
				function()
					require("noice").cmd("history")
				end,
				desc = "Noice History",
			},
			{
				"<leader>fa",
				function()
					require("noice").cmd("all")
				end,
				desc = "Noice All",
			},
			{
				"<leader>fd",
				function()
					require("noice").cmd("dismiss")
				end,
				desc = "Dismiss All",
			},
			-- { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
			-- { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
		},
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = { "Trouble" },
		opts = { use_diagnostic_signs = true },
		keys = {
			{
				"yoT",
				":Trouble",
				desc = "Diagnostics (Trouble)",
			},
			-- {
			-- 	"<leader>td",
			-- 	"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			-- 	desc = "Buffer Diagnostics (Trouble)",
			-- },
			-- {
			-- 	"<leader>ts",
			-- 	"<cmd>Trouble symbols toggle focus=false<cr>",
			-- 	desc = "Symbols (Trouble)",
			-- },
			-- {
			-- 	"<leader>tL",
			-- 	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			-- 	desc = "LSP Definitions / references / ... (Trouble)",
			-- },
			{
				"[q",
				function()
					if require("trouble").is_open() then
						require("trouble").previous({ skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cprev)
						if not ok then
							vim.notify(err, vim.log.levels.ERROR)
						end
					end
				end,
				desc = "Previous Trouble/Quickfix Item",
			},
			{
				"]q",
				function()
					if require("trouble").is_open() then
						require("trouble").next({ skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cnext)
						if not ok then
							vim.notify(err, vim.log.levels.ERROR)
						end
					end
				end,
				desc = "Next Trouble/Quickfix Item",
			},
		},
	},
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
