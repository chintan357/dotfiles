-- TODO: test class, method & debug_selection
return {
  {
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
  },
  {
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
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope-dap.nvim",
      -- "nvim-neotest/nvim-nio",
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
      -- icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
      icons = {
        collapsed = "",
        current_frame = "",
        expanded = "",
      },
      layouts = {
        {
          elements = {
            { id = "scopes",      size = 0.50 },
            { id = "stacks",      size = 0.30 },
            { id = "watches",     size = 0.10 },
            { id = "breakpoints", size = 0.10 },
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

      -- Map("n", "yoD", function() dapui.toggle() end)

      -- TODO: which one of these two to use?

      -- Map("n", "<leader>dd", function() dapui.disconnect() dapui.close() end)
      -- Map("n", "<leader>dt", function() dapui.terminate() dapui.close() end)

      Map("n", "<leader>dc", "<cmd>Telescope dap commands<cr>")

      -- TODO: not working :)

      -- Map("n", "<leader>df", "<cmd>Telescope dap frames<cr>")
      -- Map("n", "<leader>dls", "<cmd>Telescope dap list_breakpoints<cr>")

      -- Map({ "v", "n" }, "", "<Cmd>lua require('dapui').eval()<CR>")

      -- Map("n", "<leader>dw", "<Cmd>lua require('dapui').float_element('watches', { width = 100, height = 40, enter = true })<CR>")
      -- Map( "n", "<leader>dr", "<cmd>lua require'dapui'.float_element('repl', { width = 100, height = 40, enter = true })<CR>", { desc = "Show DAP REPL" })
      -- Map( "n", "<leader>db", "<cmd>lua require'dapui'.float_element('scopes', { width = 100, height = 40, enter = true })<CR>", { desc = "Show DAP Scopes" })
      -- Map( "n", "<leader>ds", "<cmd>lua require'dapui'.float_element('stacks', { width = 100, height = 40, enter = true })<CR>", { desc = "Show DAP Stacks" })

      -- vim.keymap.set("n", "<Leader>df", function() local widgets = require("dap.ui.widgets") widgets.centered_float(widgets.frames) end)
      -- vim.keymap.set({ "n", "v" }, "<Leader>dh", function() require("dap.ui.widgets").hover() end)
      -- vim.keymap.set({ "n", "v" }, "<Leader>dp", function() require("dap.ui.widgets").preview() end)
      -- vim.keymap.set("n", "<Leader>d?", function() local widgets = require("dap.ui.widgets") widgets.centered_float(widgets.scopes) end)

      -- vim.keymap.set("n", "<space>gb", dap.run_to_cursor)
      -- -- Eval var under cursor
      -- vim.keymap.set("n", "<space>?", function()
      --   require("dapui").eval(nil, { enter = true })
      -- end)
    end,
  }, }

-- dapui.setup({
-- 	layouts = {
-- 		{
-- 			elements = {
-- 				"scopes",
-- 				"breakpoints",
-- 				"stacks",
-- 			},
-- 			size = 35,
-- 			position = "left",
-- 		},
-- 		{
-- 			elements = {
-- 				"repl",
-- 			},
-- 			size = 0.30,
-- 			position = "bottom",
-- 		},
-- 	},
-- })
