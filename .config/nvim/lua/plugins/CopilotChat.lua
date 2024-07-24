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
			-- {
			-- 	"<leader>ah",
			-- 	function()
			-- 		local actions = require("CopilotChat.actions")
			-- 		require("CopilotChat.integrations.telescope").pick(actions.help_actions())
			-- 	end,
			-- 	desc = "CopilotChat - Help actions",
			-- },
			{
				"<leader>ap",
				function()
					local actions = require("CopilotChat.actions")
					require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
				end,
				desc = "CopilotChat - Prompt actions",
			},
			{ "<leader>af", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix Diagnostic" },
			{ "<leader>cl", "<cmd>CopilotChatReset<cr>", desc = "CopilotChat - Clear buffer and chat history" },
			{ "<leader>cv", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
			{
				"<leader>av",
				":CopilotChatVisual",
				mode = "x",
				desc = "CopilotChat - Open in vertical split",
			},
			{
				"<leader>ax",
				":CopilotChatInline<cr>",
				mode = "x",
				desc = "CopilotChat - Inline chat",
			},
		},

		opts = {
			prompts = prompts,

			show_help = false,
			auto_follow_cursor = false,
			auto_insert_mode = true,

			question_header = "## Q: ", -- Header to use for user questions
			answer_header = "## A: ", -- Header to use for AI answers
			error_header = "## E: ", -- Header to use for errors
			separator = "───", -- Separator to use in chat

			context = nil, -- Default context to use, 'buffers', 'buffer' or none (can be specified manually in prompt via @).
			history_path = vim.fn.stdpath("data") .. "/copilotchat_history",

			mappings = {
				reset = {
					normal = "<C-n>",
					insert = "<C-n>",
				},
				submit_prompt = {
					normal = "<CR>",
					insert = "<C-CR>",
				},
			},
		},
		config = function(_, opts)
			require("CopilotChat.integrations.cmp").setup()
			local chat = require("CopilotChat")
			local select = require("CopilotChat.select")
			opts.selection = select.unnamed

			opts.prompts.Commit = {
				prompt = "Write commit message for the change with commitizen convention",
				selection = select.gitdiff,
			}
			opts.prompts.CommitStaged = {
				prompt = "Write commit message for the change with commitizen convention",
				selection = function(source)
					return select.gitdiff(source, true)
				end,
			}

			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "copilot-*",
				callback = function()
					vim.opt_local.relativenumber = true
					vim.opt_local.number = true

					local ft = vim.bo.filetype
					if ft == "copilot-chat" then
						vim.bo.filetype = "markdown"
					end
				end,
			})
			chat.setup(opts)

			vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
				chat.ask(args.args, { selection = select.visual })
			end, { nargs = "*", range = true })

			vim.api.nvim_create_user_command("CopilotChatInline", function(args)
				chat.ask(args.args, {
					selection = select.visual,
					window = {
						layout = "float",
						relative = "cursor",
						width = 1,
						height = 0.4,
						row = 1,
					},
				})
			end, { nargs = "*", range = true })

			vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
				chat.ask(args.args, { selection = select.buffer })
			end, { nargs = "*", range = true })
		end,
	},
}
