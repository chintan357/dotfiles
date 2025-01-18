    { "smjonas/inc-rename.nvim", cmd = "IncRename", config = true, },
    { "monaqa/dial.nvim",
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
    	config = function()
    		local augend = require("dial.augend")
    		require("dial.config").augends:register_group({
    			default = {
    				augend.integer.alias.decimal,
    				augend.integer.alias.hex,
    				augend.date.alias["%Y/%m/%d"],
    				augend.constant.alias.bool,
    				augend.semver.alias.semver,
    				augend.constant.new({ elements = { "let", "const" } }),
    			},
    		})
    	end,
    },

{ "preservim/vim-pencil" },
{
"mfussenegger/nvim-lint",
event = {
"BufReadPre",
"BufNewFile",
},
config = function()
local lint = require("lint")

      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        svelte = { "eslint_d" },
        kotlin = { "ktlint" },
        terraform = { "tflint" },
        ruby = { "standardrb" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

      vim.keymap.set("n", "<leader>ll", function()
        lint.try_lint()
      end, { desc = "Trigger linting for current file" })
    end,

},
{
"RRethy/vim-illuminate",
config = function()
require("illuminate")
end,
},
{
"exosyphon/telescope-color-picker.nvim",
config = function()
vim.keymap.set("n", "<leader>uC", "<cmd>Telescope colors<CR>", { desc = "Telescope Color Picker" })
end,
},
{
"numToStr/Comment.nvim",
config = function()
require("Comment").setup()
end,
},
{
"nvim-neotest/neotest",
dependencies = {
"nvim-lua/plenary.nvim",
"nvim-treesitter/nvim-treesitter",
"antoinemadec/FixCursorHold.nvim",
"olimorris/neotest-rspec",
"haydenmeade/neotest-jest",
"zidhuss/neotest-minitest",
"mfussenegger/nvim-dap",
"jfpedroza/neotest-elixir",
"weilbith/neotest-gradle",
},
opts = {},
config = function()
local neotest = require("neotest")

      local neotest_jest = require("neotest-jest")({
        jestCommand = "npm test --",
      })
      neotest_jest.filter_dir = function(name)
        return name ~= "node_modules" and name ~= "__snapshots__"
      end

      neotest.setup({
        adapters = {
          require("neotest-gradle"),
          require("neotest-rspec")({
            rspec_cmd = function()
              return vim.tbl_flatten({
                "bundle",
                "exec",
                "rspec",
              })
            end,
          }),
          neotest_jest,
          require("neotest-minitest"),
          require("neotest-elixir"),
        },
        output_panel = {
          enabled = true,
          open = "botright split | resize 15",
        },
        quickfix = {
          open = false,
        },
      })
    end,

},
{
"nvim-lualine/lualine.nvim",
dependencies = { "nvim-tree/nvim-web-devicons" },
config = function()
require("lualine").setup({
options = {
theme = "tokyonight",
},
sections = {
lualine_a = { "mode" },
lualine_b = { "diff", "diagnostics" },
lualine_c = { { "filename", path = 1 } },
lualine_x = {
{ "fileformat", "filetype" },
{
require("noice").api.statusline.mode.get,
cond = require("noice").api.statusline.mode.has,
color = { fg = "#ff9e64" },
},
},
lualine_y = { "progress" },
lualine_z = { "location" },
},
extensions = { "fugitive", "quickfix", "fzf", "lazy", "mason", "nvim-dap-ui", "oil", "trouble" },
})
end,
},

{ nvim-telescope/telescope-live-grep-args.nvim" },
{ "aaronhallaert/advanced-git-search.nvim", },
https://github.com/stevearc/stickybuf.nvim
