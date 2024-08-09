return {
	"szw/vim-maximizer",
	event = "VeryLazy",
	config = function()
		vim.g.maximizer_set_mapping_with_bang = 0
		vim.g.maximizer_set_default_mapping = 0

		vim.keymap.set("n", "<leader>vo", ":MaximizerToggle<CR>", { silent = true, noremap = true })
		vim.keymap.set("v", "<leader>vo", ":MaximizerToggle<CR>gv", { silent = true, noremap = true })

		-- inoremap <silent><F3> <C-o>:MaximizerToggle<CR>
	end,
}
