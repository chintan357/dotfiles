local prompts = {
	Explain = "Please explain how the following code works.",
	Review = "Please review the following code and provide suggestions for improvement.",
	Refactor = "Please refactor the following code to improve its clarity and readability.",
	FixCode = "Please fix the following code to make it work as intended.",
	FixError = "Please explain the error in the following text and provide a solution.",
	Documentation = "Please provide documentation for the following code.",
	SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
	BetterNamings = "Please provide better names for the following variables and functions.",
	Tests = "Please explain how the selected code works, then generate unit tests for it.",

	Summarize = "Please summarize the following text.",
	Spelling = "Please correct any grammar and spelling errors in the following text.",
	Wording = "Please improve the grammar and wording of the following text.",
	Concise = "Please rewrite the following text to make it more concise.",
}

return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		event = "VeryLazy",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "github/copilot.vim" },
		},
		keys = {
			{
				"<leader>sc",
				":lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions({selection = require('CopilotChat.select').visual}))<CR>",
				mode = "x",
				desc = "CopilotChat - Prompt actions",
			},
			{
				"<leader>cc",
				function()
					local input = vim.fn.input("Quick Chat: ")
					if input ~= "" then
						vim.cmd("CopilotChatBuffer " .. input)
					end
				end,
				desc = "CopilotChat - Quick chat",
			},
		},

		opts = {
			debug = false, -- Enable debug logging
			model = "gpt-4", -- GPT model to use, 'gpt-3.5-turbo' or 'gpt-4'
			temperature = 0.1, -- GPT temperature
			prompts = prompts,

			show_folds = false,
			show_help = false,
			auto_follow_cursor = true,
			auto_insert_mode = true,
			clear_chat_on_new_prompt = false,
			question_header = "",
			answer_header = "",
			error_header = "",
			separator = " ",

			context = nil, -- Default context to use, 'buffers', 'buffer' or none (can be specified manually in prompt via @).
			history_path = vim.fn.stdpath("data") .. "/copilotchat_history",

			window = {
				layout = "float",
				width = 0.99,
				height = 0.99,
				relative = "editor", -- 'editor', 'win', 'cursor', 'mouse'
				border = "single", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
				title = "🚀",
				footer = nil,
				zindex = 1,
			},

			mappings = {
				complete = {
					detail = "Use @<Tab> or /<Tab> for options.",
					insert = "<Tab>",
				},
				close = {
					normal = "q",
					insert = "<C-c>",
				},
				reset = {
					normal = "<C-l>",
					insert = "<C-l>",
				},
				submit_prompt = {
					normal = "<CR>",
					insert = "<C-CR>",
				},
				accept_diff = {
					normal = "<C-y>",
					insert = "<C-y>",
				},
				yank_diff = {
					normal = "gy",
				},
				show_diff = {
					normal = "gd",
				},
				show_system_prompt = {
					normal = "gp",
				},
				show_user_selection = {
					normal = "gs",
				},
			},
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "copilot-*",
				callback = function()
					vim.opt_local.relativenumber = true
					vim.opt_local.number = true

					-- Get current filetype and set it to markdown if the current filetype is copilot-chat
					local ft = vim.bo.filetype
					if ft == "copilot-chat" then
						vim.bo.filetype = "markdown"
					end
				end,
			})
			require("CopilotChat").setup(opts)
		end,
	},
}
