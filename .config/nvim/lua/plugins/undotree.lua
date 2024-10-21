-- keymap("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
-- vim.g.undotree_SetFocusWhenToggle = 0

return {
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		keys = {
			{ "you", "<cmd>UndotreeToggle<cr>" },
			{ "<leader>tu", "<cmd>Telescope undo<cr>" },
		},
		init = function()
			-- Persist undo, refer https://github.com/mbbill/undotree#usage
			local undodir = vim.fn.expand("~/.undo-nvim")

			if vim.fn.has("persistent_undo") == 1 then
				if vim.fn.isdirectory(undodir) == 0 then
					os.execute("mkdir -p " .. undodir)
				end

				vim.opt.undodir = undodir
				vim.opt.undofile = true
			end

			-- set layout style to 2, let g:undotree_WindowLayout = 2
			vim.g.undotree_WindowLayout = 2
		end,
	},
}
