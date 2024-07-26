return {
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",
	keys = {
		{ "yoa", "<cmd>AerialToggle!<cr>", desc = "AerialToggle" },
	},
	config = function()
		local status_ok, aerial = pcall(require, "aerial")
		if not status_ok then
			return
		end

		aerial.setup({
			on_attach = function(bufnr)
				vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
				vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
			end,
		})

		local tele_status_ok, telescope = pcall(require, "telescope")
		if not tele_status_ok then
			return
		end

		vim.keymap.set("n", "<leader>ta", "<cmd>Telescope aerial<CR>", {
			desc = "Telescope Aerial",
		})

		telescope.load_extension("aerial")
	end,
}
-- keymaps = {
--
--    ["<C-v>"] = "actions.jump_vsplit",
--    ["<C-s>"] = "actions.jump_split",
--    ["p"] = "actions.scroll",
--
--    ["<C-j>"] = "actions.down_and_scroll",
--    ["<C-k>"] = "actions.up_and_scroll",
--
--    ["[["] = "actions.prev_up",
--    ["]]"] = "actions.next_up",
--
--    ["o"] = "actions.tree_toggle",
--    ["za"] = "actions.tree_toggle",
--    ["O"] = "actions.tree_toggle_recursive",
--    ["zA"] = "actions.tree_toggle_recursive",
--    ["l"] = "actions.tree_open",
--    ["zo"] = "actions.tree_open",
--    ["L"] = "actions.tree_open_recursive",
--    ["zO"] = "actions.tree_open_recursive",
--    ["h"] = "actions.tree_close",
--    ["zc"] = "actions.tree_close",
--    ["H"] = "actions.tree_close_recursive",
--    ["zC"] = "actions.tree_close_recursive",
--    ["zr"] = "actions.tree_increase_fold_level",
--    ["zR"] = "actions.tree_open_all",
--    ["zm"] = "actions.tree_decrease_fold_level",
--    ["zM"] = "actions.tree_close_all",
--    ["zx"] = "actions.tree_sync_folds",
--    ["zX"] = "actions.tree_sync_folds",
--  },
