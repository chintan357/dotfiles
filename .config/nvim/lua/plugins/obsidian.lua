-- keymap("n", "<leader>oc", "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>", { desc = "Obsidian Check Checkbox" })
-- keymap("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "Insert Obsidian Template" })
-- keymap("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "Open in Obsidian App" })
-- keymap("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Show ObsidianBacklinks" })
-- keymap("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "Show ObsidianLinks" })
-- keymap("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Create New Note" })
-- keymap("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search Obsidian" })
-- keymap("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Quick Switch" })
-- keymap("n", "gf", function()
-- 	if require("obsidian").util.cursor_on_markdown_link() then
-- 		return "<cmd>ObsidianFollowLink<CR>"
-- 	else
-- 		return "gf"
-- 	end
-- end, { noremap = false, expr = true })

return {
	"epwalsh/obsidian.nvim",
	enabled = false,
	version = "*",
	lazy = true,
	event = "VeryLazy",
	ft = "markdown",
	-- event = {
	-- "BufReadPre " .. vim.fn.expand("~") .. "/vaults/**.md",
	--   "BufReadPre path/to/my-vault/**.md",
	--   "BufNewFile path/to/my-vault/**.md",
	-- },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "nsal",
				path = "~/vaults/nsal",
				-- overrides = {
				-- 	notes_subdir = "notes",
				-- },
			},
		},
		-- Alternatively - and for backwards compatibility - you can set 'dir' to a single path instead of
		-- 'workspaces'. For example:
		-- dir = "~/vaults/work",

		-- Optional, if you keep notes in a specific subdirectory of your vault.
		-- notes_subdir = "notes",

		daily_notes = {
			-- Optional, if you keep daily notes in a separate directory.
			folder = "daily_notes",
			-- date_format = "%Y-%m-%d",
			-- Optional, if you want to change the date format of the default alias of daily notes.
			-- alias_format = "%B %-d, %Y",
			-- default_tags = { "daily-notes" },
			-- template = nil
		},
		completion = {
			nvim_cmp = true,
			min_chars = 2,
		},
		mappings = {
			["fo"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			["gf"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			["<leader>ch"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
			["<cr>"] = {
				action = function()
					return require("obsidian").util.smart_action()
				end,
				opts = { buffer = true, expr = true },
			},
		},
		new_notes_location = "current_dir",
		disable_frontmatter = true,
	},
}
