return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		vim.keymap.set("n", "<M-o>", "<cmd>Oil<CR>", { silent = true, noremap = true })
		require("oil").setup({
			default_file_explorer = true,
			-- See :help oil-columns
			float = {
				border = "none",
			},
			columns = {
				"icon",
				-- "permissions",
				-- "size",
				-- "mtime",
			},
			buf_options = {
				buflisted = false,
				bufhidden = "hide",
			},
			win_options = {
				wrap = false,
				signcolumn = "no",
				cursorcolumn = false,
				foldcolumn = "0",
				spell = false,
				list = false,
				conceallevel = 3,
				concealcursor = "nvic",
			},
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			prompt_save_on_select_new_entry = false,
			cleanup_delay_ms = 2000,
			lsp_file_methods = {
				timeout_ms = 1000,
				autosave_changes = false,
			},
			constrain_cursor = "editable",
			watch_for_changes = false,
			keymaps = {
				["g?"] = "actions.show_help",
				["l"] = "actions.select",
				["h"] = "actions.parent",
				["<C-s>"] = { "actions.select", opts = { vertical = true } },
				["<C-x>"] = { "actions.select", opts = { horizontal = true } },
				["<C-t>"] = { "actions.select", opts = { tab = true } },
				["<C-p>"] = "actions.preview",
				["q"] = "actions.close",
				-- ["<C-l>"] = "actions.refresh",
				-- ["<M-h>"] = "actions.select_split",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
				["q"] = "actions.close",
				["gd"] = {
					desc = "Toggle detail view",
					callback = function()
						local oil = require("oil")
						local config = require("oil.config")
						if #config.columns == 1 then
							oil.set_columns({ "icon", "permissions", "size", "mtime" })
						else
							oil.set_columns({ "icon" })
						end
					end,
				},
				[">"] = "actions.toggle_hidden",
				["<C-y>"] = "actions.copy_entry_path",
				["g\\"] = "actions.toggle_trash",
				["<C-c>"] = false,
				["<C-h>"] = false,
				["<C-l>"] = false,
			},
			view_options = {
				show_hidden = true,
				is_hidden_file = function(name, bufnr)
					return vim.startswith(name, ".")
				end,
				is_always_hidden = function(name, bufnr)
					return name == ".."
					-- return false
				end,
				natural_order = true,
				case_insensitive = true,

				sort = {
					{ "type", "asc" },
					{ "name", "asc" },
				},
			},
		})
	end,
}
