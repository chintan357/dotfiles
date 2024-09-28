return {
	"chentoast/marks.nvim",
	enabled = false,
	event = "VeryLazy",
	config = function()
		require("marks").setup({
			default_mappings = true,
		})
	end,
}
