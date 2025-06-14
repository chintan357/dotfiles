return {
  -- { "L3MON4D3/LuaSnip", keys = {} },
  'saghen/blink.cmp',
  dependencies = {
    { 'rafamadriz/friendly-snippets' },
    { "L3MON4D3/LuaSnip",            keys = {} },
    { "folke/lazydev.nvim" },
    {
      "saghen/blink.compat",
      optional = true, -- make optional so it's only enabled if any extras need it
      opts = {},
      version = "*",
    },
  },
  event = "InsertEnter",

  version = '1.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    -- See :h blink-cmp-config-keymap for defining your own keymap
    -- keymap = { preset = 'default' },
    -- keymap = {
    --   ["<C-f>"] = {},
    -- },

    appearance = {
      nerd_font_variant = 'mono', -- 'normal'
      -- use_nvim_cmp_as_default = false,
    },

    completion = {
      accept = {
        -- experimental auto-brackets support
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        -- border = nil,
        -- scrolloff = 1,
        -- scrollbar = false,
        draw = {
          treesitter = { "lsp" },
          -- columns = {
          --   { "kind_icon" },
          --   { "label",      "label_description", gap = 1 },
          --   { "kind" },
          --   { "source_name" },
          -- },
        },
      },
      documentation = {
        window = {
          border = nil,
          scrollbar = false,
          winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
        },
        auto_show = true,
        auto_show_delay_ms = 200, -- 500
      },
      ghost_text = {
        enabled = vim.g.ai_cmp,
      },
    },
    -- experimental signature help support
    signature = { enabled = true },
    snippets = { preset = "luasnip" },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      -- adding any nvim-cmp sources here will enable them
      -- with blink.compat
      compat = {},
      per_filetype = {
        codecompanion = { "codecompanion" },
      },
      providers = {
        cmdline = {
          min_keyword_length = 2,
        },
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
      },

      default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
    },
    cmdline = {
      enabled = false,
      -- completion = { menu = { auto_show = true } },
      -- keymap = {
      --   ["<CR>"] = { "accept_and_enter", "fallback" },
      -- },
    },

    -- keymap = {
    --   --   preset = "enter",
    --   --   ["<C-y>"] = { "select_and_accept" },
    -- },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" },
  ---@param opts blink.cmp.Config | { sources: { compat: string[] } }
  config = function(_, opts)
    -- setup compat sources
    -- local enabled = opts.sources.default
    -- for _, source in ipairs(opts.sources.compat or {}) do
    --   opts.sources.providers[source] = vim.tbl_deep_extend(
    --     "force",
    --     { name = source, module = "blink.compat.source" },
    --     opts.sources.providers[source] or {}
    --   )
    --   if type(enabled) == "table" and not vim.tbl_contains(enabled, source) then
    --     table.insert(enabled, source)
    --   end
    -- end

    -- add ai_accept to <Tab> key
    -- if not opts.keymap["<Tab>"] then
    --   if opts.keymap.preset == "super-tab" then -- super-tab
    --     opts.keymap["<Tab>"] = {
    --       require("blink.cmp.keymap.presets")["super-tab"]["<Tab>"][1],
    --       LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
    --       "fallback",
    --     }
    --   else -- other presets
    --     opts.keymap["<Tab>"] = {
    --       LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
    --       "fallback",
    --     }
    --   end
    -- end

    -- Unset custom prop to pass blink.cmp validation
    opts.sources.compat = nil

    -- vim.cmd('highlight Pmenu guibg=none')
    -- vim.cmd('highlight PmenuExtra guibg=none')
    -- vim.cmd('highlight FloatBorder guibg=none')
    -- vim.cmd('highlight NormalFloat guibg=none')

    require("luasnip.loaders.from_vscode").lazy_load()
    require("blink.cmp").setup(opts)
  end,
}
