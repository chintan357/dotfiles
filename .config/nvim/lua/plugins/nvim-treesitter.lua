return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("treesitter-context").setup({
        enable = true,
        max_lines = 3,           -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0,   -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 3, -- Maximum number of lines to show for a single context
        trim_scope = "outer",    -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = "cursor",         -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20,     -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    -- event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      {
        "abecodes/tabout.nvim",         -- Tab out from parenthesis, quotes, brackets...
        opts = {
          tabkey = "<Tab>",             -- key to trigger tabout, set to an empty string to disable
          backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
          completion = true,            -- We use tab for completion so set this to true
        },
      },
      -- {
      -- 	"JoosepAlviste/nvim-ts-context-commentstring", -- Smart commenting in multi language files - Enabled in Treesitter file
      -- },
      -- {
      -- 	"windwp/nvim-ts-autotag", -- Autoclose and autorename HTML and Vue tags
      -- 	config = true,
      -- },
      "RRethy/nvim-treesitter-endwise", -- Automatically add end keywords for Ruby, Lua, Python, and more
    },
    build = ":TSUpdate",
    config = function()
      -- :h vim.treesitter.foldexpr()
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      -- This will respect your foldminlines and foldnestmax settings.

      require("nvim-dap-repl-highlights").setup()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = true,
        auto_pairs = { enable = true },
        autotag = { enable = true },
        context_commentstring = { enable = true },
        ensure_installed = {
          "python",
          "javascript",
          "json",
          "query",
          "vimdoc",
          "vim",
          "lua",
          "luadoc",
          "regex",
          "markdown",
          "markdown_inline",
          "toml",
          "proto",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-a>",
            node_incremental = "<C-a>",
            scope_incremental = "<C-S-a>", -- doesn't work
            node_decremental = "<bs>",
            -- init_selection = "<M-w>",
            -- scope_incremental = "<CR>",
            -- node_incremental = "<Tab>", -- increment to the upper named parent
            -- node_decremental = "<S-Tab>", -- decrement to the previous node
          },
        },
        -- nvim-treesitter-endwise plugin
        endwise = { enable = true },
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
              -- ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
            --       selection_modes = {
            --   ['@parameter.outer'] = 'v', -- charwise
            --   ['@function.outer'] = 'V', -- linewise
            --   ['@class.outer'] = '<c-v>', -- blockwise
            -- },
            include_surrounding_whitespace = false,

            move = {
              enable = true,
              set_jumps = true,
              goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
              },
              goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
              },
              goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
              },
              goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
              },
              -- goto_next = {
              -- 	[""] = "@conditional.outer",
              -- },
              -- goto_previous = {
              -- 	[""] = "@conditional.outer",
              -- },
            },
          },
        },
      })
    end,
  },
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
--     -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
--
--     ---@diagnostic disable-next-line: missing-fields
--     require("nvim-treesitter.configs").setup(opts)
--   end,
-- },

--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
