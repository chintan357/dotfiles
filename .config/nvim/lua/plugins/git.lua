local is_inside_git_repo = function()
	local git_dir = vim.fn.finddir(".git", vim.fn.expand("%:p:h") .. ";")
	return vim.fn.isdirectory(git_dir) ~= 0
end

return {
	{
		"mattn/vim-gist",
		enabled = false,
		dependencies = {
			"mattn/webapi-vim",
		},
	},
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "yof", vim.cmd.Git, { desc = "Open Fugitive Panel" })
			-- vim.keymap.set({ "n" }, "gy", function()
			-- 	vim.cmd("GBrowse")
			-- end)
		end,
	},
	{ "tpope/vim-rhubarb" },
	{ "junegunn/gv.vim" },
	{
		"f-person/git-blame.nvim",
		cmd = "GitBlameToggle",
		keys = {
			-- { "", "<cmd>GitBlameToggle<cr>" },
		},
		opts = {
			enabled = true,
			date_format = "%m/%d/%y %H:%M:%S", -- "%m-%d-%Y %H:%M:%S"
		},
	},
	{
		"akinsho/git-conflict.nvim",
		opts = {
			highlights = {
				incoming = "DiffAdd",
				current = "DiffText",
			},
		},
		lazy = not is_inside_git_repo(),
		keys = {
			-- Navigate conflicts
			-- { "", "<cmd>GitConflictListQf<cr>", desc = "Git Conflict Quicklist" },
		},
	},
	{
		"sindrets/diffview.nvim",
		lazy = not is_inside_git_repo(),
		cmd = "DiffviewOpen",
		keys = {
			{ "dvo", "<cmd>DiffviewOpen<cr>" },
			{ "dvc", "<cmd>DiffviewClose<cr>" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		enabled = false,
		event = "VeryLazy",
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				-- map("n", "]c", function()
				-- 	if vim.wo.diff then
				-- 		vim.cmd.normal({ "]c", bang = true })
				-- 	else
				-- 		gitsigns.nav_hunk("next")
				-- 	end
				-- end)
				--
				-- map("n", "[c", function()
				-- 	if vim.wo.diff then
				-- 		vim.cmd.normal({ "[c", bang = true })
				-- 	else
				-- 		gitsigns.nav_hunk("prev")
				-- 	end
				-- end)

				-- Actions
				-- map("n", "<leader>hs", gitsigns.stage_hunk)
				-- map("n", "<leader>hr", gitsigns.reset_hunk)
				-- map("v", "<leader>hs", function()
				-- 	gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				-- end)
				-- map("v", "<leader>hr", function()
				-- 	gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				-- end)
				-- map("n", "<leader>hS", gitsigns.stage_buffer)
				-- map("n", "<leader>hu", gitsigns.undo_stage_hunk)
				-- map("n", "<leader>hR", gitsigns.reset_buffer)
				-- map("n", "<leader>hp", gitsigns.preview_hunk)
				-- map("n", "<leader>hb", function()
				-- 	gitsigns.blame_line({ full = true })
				-- end)
				-- map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
				-- map("n", "<leader>hd", gitsigns.diffthis)
				-- map("n", "<leader>hD", function()
				-- 	gitsigns.diffthis("~")
				-- end)
				-- map("n", "<leader>td", gitsigns.toggle_deleted)

				-- Text object
				-- map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
			end,
		},
	},
}

-- :GV to open commit browser You can pass git log options to the command, e.g. :GV -S foobar -- plugins.
-- :GV! will only list commits that affected the current file
-- :GV? fills the location list with the revisions of the current file
-- :GV or :GV? can be used in visual mode to track the changes in the selected lines.

-- o or <cr> on a commit to display the content of it
-- o or <cr> on commits to display the diff in the range
-- O opens a new tab instead
-- gb for :GBrowse
-- ]] and [[ to move between commits
-- . to start command-line with :Git [CURSOR] SHA à la fugitive
-- q or gq to close
