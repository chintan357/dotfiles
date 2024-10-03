vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- vim.g.python3_host_prog = vim.fn.expand("~/.pyenv/versions/3.11.8/bin/python3.11")
vim.g.have_nerd_font = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("core.keymaps")
require("core.options")
require("core.autocommands")

require("lazy").setup("plugins", {
  change_detection = {
    enabled = true,
    notify = false,
  },
})

local currentmode = {
  n = "N",
  v = "V",
  V = "VL",
  [""] = "VB",
  i = "I",
  R = "R",
  c = "C",
  ["r?"] = "Confirm",
  t = "T",
}

-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

BuildStatusline = function()
  local vim_mode = currentmode[vim.fn.mode()] or "?"
  local relative_path = vim.fn.expand("%:~:.")
  local parts = {
    -- "%n",
    "[",
    vim_mode,
    "]",
    -- " ",
    -- "%<", -- truncate here if too long
    -- relative_path, -- filename
    -- " ",
    "%h", -- help text indicator
    -- "%m",
    "  %#Normal#",
    "%{%v:lua.require'nvim-navic'.get_location()%}",
    " ",
    "%r",
    "%=", -- alignment break
    "%y",
    " ",
    "%P",
  }
  return table.concat(parts)
end
-- set statusline +=%4*\ %<%f%*            "full path
-- set statusline +=%1*%v\ %*             "virtual column number

vim.opt.statusline = "%!v:lua.BuildStatusline()"
