return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    {
      "nvim-treesitter/nvim-treesitter-context",
      opts = {
        -- enable = true,
        max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
        -- min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        -- line_numbers = true,
        -- multiline_threshold = 20, -- Maximum number of lines to show for a single context
        -- trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        -- mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- separator = "-",
      },
    },
    -- {
    -- 	"abecodes/tabout.nvim", -- Tab out from parenthesis, quotes, brackets...
    -- 	opts = {
    -- 		tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
    -- 		backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
    -- 		completion = true, -- We use tab for completion so set this to true
    -- 	},
    -- },
    -- {
    -- 	"JoosepAlviste/nvim-ts-context-commentstring", -- Smart commenting in multi language files - Enabled in Treesitter file
    -- },
    -- {
    -- 	"windwp/nvim-ts-autotag", -- Autoclose and autorename HTML and Vue tags
    -- 	config = true,
    -- },
    -- "RRethy/nvim-treesitter-endwise", -- Automatically add end keywords for Ruby, Lua, Python, and more
  },
  -- version = false,
  build = ":TSUpdate",
  -- event = "VeryLazy",
  event = { "BufReadPost", "BufNewFile" },
  init = function(plugin)
    -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
    -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
    -- no longer trigger the **nvim-treesitter** module to be loaded in time.
    -- Luckily, the only things that those plugins need are the custom queries, which we make available
    -- during startup.
    require("lazy.core.loader").add_to_rtp(plugin)
    require("nvim-treesitter.query_predicates")
  end,
  opts = {
    -- highlight = { enable = true, disable = { "text" }, additional_vim_regex_highlighting = false },
    highlight = { enable = true },
    indent = { enable = true },
    auto_install = false,
    sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
    -- auto_pairs = { enable = true },
    autotag = { enable = true },
    -- context_commentstring = { enable = true },
    ignore_install = {},
    ensure_installed = {
      "bash",
      "diff",
      "html",
      "javascript",
      "jsdoc",
      "python",
      "json",
      "jsonc",
      "yaml",
      "regex",
      "query",
      "toml",
      "markdown",
      "markdown_inline",
      "vim",
      "vimdoc",
      "lua",
      "luadoc",
      "luap",
      "rst"
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "<C-a>", -- grn
        node_decremental = "<bs>",  -- grm
        scope_incremental = false,  -- gn
      },
    },
    -- nvim-treesitter-endwise plugin
    -- endwise = { enable = true },
    textobjects = {
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
      -- lsp_interop = {
      -- 	enable = true,
      -- 	border = "none",
      -- 	floating_preview_opts = {},
      -- 	peek_definition_code = {
      -- 		-- ["<leader>df"] = "@function.outer",
      -- 		-- ["<leader>dF"] = "@class.outer",
      -- 	},
      -- }, -- },
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          ["ia"] = "@call.inner",
          ["aa"] = "@call.outer",
          ["iB"] = "@block.inner",
          ["aB"] = "@block.outer",
          ["if"] = "@function.inner",
          ["af"] = "@function.outer",
          ["iC"] = "@class.inner",
          ["aC"] = "@class.outer",
          ["ic"] = "@conditional.inner",
          ["ac"] = "@conditional.outer",
          -- ["al"] = { query = "@loop.outer", desc = "around a loop" },
          -- ["il"] = { query = "@loop.inner", desc = "inner part of a loop" },
          -- ["ap"] = { query = "@parameter.outer", desc = "around parameter" },
          -- ["ip"] = { query = "@parameter.inner", desc = "inside a parameter" },
          -- ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
        },
        selection_modes = {
          -- ['@parameter.outer'] = 'v', -- charwise
          -- ['@function.outer'] = 'V',  -- linewise
          -- ['@class.outer'] = '<c-v>', -- blockwise
          -- ["@parameter.outer"] = "v",     -- charwise
          -- ["@parameter.inner"] = "v",     -- charwise
          -- ["@function.outer"] = "v",      -- charwise
          -- ["@conditional.outer"] = "V",   -- linewise
          -- ["@loop.outer"] = "V",          -- linewise
          -- ["@class.outer"] = "<c-v>",     -- blockwise
        },
        include_surrounding_whitespace = false,

        move = {
          enable = true,
          set_jumps = true,
          -- goto_next_start = { ["]m"] = "@function.outer", ["]]"] = "@class.outer", },
          -- goto_next_end = { ["]M"] = "@function.outer", ["]["] = "@class.outer", },
          -- goto_previous_start = { ["[m"] = "@function.outer", ["[["] = "@class.outer", },
          -- goto_previous_end = { ["[M"] = "@function.outer", ["[]"] = "@class.outer", },
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
          -- goto_next = { [""] = "@conditional.outer", },
          -- goto_previous = { [""] = "@conditional.outer", },
          -- goto_previous_start = {
          --   ["[f"] = { query = "@function.outer", desc = "Previous function" },
          --   ["[c"] = { query = "@class.outer", desc = "Previous class" },
          --   ["[p"] = { query = "@parameter.inner", desc = "Previous parameter" },
          -- },
          -- goto_next_start = {
          --   ["]f"] = { query = "@function.outer", desc = "Next function" },
          --   ["]c"] = { query = "@class.outer", desc = "Next class" },
          --   ["]p"] = { query = "@parameter.inner", desc = "Next parameter" },
          -- },
        },
      },
    },
  },
  -- main = "nvim-treesitter.configs", -- Sets main module to use for opts
  config = function(_, opts)
    vim.keymap.set("n", "yoT", function()
      if vim.b.ts_highlight then
        vim.treesitter.stop()
      else
        vim.treesitter.start()
      end
    end)
    -- require("nvim-dap-repl-highlights").setup()

    vim.cmd([[
          hi TreesitterContextBottom gui=underline guisp=Grey
          hi TreesitterContextLineNumberBottom gui=underline guisp=Grey
      ]])

    require("nvim-treesitter.configs").setup(opts)
  end,
}

-- config = function(_, opts)
-- 	require("nvim-treesitter.install").prefer_git = true
-- 	require("nvim-treesitter.configs").setup(opts)
-- end,
--       -- additional_vim_regex_highlighting = { 'ruby' },
--     },
--     indent = { enable = true, disable = { "ruby" } },
--   },
--   config = function(_, opts)
--     require("nvim-treesitter.configs").setup(opts)
--   end,
-- },

-- Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`

-- local ts_status, treesitter = pcall(require, "nvim-treesitter.configs")
-- if ts_status then
--   treesitter.setup({
--   })
-- end
