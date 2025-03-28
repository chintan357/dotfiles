vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.g.have_nerd_font = true

require("core.keymaps")
require("core.options")
require("core.autocommands")
require("custom.terminalpop")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
    -- vim.api.nvim_echo({
    -- 	{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
    -- 	{ out, "WarningMsg" },
    -- 	{ "\nPress any key to exit..." },
    -- }, true, {})
    -- vim.fn.getchar()
    -- os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  change_detection = {
    enabled = true,
    notify = false,
  },
  -- checker = {
  --   enabled = true, -- check for plugin updates periodically
  --   notify = false, -- notify on update
  -- },              -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
-- require("lazy").setup(
--     {
--         { import = "x.y.z" },
--     },
--     {
--         checker = {
--             enabled = true,
--             notify = false,
--         },
--     }
-- )

-- local currentmode = {
-- 	n = "N",
-- 	v = "V",
-- 	V = "VL",
-- 	[""] = "VB",
-- 	i = "I",
-- 	R = "R",
-- 	c = "C",
-- 	["r?"] = "Confirm",
-- 	t = "T",
-- }
--
-- -- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
--
-- BuildStatusline = function()
-- 	local vim_mode = currentmode[vim.fn.mode()] or "?"
-- 	local relative_path = vim.fn.expand("%:~:.")
-- 	local parts = {
-- 		-- "%n",
-- 		"[",
-- 		vim_mode,
-- 		"]",
-- 		-- " ",
-- 		-- "%<", -- truncate here if too long
-- 		-- relative_path, -- filename
-- 		-- " ",
-- 		"%h", -- help text indicator
-- 		-- "%m",
-- 		"  %#Normal#",
-- 		"%{%v:lua.require'nvim-navic'.get_location()%}",
-- 		" ",
-- 		"%r",
-- 		"%=", -- alignment break
-- 		"%y",
-- 		" ",
-- 		"%P",
-- 	}
-- 	return table.concat(parts)
-- end
-- -- set statusline +=%4*\ %<%f%*            "full path
-- -- set statusline +=%1*%v\ %*             "virtual column number
--
-- vim.opt.statusline = "%!v:lua.BuildStatusline()"
