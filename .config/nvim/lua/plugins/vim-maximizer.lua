return {
	"szw/vim-maximizer",
	event = "VeryLazy",
	config = function()
		vim.keymap.set("n", "<leader>vo", ":MaximizerToggle!<CR>", { silent = true, noremap = true })
		vim.g.maximizer_set_default_mapping = 0
	end,
}
