return {
	"mfussenegger/nvim-dap",
	lazy = true,
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text", -- help to find variable definitions in debug mode
			"mfussenegger/nvim-dap-python", -- Debug Python
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
	-- keys = {
	-- 	{
	-- 		"<F1>",
	-- 		"<cmd>lua require('dap').toggle_breakpoint()<CR>",
	-- 		description = "Set breakpoint",
	-- 	},
	-- 	{ "<F2>", "<cmd>lua require('dap').continue()<CR>", description = "Continue" },
	-- 	{ "<F3>", "<cmd>lua require('dap').step_into()<CR>", description = "Step into" },
	-- 	{ "<F4>", "<cmd>lua require('dap').step_over()<CR>", description = "Step over" },
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
	-- },
	config = function()
		local dap = require("dap")
		-- require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
		function Map(mode, lhs, rhs, opts)
			local options = { noremap = true, silent = true }
			if opts then
				options = vim.tbl_extend("force", options, opts)
			end
			vim.keymap.set(mode, lhs, rhs, options)
		end

		vim.keymap.set("n", "yob", function()
			require("dap").toggle_breakpoint()
		end)
		vim.keymap.set("n", "yoB", function()
			require("dap").clear_breakpoints()
		end)

		---Show the nice virtual text when debugging
		---@return nil|function
		local function virtual_text_setup()
			local ok, virtual_text = pcall(require, "nvim-dap-virtual-text")
			if not ok then
				return
			end

			return virtual_text.setup()
		end

		---Show custom virtual text when debugging
		---@return nil
		local function signs_setup()
			vim.fn.sign_define("DapBreakpoint", {
				text = "",
				texthl = "DebugBreakpoint",
				linehl = "",
				numhl = "DebugBreakpoint",
			})
			vim.fn.sign_define("DapStopped", {
				text = "",
				texthl = "DebugHighlight",
				linehl = "",
				numhl = "DebugHighlight",
			})
		end
		-- vim.keymap.set("n", "<Leader>b", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end)
		-- vim.keymap.set("n", "<Leader>b", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end)
		-- vim.keymap.set("n", "<Leader>b", function() require("dap").set_exception_breakpoints() end)

		-- TODO: reposition the ui

		vim.keymap.set("n", "<Leader>dl", function()
			require("dap").run_last()
		end)

		-- vim.keymap.set("n", "<Leader>dr", function() require("dap").repl.toggle() end)

		-- Run Tests
		-- Map("n", "<leader>t", "<cmd>lua require('neotest').run.run()<CR>", { desc = "Run Test" })
		-- Map( "n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", { desc = "Run Test File" })
		-- Map( "n", "<leader>td", "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<CR>", { desc = "Run Current Test Directory" })
		-- Map( "n", "<leader>tp", "<cmd>lua require('neotest').output_panel.toggle()<CR>", { desc = "Toggle Test Output Panel" })
		-- Map("n", "<leader>tl", "<cmd>lua require('neotest').run.run_last()<CR>", { desc = "Run Last Test" })
		-- Map("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<CR>", { desc = "Toggle Test Summary" })
		-- keymap.set("n", "<leader>go", function()

		---Slick UI which is automatically triggered when debugging
		---@param adapter table
		---@return nil
		local function ui_setup(adapter)
			local ok, dapui = pcall(require, "dapui")
			if not ok then
				return
			end

			dapui.setup({
				layouts = {
					{
						elements = {
							"scopes",
							"breakpoints",
							"stacks",
						},
						size = 35,
						position = "left",
					},
					{
						elements = {
							"repl",
						},
						size = 0.30,
						position = "bottom",
					},
				},
			})
			adapter.listeners.after.event_initialized["dapui_config"] = dapui.open
			adapter.listeners.before.event_terminated["dapui_config"] = dapui.close
			adapter.listeners.before.event_exited["dapui_config"] = dapui.close
		end

		-- dap.set_log_level("TRACE")
		--
		-- virtual_text_setup()
		-- signs_setup()
		-- ui_setup(dap)
	end,
}
