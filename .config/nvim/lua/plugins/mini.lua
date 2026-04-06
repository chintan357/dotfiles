return {
  -- {
  --   "nvim-mini/mini.ai",
  --   config = function()
  --     require("mini.ai").setup({ n_lines = 500 })
  --   end,
  -- },
  -- {
  --   "nvim-mini/mini.bufremove",
  --   config = function()
  --     require("mini.bufremove").setup()
  --   end,
  -- },
  -- {
  --   "nvim-mini/mini.surround",
  --   config = function()
  --     require("mini.surround").setup()
  --   end,
  -- },
  {
    "nvim-mini/mini.tabline",
    config = function()
      require("mini.tabline").setup()
    end,
  },
  {
    "nvim-mini/mini.statusline",
    config = function()
      local statusline = require("mini.statusline")
      statusline.section_location = function()
        return "%2l:%-2v"
      end
      statusline.setup({ use_icons = vim.g.have_nerd_font })
    end,
  },
  -- {
  --   "nvim-mini/mini.pairs",
  --   config = function()
  --     require("mini.pairs").setup()
  --   end,
  -- },
  -- {
  --   "nvim-mini/mini.hipatterns",
  --   config = function()
  --     require("mini.hipatterns").setup()
  --   end,
  -- },
}

-- return {
--   "nvim-mini/mini.nvim",
--   version = false,
--   config = function()
--     require("mini.ai").setup({ n_lines = 500 })
--     require("mini.bufremove").setup()
--     require("mini.surround").setup()
--     require("mini.pairs").setup()
--     require("mini.tabline").setup()
--     require("mini.hipatterns").setup()
--     -- require("mini.statusline").setup()
--     -- require("mini.diff").setup()
--     -- require("mini.jump").setup()
--     -- require("mini.jump2d").setup()
--     -- require("mini.bracketed").setup()
--     -- mini.trailspace
--     -- mini.sessions
--     -- mini.visits
--     -- mini.git
--     -- mini.basics
--     -- mini.align
--     -- mini.comment
--     -- mini.operators
--     -- mini.splitjoin
--
--     -- local statusline = require("mini.statusline")
--     -- statusline.setup({ use_icons = vim.g.have_nerd_font })
--
--     -- ---@diagnostic disable-next-line: duplicate-set-field
--     -- statusline.section_location = function()
--     --   return "%2l:%-2v"
--     -- end
--   end,
-- }
-- -- Better Around/Inside textobjects
-- --  - yinq - [Y]ank [I]nside [N]ext [Q]uote

-- -- {
-- --   "nvim-mini/mini.diff",
-- --   config = function()
-- --     local diff = require("mini.diff")
-- --     diff.setup({
-- --       -- Disabled by default
-- --       source = diff.gen_source.none(),
-- --     })
-- --   end,
-- -- },
