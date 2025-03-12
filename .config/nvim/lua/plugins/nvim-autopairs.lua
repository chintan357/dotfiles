-- https://github.com/windwp/nvim-autopairs?tab=readme-ov-file#you-need-to-add-mapping-cr-on-nvim-cmp-setupcheck-readmemd-on-nvim-cmp-repo
-- TODO: check the docs
return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = { "hrsh7th/nvim-cmp" },
  opts = {
    check_ts = true,
    enable_moveright = true,
    fast_wrap = {
      map = "<c-e>",
    },
    ts_config = {
      lua = { "string" },              -- don't add pairs in lua string treesitter nodes
      javascript = { "template_string" }, -- don't add pairs in javascript template_string
    },
  },
  -- config = function()
  --   require('nvim-autopairs').setup {}
  --   -- If you want to automatically add `(` after selecting a function or method
  --   local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
  --   local cmp = require 'cmp'
  --   cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  -- end,
}
