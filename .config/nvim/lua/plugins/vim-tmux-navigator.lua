return {
	"christoomey/vim-tmux-navigator",
	event = "BufEnter",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
		{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
		{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
		{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
		{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
	},
	config = function()
		-- vim.keymap.set("i", "<C-h>", "<esc>:TmuxNavigateLeft<cr>", { noremap = true, silent = true })
		-- vim.keymap.set("i", "<C-j>", "<esc>:TmuxNavigateDown<cr>", { noremap = true, silent = true })
		-- vim.keymap.set("i", "<C-k>", "<esc>:TmuxNavigateUp<cr>", { noremap = true, silent = true })
		-- vim.keymap.set("i", "<C-l>", "<esc>:TmuxNavigateRight<cr>", { noremap = true, silent = true })

		vim.keymap.set("i", "<C-h>", "<C-o>:TmuxNavigateLeft<cr>", { noremap = true, silent = true })
		vim.keymap.set("i", "<C-j>", "<C-o>:TmuxNavigateDown<cr>", { noremap = true, silent = true })
		vim.keymap.set("i", "<C-k>", "<C-o>:TmuxNavigateUp<cr>", { noremap = true, silent = true })
		vim.keymap.set("i", "<C-l>", "<C-o>:TmuxNavigateRight<cr>", { noremap = true, silent = true })

		vim.keymap.set("v", "<C-h>", ":<C-u>TmuxNavigateLeft<cr>gv", { noremap = true, silent = true })
		vim.keymap.set("v", "<C-j>", ":<C-u>TmuxNavigateDown<cr>gv", { noremap = true, silent = true })
		vim.keymap.set("v", "<C-k>", ":<C-u>TmuxNavigateUp<cr>gv", { noremap = true, silent = true })
		vim.keymap.set("v", "<C-l>", ":<C-u>TmuxNavigateRight<cr>gv", { noremap = true, silent = true })

		-- vim.g.tmux_navigator_no_mappings = 1
	end,
}
