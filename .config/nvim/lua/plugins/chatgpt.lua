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
		yank_register = "+",
		edit_with_instructions = {
			diff = false,
		},
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
				width = "30%",
				width_settings_open = "50%",
			},
		},
		popup_window = {
			border = {
				highlight = "FloatBorder",
				style = "rounded",
				text = {
					top = "Atomic",
				},
			},
			win_options = {
				wrap = true,
				linebreak = true,
				foldcolumn = "1",
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
			},
			buf_options = {
				filetype = "markdown",
			},
		},
		system_window = {
			border = {
				highlight = "FloatBorder",
				style = "rounded",
				text = {
					top = " SYSTEM ",
				},
			},
			win_options = {
				wrap = true,
				linebreak = true,
				foldcolumn = "2",
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
			},
		},
		popup_input = {
			prompt = "  ",
			border = {
				highlight = "FloatBorder",
				style = "rounded",
				text = {
					top_align = "center",
					top = " Prompt ",
				},
			},
			win_options = {
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
			},
			submit = "<C-CR>",
			submit_n = "<CR>",
			max_visible_lines = 20,
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
		actions_paths = {},
		show_quickfixes_cmd = "Trouble quickfix",
		predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/f/awesome-chatgpt-prompts/main/prompts.csv",
		highlights = {
			help_key = "@symbol",
			help_description = "@comment",
		},
		noremap = true,
		silent = true,
	},
}
