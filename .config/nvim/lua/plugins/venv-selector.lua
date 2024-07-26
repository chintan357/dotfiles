return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
		"mfussenegger/nvim-dap-python",
		"nvim-telescope/telescope.nvim",
	},
	event = "VeryLazy",
	branch = "main", -- This is the regexp branch, use this for the new version
	config = function()
		require("venv-selector").setup()
	end,
	keys = {
		{ ",v", "<cmd>VenvSelect<cr>" },
		{ "<leader>vs", "<cmd>VenvSelect<cr>" },
		{ "<leader>vc", "<cmd>VenvSelectCached<cr>" },
	},
	cmd = "VenvSelect",
	event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
	opts = function(_, opts)
		opts.dap_enabled = true
		return vim.tbl_deep_extend("force", opts, {
			name = {
				"venv",
				".venv",
				"env",
				".env",
			},
		})
	end,
	-- opts = {
	--   -- name = "venv",
	--   -- auto_refresh = false
	-- },
}
