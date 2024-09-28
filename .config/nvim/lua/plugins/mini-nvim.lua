return {
	{
		"echasnovski/mini.ai",
		enabled = false,
		version = false,
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
		end,
	},
	{
		"echasnovski/mini.bufremove",
		version = false,
		config = function()
			require("mini.bufremove").setup()
		end,
	},
}
