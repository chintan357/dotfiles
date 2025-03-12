-- TODO: go over other utility plugin provided by mini
return {
  {
    "echasnovski/mini.ai",
    version = false,
    config = function()
      require("mini.ai").setup({ n_lines = 500 })
    end,
  },
  {
    "echasnovski/mini.bufremove",
    version = false,
    config = function()
      require("mini.bufremove").setup()
    end,
  },
}
-- { -- Collection of various small independent plugins/modules
-- 	"echasnovski/mini.nvim",
-- 	config = function()
-- 		-- Better Around/Inside textobjects
-- 		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
-- 		require("mini.ai").setup({ n_lines = 500 })
-- 		-- Add/delete/replace surroundings (brackets, quotes, etc.)
-- 		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
-- 		-- - sd'   - [S]urround [D]elete [']quotes
-- 		-- - sr)'  - [S]urround [R]eplace [)] [']
-- 		require("mini.surround").setup()
--
-- 		local statusline = require("mini.statusline")
-- 		statusline.setup({ use_icons = vim.g.have_nerd_font })
--
-- 		---@diagnostic disable-next-line: duplicate-set-field
-- 		statusline.section_location = function()
-- 			return "%2l:%-2v"
-- 		end
-- 	end,
-- },
