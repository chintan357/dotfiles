return {
	"preservim/tagbar",
	config = function()
		vim.keymap.set("n", "yot", ":TagbarToggle<CR>", { noremap = true, silent = true })
	end,
}
