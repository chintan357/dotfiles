return {
	"Wansmer/treesj",
	event = "VeryLazy",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		vim.keymap.set("n", "<leader>usj", require("treesj").toggle)
		vim.keymap.set("n", "<leader>sj", require("treesj").split)
		vim.keymap.set("n", "<leader>js", require("treesj").join)
		require("treesj").setup({
			use_default_keymaps = false,
		})
	end,
}
