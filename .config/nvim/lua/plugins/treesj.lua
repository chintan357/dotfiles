return {
	"Wansmer/treesj",
	event = "VeryLazy",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		vim.keymap.set("n", "yog", require("treesj").toggle)
		vim.keymap.set("n", "<leader>g.", require("treesj").split)
		vim.keymap.set("n", "<leader>g,", require("treesj").join)
		require("treesj").setup({
			use_default_keymaps = false,
		})
	end,
}
