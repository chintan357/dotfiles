return {
	"olimorris/codecompanion.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim", -- Optional
		{
			"stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
			opts = {},
		},
	},
	config = function()
		require("codecompanion").setup({
			adapters = {
				openai = require("codecompanion.adapters").use("openai", {
					env = {
						-- api_key = "cmd:op read op://personal/OpenAI_API/credential --no-newline",
						api_key = "cmd:head -1 $HOME/private/oanvim",
					},
				}),
			},
			strategies = {
				chat = { adapter = "openai" },
				inline = { adapter = "openai" },
				agent = { adapter = "openai" },
			},
			display = {
				chat = {
					window = {
						layout = "vertical", -- float|vertical|horizontal|buffer
					},
				},
				inline = {
					diff = {
						hl_groups = {
							added = "DiffAdd",
						},
					},
				},
			},
			opts = {
				log_level = "DEBUG",
			},
		})
	end,
	-- keys = {
	-- {
	-- 	"<C-a>",
	-- 	"<cmd>CodeCompanionActions<CR>",
	-- 	description = "Open the CodeCompanion action picker",
	-- 	mode = { "n", "v" },
	-- },
	-- {
	-- 	"<LocalLeader>a",
	-- 	"<cmd>CodeCompanionToggle<CR>",
	-- 	description = "Open CodeCompanion chat prompt",
	-- 	mode = { "n", "v" },
	-- },
	-- {
	-- 	"ga",
	-- 	"<cmd>CodeCompanionAdd<CR>",
	-- 	description = "Add selected text to CodeCompanion",
	-- 	mode = { "n", "v" },
	-- },
	-- },

	init = function()
		-- vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
		-- vim.api.nvim_set_keymap("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap(
			"n",
			"<LocalLeader>a",
			"<cmd>CodeCompanionToggle<cr>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"v",
			"<LocalLeader>a",
			"<cmd>CodeCompanionToggle<cr>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap("v", "ga", "<cmd>CodeCompanionAdd<cr>", { noremap = true, silent = true })

		-- Expand 'cc' into 'CodeCompanion' in the command line
		vim.cmd([[cab cc CodeCompanion]])
	end,
}
