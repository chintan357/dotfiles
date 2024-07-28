-- TODO: how to use this plugin?
return {
	"ThePrimeagen/refactoring.nvim",
	lazy = true,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-treesitter/nvim-treesitter" },
	},
	keys = {
		{
			"<LocalLeader>rd",
			function()
				require("refactoring").debug.printf({ below = false })
			end,
			description = "Insert Printf statement for debugging",
		},
		{
			"<LocalLeader>re",
			function()
				require("telescope").extensions.refactoring.refactors()
			end,
			description = "Open Refactoring.nvim",
			mode = { "n", "v", "x" },
		},
		{
			"<leader>r",
			function()
				require("lua.plugins.refactoring-nvim").select_refactor()
			end,
			mode = "v",
			noremap = true,
			silent = true,
			expr = false,
		},
		{
			"<leader>rm",
			function()
				require("lua.plugins.refactoring-nvim").select_refactor()
			end,
			mode = { "v" },
			desc = "Refactoring menu",
		},
		-- Debug variable
		{
			"<leader>dv",
			function()
				require("lua.plugins.refactoring-nvim").debug.print_var({
					below = true,
				})
			end,
			mode = { "n", "x" },
			desc = "Print below variables",
		},
		{
			"<LocalLeader>rv",
			{
				n = function()
					require("refactoring").debug.print_var({ normal = true })
				end,
				x = function()
					require("refactoring").debug.print_var({})
				end,
			},
			description = "Insert Print_Var statement for debugging",
			mode = { "n", "v" },
		},
		{
			"<LocalLeader>rc",
			function()
				require("refactoring").debug.cleanup()
			end,
			description = "Cleanup debug statements",
		},
		{
			"<leader>dV",
			function()
				require("lua.plugins.refactoring-nvim").debug.print_var({
					below = false,
				})
			end,
			mode = { "n", "x" },
			desc = "Print above variables",
		},
		-- Clean up debugging
		{
			"<leader>dc",
			function()
				require("lua.plugins.refactoring-nvim").debug.cleanup({
					force = true,
				})
			end,
			desc = "Clear debugging",
		},
	},
	opts = {
		prompt_func_return_type = {
			go = false,
			java = false,

			cpp = false,
			c = false,
			h = false,
			hpp = false,
			cxx = false,
		},
		prompt_func_param_type = {
			go = false,
			java = false,

			cpp = false,
			c = false,
			h = false,
			hpp = false,
			cxx = false,
		},
		printf_statements = {},
		print_var_statements = {},
	},
	config = function(_, options)
		require("lua.plugins.refactoring-nvim").setup(options)

		local tele_status_ok, telescope = pcall(require, "telescope")
		if not tele_status_ok then
			return
		end

		telescope.load_extension("refactoring")
	end,
}
