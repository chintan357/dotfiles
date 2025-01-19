-- TODO: test class, method & debug_selection
return {
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("dap-python").setup("python3")
		local keymap = vim.keymap

		-- if vim.bo.filetype == "python" then
		keymap.set("n", "<leader>tc", function()
			require("dap-python").test_class()
		end)

		keymap.set("n", "<leader>tm", function()
			require("dap-python").test_method()
		end)
		vim.cmd([[
		vnoremap <silent> <leader>ts<ESC>:lua require('dap-python').debug_selection()<CR>
		]])
	end,
}
