-- https://github.com/stevearc/quicker.nvim
return {
	{
		"kevinhwang91/nvim-bqf",
		enabled = false,
		config = function()
			require("bqf").setup()
		end,
	},
}
