return {
	"mfussenegger/nvim-dap",
	lazy = true,
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
		"LiadOz/nvim-dap-repl-highlights",
		"williamboman/mason.nvim",
		{
			"jay-babu/mason-nvim-dap.nvim",
			dependencies = "williamboman/mason.nvim",
			cmd = { "DapInstall", "DapUninstall" },
			opts = {
				automatic_installation = true,
				handlers = {},
				ensure_installed = {},
			},
		},
		{ "jbyuki/one-small-step-for-vimkind", module = "osv" },
		"mfussenegger/nvim-dap-python",
	},
	keys = {
		{
			"<F5>",
			function()
				require("dap").continue()
			end,
			desc = "Debug: Start/Continue",
		},
		{
			"<F1>",
			function()
				require("dap").step_into()
			end,
			desc = "Debug: Step Into",
		},
		{
			"<F2>",
			function()
				require("dap").step_over()
			end,
			desc = "Debug: Step Over",
		},
		{
			"<F3>",
			function()
				require("dap").step_out()
			end,
			desc = "Debug: Step Out",
		},
		-- {
		-- 	"<leader>b",
		-- 	function()
		-- 		require("dap").toggle_breakpoint()
		-- 	end,
		-- 	desc = "Debug: Toggle Breakpoint",
		-- },
		-- {
		-- 	"<leader>B",
		-- 	function()
		-- 		require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
		-- 	end,
		-- 	desc = "Debug: Set Breakpoint",
		-- },
		-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
		{
			"<F7>",
			function()
				require("dapui").toggle()
			end,
			desc = "Debug: See last session result.",
		},
		-- 	{
		-- 		"<F5>",
		-- 		"<cmd>lua require('dap').repl.toggle({height = 6})<CR>",
		-- 		description = "Toggle REPL",
		-- 	},
		-- 	{ "<F6>", "<cmd>lua require('dap').repl.run_last()<CR>", description = "Run last" },
		-- 	{
		-- 		"<F9>",
		-- 		function()
		-- 			local _, dap = require("dap")
		-- 			dap.disconnect()
		-- 			require("dapui").close()
		-- 		end,
		-- 		description = "Stop",
		-- 	},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
		function Map(mode, lhs, rhs, opts)
			local options = { noremap = true, silent = true }
			if opts then
				options = vim.tbl_extend("force", options, opts)
			end
			vim.keymap.set(mode, lhs, rhs, options)
		end

		-- vim.keymap.set("n", "yob", function()
		-- 	require("dap").toggle_breakpoint()
		-- end)
		-- vim.keymap.set("n", "yoB", function()
		-- 	require("dap").clear_breakpoints()
		-- end)

		-- vim.keymap.set("n", "<Leader>b", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end)
		-- vim.keymap.set("n", "<Leader>b", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end)
		-- vim.keymap.set("n", "<Leader>b", function() require("dap").set_exception_breakpoints() end)

		-- TODO: reposition the ui

		-- vim.keymap.set("n", "<Leader>dl", function()
		-- 	require("dap").run_last()
		-- end)

		-- vim.keymap.set("n", "<Leader>dr", function() require("dap").repl.toggle() end)

		-- Run Tests
		-- Map("n", "<leader>t", "<cmd>lua require('neotest').run.run()<CR>", { desc = "Run Test" })
		-- Map( "n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", { desc = "Run Test File" })
		-- Map( "n", "<leader>td", "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<CR>", { desc = "Run Current Test Directory" })
		-- Map( "n", "<leader>tp", "<cmd>lua require('neotest').output_panel.toggle()<CR>", { desc = "Toggle Test Output Panel" })
		-- Map("n", "<leader>tl", "<cmd>lua require('neotest').run.run_last()<CR>", { desc = "Run Last Test" })
		-- Map("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<CR>", { desc = "Toggle Test Summary" })
		-- keymap.set("n", "<leader>go", function()

		-- Change breakpoint icons
		-- vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
		-- vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
		-- local breakpoint_icons = vim.g.have_nerd_font
		--     and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
		--   or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
		-- for type, icon in pairs(breakpoint_icons) do
		--   local tp = 'Dap' .. type
		--   local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
		--   vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
		-- end

		-- dap.set_log_level("TRACE")
		--
		-- virtual_text_setup()
		-- signs_setup()
		-- ui_setup(dap)
		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close
	end,
}
