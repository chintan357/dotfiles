return {
	"TobinPalmer/rayso.nvim",
	event = "VeryLazy",
	config = function()
		require("rayso").setup({
			open_cmd = "open-cli",
			options = {
				logging_enabled = false,
				theme = "midnight", -- crimson
			},
		})
		vim.keymap.set("v", "<leader>rs", require("lib.create").create_snippet)
	end,
}
