return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	lazy = true,
	branch = "0.1.x",
	dependencies = {
		-- "nvim-telescope/telescope-smart-history.nvim",
		-- "kkharji/sqlite.lua",
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		-- {
		-- 	"nvim-telescope/telescope-frecency.nvim", -- Get frequently opened files
		-- 	config = function()
		-- 		require("telescope").load_extension("frecency")
		-- 	end,
		-- },
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		"debugloop/telescope-undo.nvim",
		"jvgrootveld/telescope-zoxide",
		-- "folke/trouble.nvim",
	},
	config = function()
		local actions = require("telescope.actions")
		local action_layout = require("telescope.actions.layout")
		local action_state = require("telescope.actions.state")
		local builtin = require("telescope.builtin")
		-- local open_with_trouble = require("trouble.sources.telescope").open

		-- Use this to add more results without clearing the trouble list
		-- local add_to_trouble = require("trouble.sources.telescope").add

		local keymap = vim.keymap

		local vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--trim",
		}

		table.insert(vimgrep_arguments, "--hidden")
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!**/.git/*")

		local is_inside_work_tree = {}
		local project_files = function()
			local opts = {} -- define here if you want to define something

			local cwd = vim.fn.getcwd()
			if is_inside_work_tree[cwd] == nil then
				vim.fn.system("git rev-parse --is-inside-work-tree")
				is_inside_work_tree[cwd] = vim.v.shell_error == 0
			end

			if is_inside_work_tree[cwd] then
				builtin.git_files(opts)
			else
				builtin.find_files(opts)
			end
		end
		vim.keymap.set("n", "<leader><Space>", project_files)
		vim.keymap.set("n", "<leader>cd", require("telescope").extensions.zoxide.list)

		-- vim.keymap.set('n', '<leader>.', function() builtin.find_files({ cwd = vim.fn.expand('%:p:h') }) end)

		require("telescope").setup({
			defaults = {
				prompt_prefix = "  ",
				entry_prefix = "  ",
				color_devicons = true,
				path_display = { "smart" },
				dynamic_preview_title = true,
				selection_caret = "  ",
				preview = {
					filesize_limit = 0.1, --MB
				},
				wrap_results = true,
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				-- selection_strategy = "reset",
				winblend = 0,
				vimgrep_arguments = vimgrep_arguments,
				-- Searching
				set_env = { COLORTERM = "truecolor" },
				file_ignore_patterns = {
					".git/",
					"%.jpg",
					"%.jpeg",
					"%.png",
					"%.svg",
					"%.otf",
					"%.ttf",
					"__pycache__",
					"%.sqlite3",
					"%.ipynb",
					"node_modules",
				},
				file_sorter = require("telescope.sorters").get_fuzzy_file,
			},
			pickers = {
				diagnostics = {
					theme = "ivy",
					initial_mode = "normal",
					layout_config = {
						preview_cutoff = 9999,
					},
				},
				find_files = {
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
					mappings = {
						n = {
							["cd"] = function(prompt_bufnr)
								local selection = require("telescope.actions.state").get_selected_entry()
								local dir = vim.fn.fnamemodify(selection.path, ":p:h")
								require("telescope.actions").close(prompt_bufnr)
								-- Depending on what you want put `cd`, `lcd`, `tcd`
								vim.cmd(string.format("silent lcd %s", dir))
							end,
						},
					},
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				frecency = {
					show_scores = false,
					show_unindexed = false,
					ignore_patterns = {
						"*.git/*",
						"*/tmp/*",
						"*/node_modules/*",
						"*/vendor/*",
					},
					-- workspaces = {
					--   ["nvim"] = os.getenv("HOME_DIR") .. ".config/nvim",
					--   ["dots"] = os.getenv("HOME_DIR") .. ".dotfiles",
					--   ["project"] = os.getenv("PROJECT_DIR"),
					-- },
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
				undo = {
					mappings = {
						i = {
							["<CR>"] = require("telescope-undo.actions").restore,
							["<C-a>"] = require("telescope-undo.actions").yank_additions,
							["<C-d>"] = require("telescope-undo.actions").yank_deletions,
						},
					},
					use_delta = true,
					side_by_side = false,
				},
				zoxide = {},
				-- history = {
				-- 	path = vim.fs.joinpath(data, "telescope_history.sqlite3"),
				-- 	limit = 100,
				-- },
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
		require("telescope").load_extension("undo")
		require("telescope").load_extension("zoxide")

    -- pcall(require("telescope").load_extension, "smart_history")
    -- require("telescope").load_extension("refactoring")
    -- telescope.load_extension("persisted")

    -- keymap.set(
    -- 	"n",
    -- 	"<Leader><Leader>",
    -- 	"<cmd>lua require('telescope').extensions.frecency.frecency({ prompt_title = 'Recent Files', workspace = 'CWD', path_display = { 'smart' } })<CR>",
    -- 	{ desc = "Recent Files" }
    -- )

    -- stylua: ignore start
    keymap.set("n", "<leader>sk", builtin.keymaps)
    keymap.set("n", "<leader>sh", builtin.help_tags)

    keymap.set("n", "<leader>s:", builtin.command_history)
    keymap.set("n", '<leader>s"', builtin.registers)
    keymap.set("n", "<leader>sa", builtin.autocommands)
    keymap.set("n", "<leader>sm", builtin.marks)

    keymap.set("n", "<leader>sf", function() builtin.find_files({ hidden = true }) end)
    keymap.set("n", "<leader>sF", function() builtin.find_files({ cwd = vim.fn.expand("~") }) end)
    keymap.set("n", "<leader>sr", builtin.oldfiles)
    keymap.set("n", "<leader>sc", function() builtin.find_files({ cwd = vim.fn.stdpath("config") }) end)
    keymap.set("n", "<leader>sb", function() builtin.buffers({ path_display = { "smart" }, sort_mru = true, sort_lastused = true }) end)
    keymap.set("n", "<C-p>", function() builtin.buffers({ path_display = { "smart" }, sort_mru = true, sort_lastused = true }) end)

    keymap.set("n", "<leader>sq", builtin.quickfix)

    keymap.set("n", "<leader>hf", builtin.git_files)
    keymap.set("n", "<leader>hc", builtin.git_commits)
    keymap.set("n", "<leader>hs", builtin.git_status)

    keymap.set("n", "<leader>ic", require("telescope.builtin").lsp_incoming_calls)
    keymap.set("n", "<leader>oc", require("telescope.builtin").lsp_outgoing_calls)

    keymap.set("n", "<leader>sH", builtin.highlights)
    keymap.set("n", "<leader>sM", builtin.man_pages)
    keymap.set("n", "<leader>sC", builtin.commands)

    keymap.set("n", "<leader>fs", require("telescope.builtin").treesitter)
    keymap.set("n", "<leader>fm", function() require("telescope.builtin").treesitter({ default_text = ":method:" }) end)
    keymap.set("n", "<leader>fw", builtin.grep_string)

    keymap.set("n", "<leader>sg", function() builtin.live_grep({ path_display = { "smart" } }) end)
    keymap.set("n", "<leader>s/",
      function()
        builtin.live_grep({
          path_display = { "shorten" },
          grep_open_files = true,
          prompt_title =
          "Live Grep in Open Files"
        })
      end, { desc = "[S]earch [/] in Open Files" })
    keymap.set("n", "<leader>/", function()
      builtin.current_buffer_fuzzy_find(
        require("telescope.themes").get_dropdown({ winblend = 0, previewer = false })
      )
    end)

		-- keymap.set("n", "<leader>tb", builtin.builtin)
		-- keymap.set("n", "<leader>sd", function() builtin.diagnostics({ bufnr = 0 }) end)
		-- keymap.set("n", "<leader>sD", require("telescope.builtin").diagnostics)

		-- keymap.set("n", "gr", require("telescope.builtin").lsp_references)
		-- keymap.set("n", "gws", require("telescope.builtin").lsp_workspace_symbols)
		-- keymap.set("n", "gwS", require("telescope.builtin").lsp_dynamic_workspace_symbols)
		-- keymap.set("n", "gs", require("telescope.builtin").lsp_document_symbols)
		-- keymap.set("n", "gd", require("telescope.builtin").lsp_definitions)
		-- keymap.set("n", "", require("telescope.builtin").lsp_type_definitions)
		-- keymap.set("n", "gI", require("telescope.builtin").lsp_implementations)

		-- builtin.git_bcommits
		-- builtin.git_bcommits_range
		-- builtin.git_branche
		-- builtin.git_stash
		-- builtin.vimoptions
	end,
}
