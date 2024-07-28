return {
	"olimorris/codecompanion.nvim",
	config = function()
		require("codecompanion").setup({
			adapters = {
				-- anthropic = require("codecompanion.adapters").use("anthropic", {
				-- 	env = {
				-- 		api_key = "cmd:op read op://personal/Anthropic_API/credential --no-newline",
				-- 	},
				-- }),
				openai = require("codecompanion.adapters").use("openai", {
					env = {
						api_key = "cmd:op read op://personal/OpenAI_API/credential --no-newline",
					},
				}),
				-- llama3 = require("codecompanion.adapters").use("ollama", {
				-- 	schema = {
				-- 		model = {
				-- 			default = "llama3:latest",
				-- 		},
				-- 		num_ctx = {
				-- 			default = 16384,
				-- 		},
				-- 		num_predict = {
				-- 			default = -1,
				-- 		},
				-- 	},
				-- }),
			},
			strategies = {
				-- chat = { adapter = "anthropic" },
				-- inline = { adapter = "anthropic" },
				-- agent = { adapter = "anthropic" },
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
	keys = {
		{
			"<C-a>",
			"<cmd>CodeCompanionActions<CR>",
			description = "Open the CodeCompanion action picker",
			mode = { "n", "v" },
		},
		{
			"<LocalLeader>a",
			"<cmd>CodeCompanionToggle<CR>",
			description = "Open CodeCompanion chat prompt",
			mode = { "n", "v" },
		},
		{
			"ga",
			"<cmd>CodeCompanionAdd<CR>",
			description = "Add selected text to CodeCompanion",
			mode = { "n", "v" },
		},
	},

	init = function()
		vim.cmd([[cab cc CodeCompanion]])
	end,
}
