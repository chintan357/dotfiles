return { -- Collection of various small independent plugins/modules
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.ai").setup({ n_lines = 500 })
    require("mini.bufremove").setup()
    require("mini.surround").setup()
    require("mini.pairs").setup()
    require("mini.diff").setup()
    require("mini.tabline").setup()
    require("mini.statusline").setup()
    require("mini.hipatterns").setup()
    -- require("mini.jump").setup()
    -- require("mini.jump2d").setup()
    -- require("mini.bracketed").setup()
    -- mini.trailspace
    -- mini.sessions
    -- mini.visits
    -- mini.git
    -- mini.basics
    -- mini.align
    -- mini.comment
    -- mini.operators
    -- mini.splitjoin

    -- local statusline = require("mini.statusline")
    -- statusline.setup({ use_icons = vim.g.have_nerd_font })

    -- ---@diagnostic disable-next-line: duplicate-set-field
    -- statusline.section_location = function()
    --   return "%2l:%-2v"
    -- end
  end,
}
-- Better Around/Inside textobjects
--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
-- Add/delete/replace surroundings (brackets, quotes, etc.)
-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
-- - sd'   - [S]urround [D]elete [']quotes
-- - sr)'  - [S]urround [R]eplace [)] [']
