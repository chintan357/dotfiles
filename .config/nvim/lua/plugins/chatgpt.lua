return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		api_key_cmd = "head -1 $HOME/private/oanvim",
		chat = {
			welcome_message = "",
			loading_text = "Loading ...",
			question_sign = "Q:",
			answer_sign = "A:",
			max_line_length = 120,
		},
		popup_layout = {
			default = "center",
			center = {
				width = "99%",
				height = "99%",
			},
			right = {
				width = "45%",
				width_settings_open = "60%",
			},
		},
		popup_window = {
			border = {
				text = {
					top = "Atomic",
				},
			},
		},
		openai_params = {
			model = "gpt-4o-2024-05-13",
			frequency_penalty = 0,
			presence_penalty = 0,
			max_tokens = 4096,
			temperature = 0,
			top_p = 1,
			n = 1,
		},
		openai_edit_params = {
			model = "gpt-4o-2024-05-13",
			frequency_penalty = 0,
			max_tokens = 4096,
			presence_penalty = 0,
			temperature = 0,
			top_p = 1,
			n = 1,
		},
		use_openai_functions_for_edits = false,
		predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/f/awesome-chatgpt-prompts/main/prompts.csv",
	},
	config = function(_, opts)
		require("chatgpt").setup(opts)
		vim.keymap.set("n", "<leader>aa", ":ChatGPTActAs<CR>", { noremap = true, silent = true })
	end,
}
