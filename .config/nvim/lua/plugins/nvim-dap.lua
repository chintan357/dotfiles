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

		-- vim.keymap.set("n", "yoB", function()
		-- 	require("dap").clear_breakpoints()
		-- end)

		-- vim.keymap.set("n", "<Leader>b", function() require("dap").set_exception_breakpoints() end)

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

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close
	end,
}
