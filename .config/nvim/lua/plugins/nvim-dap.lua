return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			config = function(_, opts)
				local dapui = require("dapui")
				dapui.setup(opts)
			end,
		},
		{
			"jay-babu/mason-nvim-dap.nvim",
			dependencies = "mason.nvim",
			cmd = { "DapInstall", "DapUninstall" },
			opts = {
				automatic_installation = true,
				handlers = {},
				ensure_installed = {},
			},
		},
		{ "jbyuki/one-small-step-for-vimkind", module = "osv" },
	},
	config = function()
		-- stylua: ignore start
		function Map(mode, lhs, rhs, opts)
			local options = { noremap = true, silent = true }
			if opts then
				options = vim.tbl_extend("force", options, opts)
			end
			vim.keymap.set(mode, lhs, rhs, options)
		end


		vim.keymap.set("n", "yob", function() require("dap").toggle_breakpoint() end)

		-- vim.keymap.set("n", "<Leader>b", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end)
		-- vim.keymap.set("n", "<Leader>b", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end)
		-- vim.keymap.set("n", "<Leader>b", function() require("dap").set_exception_breakpoints() end)

		vim.keymap.set("n", "]ob", function() require("dap").clear_breakpoints() end)

		-- vim.keymap.set("n", "", function() require("dap").continue() end)
		-- vim.keymap.set("n", "<F10>", function() require("dap").step_over() end)
		-- vim.keymap.set("n", "<F11>", function() require("dap").step_into() end)
		-- vim.keymap.set("n", "<F12>", function() require("dap").step_out() end)

		vim.keymap.set("n", "<Leader>dl", function() require("dap").run_last() end)

		--
		-- stylua: ignore start
		-- vim.keymap.set("n", "<Leader>dr", function() require("dap").repl.toggle() end)

		-- Run Tests
		-- Map("n", "<leader>t", "<cmd>lua require('neotest').run.run()<CR>", { desc = "Run Test" })
		-- Map( "n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", { desc = "Run Test File" })
		-- Map( "n", "<leader>td", "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<CR>", { desc = "Run Current Test Directory" })
		-- Map( "n", "<leader>tp", "<cmd>lua require('neotest').output_panel.toggle()<CR>", { desc = "Toggle Test Output Panel" })
		-- Map("n", "<leader>tl", "<cmd>lua require('neotest').run.run_last()<CR>", { desc = "Run Last Test" })
		-- Map("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<CR>", { desc = "Toggle Test Summary" })
		-- keymap.set("n", "<leader>go", function()
	end,
}
