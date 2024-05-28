return {
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("dap-python").setup("/usr/bin/python3")
		local keymap = vim.keymap

		local path = require("mason-registry").get_package("debugpy"):get_install_path()
		require("dap-python").setup(path .. "/venv/bin/python")

		keymap.set("n", "<leader>is", function()
			if vim.bo.filetype == "python" then
				vim.api.nvim_command("PyrightOrganizeImports")
			end
		end)
		keymap.set("n", "<leader>tc", function()
			if vim.bo.filetype == "python" then
				require("dap-python").test_class()
			end
		end)

		keymap.set("n", "<leader>tm", function()
			if vim.bo.filetype == "python" then
				require("dap-python").test_method()
			end
		end)
		vim.cmd([[
		vnoremap <silent> <leader>ts<ESC>:lua require('dap-python').debug_selection()<CR>
		]])
		require("dap-python").setup()
	end,
}
