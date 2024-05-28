return {
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("treesitter-context").setup({
				enable = true,
				max_lines = 5, -- How many lines the window should span. Values <= 0 mean no limit.
				min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
				line_numbers = true,
				multiline_threshold = 3, -- Maximum number of lines to show for a single context
				trim_scope = "inner", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
				mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
				-- Separator between context and content. Should be a single character string, like '-'.
				-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
				separator = nil,
				zindex = 20, -- The Z-index of the context window
				on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		-- event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
		config = function()
			-- local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

			-- Repeat movement with ; and ,
			-- ensure ; goes forward and , goes backward regardless of the last direction
			-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
			-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

			-- vim way: ; goes to the direction you were moving.
			-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
			-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

			-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
			-- vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
			-- vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
			-- vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
			-- vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
			-- example: make gitsigns.nvim movement repeatable with ; and , keys.
			-- local gs = require("gitsigns")

			-- make sure forward function comes first
			-- local next_hunk_repeat, prev_hunk_repeat =
			-- 	ts_repeat_move.make_repeatable_move_pair(gs.next_hunk, gs.prev_hunk)
			-- -- Or, use `make_repeatable_move` or `set_last_move` functions for more control. See the code for instructions.
			--
			-- vim.keymap.set({ "n", "x", "o" }, "]h", next_hunk_repeat)
			-- vim.keymap.set({ "n", "x", "o" }, "[h", prev_hunk_repeat)
			--
			require("nvim-dap-repl-highlights").setup()
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
				indent = { enable = true },
				auto_install = true,
				auto_pairs = { enable = true },
				autotag = { enable = true },
				context_commentstring = { enable = true },
				ensure_installed = {
					"python",
					"javascript",
					"json",
					"vimdoc",
					"vim",
					"lua",
					"luadoc",
					"regex",
					"markdown",
					"markdown_inline",
					"toml",
					"proto",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-a>",
						node_incremental = "<C-a>",
						scope_incremental = "<C-S-a>",
						node_decremental = "<bs>",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
						keymaps = {
							["ia"] = "@call.inner",
							["aa"] = "@call.outer",
							["iB"] = "@block.inner",
							["aB"] = "@block.outer",
							["if"] = "@function.inner",
							["af"] = "@function.outer",
							["iC"] = "@class.inner",
							["aC"] = "@class.outer",
							["ic"] = "@conditional.inner",
							["ac"] = "@conditional.outer",
						},
						include_surrounding_whitespace = false,

						move = {
							enable = true,
							set_jumps = true,
							goto_next_start = {
								["]m"] = "@function.outer",
								["]]"] = "@class.outer",
							},
							goto_next_end = {
								["]M"] = "@function.outer",
								["]["] = "@class.outer",
							},
							goto_previous_start = {
								["[m"] = "@function.outer",
								["[["] = "@class.outer",
							},
							goto_previous_end = {
								["[M"] = "@function.outer",
								["[]"] = "@class.outer",
							},
						},
					},
				},
			})
		end,
	},
}

-- config = function(_, opts)
-- 	require("nvim-treesitter.install").prefer_git = true
-- 	require("nvim-treesitter.configs").setup(opts)
-- end,
--       -- additional_vim_regex_highlighting = { 'ruby' },
--     },
--     indent = { enable = true, disable = { "ruby" } },
--   },
--   config = function(_, opts)
--     -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
--
--     ---@diagnostic disable-next-line: missing-fields
--     require("nvim-treesitter.configs").setup(opts)
--
--     --
--     --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
--     --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
--     --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
--   end,
-- },
