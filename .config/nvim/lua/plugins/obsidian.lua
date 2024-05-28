return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	event = "VeryLazy",
	-- ft = "markdown",
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
	--   "BufReadPre path/to/my-vault/**.md",
	--   "BufNewFile path/to/my-vault/**.md",
	-- },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "saleenaapatel357",
				path = "/mnt/c/saleenaa357",
			},
		},
		daily_notes = {
			-- Optional, if you keep daily notes in a separate directory.
			folder = "daily_notes",
			-- Optional, if you want to change the date format for the ID of daily notes.
			-- date_format = "%Y-%m-%d",
			-- Optional, if you want to change the date format of the default alias of daily notes.
			-- alias_format = "%B %-d, %Y",
			-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
			-- template = nil
		},
		completion = {
			-- Set to false to disable completion.
			nvim_cmp = true,
			-- Trigger completion at 2 chars.
			min_chars = 2,
		},
		mappings = {
			-- ["fo"] = {
			--   action = function()
			--     return require("obsidian").util.gf_passthrough()
			--   end,
			--   opts = { noremap = false, expr = true, buffer = true },
			-- },
			-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
			-- ["gf"] = {
			-- 	action = function()
			-- 		return require("obsidian").util.gf_passthrough()
			-- 	end,
			-- 	opts = { noremap = false, expr = true, buffer = true },
			-- },
			-- Toggle check-boxes.
			["<leader>ch"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
			-- Smart action depending on context, either follow link or toggle checkbox.
			["<cr>"] = {
				action = function()
					return require("obsidian").util.smart_action()
				end,
				opts = { buffer = true, expr = true },
			},
		},
		-- Where to put new notes. Valid options are
		--  * "current_dir" - put new notes in same directory as the current buffer.
		--  * "notes_subdir" - put new notes in the default notes subdirectory.
		new_notes_location = "current_dir",
		follow_url_func = function(url)
			-- Open the URL in the default web browser.
			vim.fn.jobstart({ "open-cli", url }) -- Mac OS
			-- vim.fn.jobstart({"xdg-open", url})  -- linux
		end,
		-- https://github.com/Vinzent03/obsidian-advanced-uri
		use_advanced_uri = false,
		open_app_foreground = true,
		picker = {
			name = "telescope.nvim",
			mappings = {
				new = "<leader><C-x>",
				insert_link = "<leader><C-l>",
			},
		},
		ui = {
			enable = true, -- set to false to disable all additional syntax features
			update_debounce = 200, -- update delay after a text change (in milliseconds)
			-- Define how various check-boxes are displayed
			checkboxes = {
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
				["x"] = { char = "", hl_group = "ObsidianDone" },
				[">"] = { char = "", hl_group = "ObsidianRightArrow" },
				["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
				-- Replace the above with this if you don't have a patched font:
			},
			-- Use bullet marks for non-checkbox lists.
			bullets = { char = "•", hl_group = "ObsidianBullet" },
			external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
			reference_text = { hl_group = "ObsidianRefText" },
			highlight_text = { hl_group = "ObsidianHighlightText" },
			tags = { hl_group = "ObsidianTag" },
			block_ids = { hl_group = "ObsidianBlockID" },
			hl_groups = {
				-- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
				ObsidianTodo = { bold = true, fg = "#f78c6c" },
				ObsidianDone = { bold = true, fg = "#89ddff" },
				ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
				ObsidianTilde = { bold = true, fg = "#ff5370" },
				ObsidianBullet = { bold = true, fg = "#89ddff" },
				ObsidianRefText = { underline = true, fg = "#c792ea" },
				ObsidianExtLinkIcon = { fg = "#c792ea" },
				ObsidianTag = { italic = true, fg = "#89ddff" },
				ObsidianBlockID = { italic = true, fg = "#89ddff" },
				ObsidianHighlightText = { bg = "#75662e" },
			},
		},
		attachments = {
			img_folder = "assets/imgs",
			img_text_func = function(client, path)
				path = client:vault_relative_path(path) or path
				return string.format("![%s](%s)", path.name, path)
			end,
		},
	},
}
