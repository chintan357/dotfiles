return {
	"jpalardy/vim-slime",
	init = function()
		vim.g.slime_target = "tmux"
		vim.g.slime_no_mappings = 1
		vim.g.slime_paste_file = vim.fn.expand("$HOME/.slime_paste")
		vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
		vim.g.slime_dont_ask_default = true
		vim.g.slime_bracketed_paste = 1
		vim.g.slime_cell_delimiter = "#%%"
		-- vim.g.slime_python_ipython = true
	end,
	config = function()
		-- vim.keymap.set("n", "<leader>am", "<Plug>SlimeMotionSend<cr>", { remap = true, silent = false })
		vim.keymap.set("n", "<leader>slc", "<Plug>SlimeConfig<cr>", { remap = true, silent = false })
		vim.keymap.set("n", "<leader>ac", "<Plug>SlimeSendCell<cr>", { remap = true, silent = false })
		-- vim.keymap.set("n", "<leader>al", "<Plug>SlimeLineSend", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>ap", "<Plug>SlimeParagraphSend", { noremap = true, silent = true })
		vim.keymap.set({ "x", "v" }, "<leader>s", "ma<Plug>SlimeRegionSend<cr>`a", { noremap = true, silent = true })
	end,
}
