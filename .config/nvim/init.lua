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
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  change_detection = {
    enabled = false,
    notify = false,
  },
  checker = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        -- "matchit",
        -- "matchparen",
      },
    },
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
    " ",
    "%<",          -- truncate here if too long
    relative_path, -- filename
    -- "%4* %<%f%*", -- filename
    " ",
    "%h", -- help text indicator
    "%m",
    "  %#Normal#",
    -- "%{%v:lua.require'nvim-navic'.get_location()%}",
    " ",
    "%r",
    "%=", -- alignment break
    "%y",
    " ",
    "%P",
  }
  return table.concat(parts)
end

vim.opt.statusline = "%!v:lua.BuildStatusline()"
