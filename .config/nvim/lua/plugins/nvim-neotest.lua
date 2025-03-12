-- TODO: how is this useful?
return {
  "nvim-neotest/neotest",
  lazy = true,
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- Adapters
    "nvim-neotest/neotest-plenary",
    "nvim-neotest/neotest-python",
  },
  keys = {
    -- Neotest plugin
    {
      "<LocalLeader>tn",
      function()
        require("neotest").run.run()
      end,
      description = "Test nearest",
    },
    {
      "<LocalLeader>tf",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      description = "Test file",
    },
    {
      "<LocalLeader>tl",
      function()
        require("neotest").run.run_last()
      end,
      description = "Run last test",
    },
    {
      "<LocalLeader>ts",
      function()
        local neotest = require("neotest")
        for _, adapter_id in ipairs(neotest.run.adapters()) do
          neotest.run.run({ suite = true, adapter = adapter_id })
        end
      end,
      description = "Test suite",
    },
    {
      "<LocalLeader>to",
      function()
        require("neotest").output.open({ short = true })
      end,
      description = "Open test output",
    },
    {
      "`",
      function()
        require("neotest").summary.toggle()
      end,
      description = "Toggle test summary",
    },
    {
      "<LocalLeader>twn",
      function()
        require("neotest").watch.toggle()
      end,
      description = "Watch nearest test",
    },
    {
      "<LocalLeader>twf",
      function()
        require("neotest").watch.toggle({ vim.fn.expand("%") })
      end,
      description = "Watch file",
    },
    {
      "<LocalLeader>twa",
      function()
        require("neotest").watch.toggle({ suite = true })
      end,
      description = "Watch all tests",
    },
    {
      "<LocalLeader>twa",
      function()
        require("neotest").watch.stop()
      end,
      description = "Stop watching",
    },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-plenary"),
        require("neotest-python")({
          dap = { justMyCode = false },
        }),
      },
      consumers = {
        overseer = require("neotest.consumers.overseer"),
      },
      diagnostic = {
        enabled = false,
      },
      log_level = vim.log.levels.TRACE,
      icons = {
        expanded = "",
        child_prefix = "",
        child_indent = "",
        final_child_prefix = "",
        non_collapsible = "",
        collapsed = "",

        passed = "",
        running = "",
        failed = "",
        unknown = "",
        skipped = "",
      },
      floating = {
        border = "single",
        max_height = 0.8,
        max_width = 0.9,
      },
      summary = {
        mappings = {
          attach = "a",
          expand = { "<CR>", "<2-LeftMouse>" },
          expand_all = "e",
          jumpto = "i",
          output = "o",
          run = "r",
          short = "O",
          stop = "u",
        },
      },
    })

    -- function Map(mode, lhs, rhs, opts)
    -- 	local options = { noremap = true, silent = true }
    -- 	if opts then
    -- 		options = vim.tbl_extend("force", options, opts)
    -- 	end
    -- 	vim.keymap.set(mode, lhs, rhs, options)
    -- end

    -- Run Tests
    -- Map("n", "<leader>t", "<cmd>lua require('neotest').run.run()<CR>", { desc = "Run Test" })
    -- Map( "n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", { desc = "Run Test File" })
    -- Map( "n", "<leader>td", "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<CR>", { desc = "Run Current Test Directory" })
    -- Map( "n", "<leader>tp", "<cmd>lua require('neotest').output_panel.toggle()<CR>", { desc = "Toggle Test Output Panel" })
    -- Map("n", "<leader>tl", "<cmd>lua require('neotest').run.run_last()<CR>", { desc = "Run Last Test" })
    -- Map("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<CR>", { desc = "Toggle Test Summary" })
  end,
}
