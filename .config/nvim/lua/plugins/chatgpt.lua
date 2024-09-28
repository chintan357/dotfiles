return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	enabled = false,
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
		},
		openai_params = {
			model = "gpt-4o",
			frequency_penalty = 0,
			presence_penalty = 0,
			max_tokens = 4096,
			temperature = 0,
			top_p = 1,
			n = 1,
		},
		-- gpt-4-1106-preview
		openai_edit_params = {
			model = "gpt-4o",
			frequency_penalty = 0,
			max_tokens = 4096,
			presence_penalty = 0,
			temperature = 0,
			top_p = 1,
			n = 1,
		},
	},
	config = function(_, opts)
		require("chatgpt").setup(opts)
		vim.keymap.set("n", "<leader>aa", ":ChatGPTActAs<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", ",c", "<cmd>ChatGPT<cr>", { noremap = true, silent = true })
	end,
}
