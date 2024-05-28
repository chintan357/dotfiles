return {
	"rcarriga/nvim-dap-ui",
	event = "VeryLazy",
	dependencies = {
		"mfussenegger/nvim-dap",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-telescope/telescope-dap.nvim",
		"nvim-neotest/nvim-nio",
		"LiadOz/nvim-dap-repl-highlights",
	},
	opts = {
		controls = {
			element = "repl",
			enabled = true,
			icons = {
				disconnect = "",
				pause = "",
				play = "",
				run_last = "",
				step_back = "",
				step_into = "",
				step_out = "",
				step_over = "",
				terminate = "",
			},
		},
		element_mappings = {},
		expand_lines = true,
		floating = {
			border = "single",
			mappings = {
				close = { "q", "<Esc>" },
			},
		},
		force_buffers = true,
		icons = {
			collapsed = "",
			current_frame = "",
			expanded = "",
		},
		layouts = {
			{
				elements = {
					{
						id = "scopes",
						size = 0.50,
					},
					{
						id = "stacks",
						size = 0.30,
					},
					{
						id = "watches",
						size = 0.10,
					},
					{
						id = "breakpoints",
						size = 0.10,
					},
				},
				size = 40,
				position = "left", -- Can be "left" or "right"
			},
			{
				elements = {
					"repl",
					"console",
				},
				size = 10,
				position = "bottom", -- Can be "bottom" or "top"
			},
		},
		mappings = {
			edit = "e",
			expand = { "<CR>", "<2-LeftMouse>" },
			open = "o",
			remove = "d",
			repl = "r",
			toggle = "t",
		},
		render = {
			indent = 1,
			max_value_lines = 100,
		},
	},
	config = function(_, opts)
		local dap, dapui = require("dap"), require("dapui")

		function Map(mode, lhs, rhs, opt)
			local options = { noremap = true, silent = true }
			if opt then
				options = vim.tbl_extend("force", options, opt)
			end
			vim.keymap.set(mode, lhs, rhs, options)
		end

		-- stylua: ignore start
		dapui.setup(opts)

		Map("n", "yoD", function() dapui.toggle() end)

    -- TODO: which one of these two to use?
		Map("n", "<leader>dd", function() dapui.disconnect() dapui.close() end)
		Map("n", "<leader>dt", function() dapui.terminate() dapui.close() end)

		Map("n", "<leader>dc", "<cmd>Telescope dap commands<cr>")

    -- TODO: not working :)
		Map("n", "<leader>df", "<cmd>Telescope dap frames<cr>")
		Map("n", "<leader>dls", "<cmd>Telescope dap list_breakpoints<cr>")

		-- Map({ "v", "n" }, "", "<Cmd>lua require('dapui').eval()<CR>")

		Map("n", "<leader>dw", "<Cmd>lua require('dapui').float_element('watches', { width = 100, height = 40, enter = true })<CR>")
		Map( "n", "<leader>dr", "<cmd>lua require'dapui'.float_element('repl', { width = 100, height = 40, enter = true })<CR>", { desc = "Show DAP REPL" })
		Map( "n", "<leader>db", "<cmd>lua require'dapui'.float_element('scopes', { width = 100, height = 40, enter = true })<CR>", { desc = "Show DAP Scopes" })
		Map( "n", "<leader>ds", "<cmd>lua require'dapui'.float_element('stacks', { width = 100, height = 40, enter = true })<CR>", { desc = "Show DAP Stacks" })

		-- vim.keymap.set("n", "<Leader>df", function() local widgets = require("dap.ui.widgets") widgets.centered_float(widgets.frames) end)
		-- vim.keymap.set({ "n", "v" }, "<Leader>dh", function() require("dap.ui.widgets").hover() end)
		-- vim.keymap.set({ "n", "v" }, "<Leader>dp", function() require("dap.ui.widgets").preview() end)
		-- vim.keymap.set("n", "<Leader>d?", function() local widgets = require("dap.ui.widgets") widgets.centered_float(widgets.scopes) end)


    local function set_dap_keybindings()
      vim.keymap.set('n', ')', "<cmd>lua require'dap'.continue()<CR>", { noremap = true, silent = true })
      vim.keymap.set('n', 'q', "<cmd>lua require'dap'.step_over()<CR>", { noremap = true, silent = true })
      vim.keymap.set('n', 't', "<cmd>lua require'dap'.step_into()<CR>", { noremap = true, silent = true })
      vim.keymap.set('n', '(', "<cmd>lua require'dap'.step_out()<CR>", { noremap = true, silent = true })
    end
    local function clear_dap_keybindings()
      vim.keymap.del('n', ')')
      vim.keymap.del('n', 'q')
      vim.keymap.del('n', 't')
      vim.keymap.del('n', '(')
    end

    -- dap.listeners.after.event_initialized["dap_keybindings"] = function()
    --   set_dap_keybindings()
    -- end
    -- dap.listeners.before.event_terminated["dap_keybindings"] = function()
    --   clear_dap_keybindings()
    -- end
    -- dap.listeners.before.event_exited["dap_keybindings"] = function()
    --   clear_dap_keybindings()
    -- end
    --
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
      -- set_dap_keybindings()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
      set_dap_keybindings()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
      clear_dap_keybindings()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
      clear_dap_keybindings()
		end
	end,
}
