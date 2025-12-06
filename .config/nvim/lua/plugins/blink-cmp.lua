return {
  "saghen/blink.cmp",
  dependencies = {
    { "L3MON4D3/LuaSnip", version = "v2.*" },
    { "folke/lazydev.nvim" },
  },
  event = "InsertEnter",
  version = "1.*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- enabled = function()
    --   return vim.b.completion ~= false
    -- end,
    keymap = { preset = "default" },
    appearance = {
      nerd_font_variant = "mono", -- 'normal'
    },
    completion = {
      accept = { auto_brackets = { enabled = false } },
      keyword = { range = "full" },
      menu = {
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind" },
          },
        },
      },
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      ghost_text = { enabled = true },
    },
    signature = { enabled = true },
    snippets = { preset = "luasnip" },

    sources = {
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },

      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
