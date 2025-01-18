local is_inside_git_repo = function()
	local git_dir = vim.fn.finddir(".git", vim.fn.expand("%:p:h") .. ";")
	return vim.fn.isdirectory(git_dir) ~= 0
end
-- lazy = not is_inside_git_repo(),

return {
	{
		"tpope/vim-fugitive",
	},
	{ "tpope/vim-rhubarb" },
	{ "junegunn/gv.vim" },
	{
		"akinsho/git-conflict.nvim",
	},
	{
		"sindrets/diffview.nvim",
		cmd = "DiffviewOpen",
		keys = {
			{ "dvo", "<cmd>DiffviewOpen<cr>" },
			{ "dvc", "<cmd>DiffviewClose<cr>" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		-- enabled = false,
		event = "VeryLazy",
		-- opts = {
		-- 	signs = {
		-- 		add = { text = "▎" },
		-- 		change = { text = "▎" },
		-- 		delete = { text = "" },
		-- 		topdelete = { text = "" },
		-- 		changedelete = { text = "▎" },
		-- 		untracked = { text = "▎" },
		-- 	},
		-- },
	},
}
-- {
-- 	"mattn/vim-gist",
-- 	dependencies = {
-- 		"mattn/webapi-vim",
-- 	},
-- },
-- {
-- 	"f-person/git-blame.nvim",
-- 	cmd = "GitBlameToggle",
-- 	opts = {
-- 		enabled = true,
-- 		date_format = "%m/%d/%y %H:%M:%S", -- "%m-%d-%Y %H:%M:%S"
-- 	},
-- },

-- keymap("n", "<leader>gb", ":GitBlameToggle<CR>")
-- map(
--   "n",
--   "<leader>ur",
--   "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
--   { desc = "Redraw / Clear hlsearch / Diff Update" }
-- )
-- vim.keymap.set({ "n" }, "gy", function()
-- 	vim.cmd("GBrowse")
-- end)
