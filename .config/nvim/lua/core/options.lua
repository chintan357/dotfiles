local opt = vim.opt
-- local vb = vim.bo
-- local vw = vim.wo

opt.number = true
opt.relativenumber = true

opt.termguicolors = true

opt.timeoutlen = 300
opt.ttimeoutlen = 10

opt.inccommand = "split"

opt.sessionoptions = "buffers,curdir,folds,resize,tabpages,winsize,help,skiprtp"

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.shiftround = true
opt.numberwidth = 2

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.wrap = false
opt.linebreak = true

opt.title = false
opt.showmode = false
opt.showtabline = 0
opt.laststatus = 3
opt.cmdheight = 1
opt.showcmd = false
opt.cmdwinheight = 1
opt.signcolumn = "yes"
opt.conceallevel = 2

opt.colorcolumn = "80"
opt.textwidth = 79
opt.winwidth = 30
opt.sidescrolloff = 8
opt.scrolloff = 999
opt.ruler = false

vim.cmd.syntax("enable")
-- vim.cmd([[syntax enable]])

-- only set clipboard if not in ssh, to make sure the OSC 52
-- opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.clipboard = "unnamedplus"
-- opt.iskeyword:append("-")

opt.splitright = true
opt.splitbelow = true

opt.confirm = true

opt.formatoptions = "jcoqlnt" -- tr1
vim.o.errorformat = vim.o.errorformat .. ",%f:%l"
opt.grepprg = "rg --vimgrep --no-heading"
opt.grepformat = "%f:%l:%c:%m"

opt.completeopt = { "menu", "menuone", "noselect" }

opt.shortmess:append({
  -- 	A = true, -- ignore annoying swap file messages
  c = true, -- Do not show completion messages in command line
  I = true, -- Do not show the intro message
  W = true, -- Do not show "written" in command line when writing
})

opt.pumblend = 10
opt.pumheight = 10
opt.winblend = 0

opt.splitkeep = "screen"

opt.autowrite = true
-- opt.swapfile = false
opt.updatetime = 300
opt.backup = false

opt.undolevels = 3333
opt.undoreload = 3333

-- opt.writebackup = false
-- opt.backupdir = vim.fn.stdpath("data") .. "/backups"
-- opt.directory = vim.fn.stdpath("data") .. "/swaps"

opt.virtualedit = "block"
opt.modeline = false -- opt.modelines = 1
opt.mouse = "a"

vim.cmd("filetype plugin indent on")

-- vim.cmd([[ set guicursor=n-v-c-i:block ]])
opt.guicursor = ""

opt.wildmode = "longest:full,full" -- Command-line completion mode
-- opt.wildmode = "list:longest"

opt.wildignorecase = true
opt.wildignore:append({
  "*~",
  "*/.git/*",
  "*/node_modules/*",
  "*.pyc",
  "*.o",
  "*.obj",
  "*.rbc",
  "__pycache__",
  "*swp",
  "*.class",
  "*.so",
  "*.exe",
})

opt.jumpoptions = "view"

opt.foldlevel = 99
opt.foldenable = false
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.opt.isfname:append("@-@")

-- vim.g.markdown_folding = 1 -- enable markdown folding

-- vim.opt.fillchars = { fold = " " }

-- opt.lazyredraw = true -- Improve performance during macros
-- opt.redrawtime = 1500
-- opt.infercase = true

-- opt.spelloptions = "camel"

-- vim.opt.stc = "%!v:lua.show_stc()"
-- if vim.fn.executable("rg") == 1 then
-- 	opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
-- 	opt.grepprg = "rg --vimgrep --no-heading --smart-case"
-- end

-- vim.g.markdown_recommended_style = 0
-- vim.g.editorconfig = true

-- vim.opt.winborder = "rounded" -- solid
-- vim.opt.winborder = "single" -- https://neovim.io/doc/user/options.html#'winborder'

-- opt.fillchars = "eob: " -- Don't show `~` outside of buffer
-- opt.breakindent = true
-- opt.langnoremap = false
-- opt.spelllang = { "en" }

-- Create folders for our backups, undos, swaps and sessions if they don't exist
-- vim.cmd("silent call mkdir(stdpath('data').'/backups', 'p', '0700')")
-- vim.cmd("silent call mkdir(stdpath('data').'/undos', 'p', '0700')")
-- vim.cmd("silent call mkdir(stdpath('data').'/swaps', 'p', '0700')")
-- vim.cmd("silent call mkdir(stdpath('data').'/sessions', 'p', '0700')")

-- Buffer options
-- vb.wrapmargin = 1

-- opt.modelines = 1 -- Only use folding settings for this file
-- opt.shada = "!,'0,f0,<50,s10,h"

-- Discovered it when using vim-forgit https://github.com/ray-x/forgit.nvim/issues/1
-- vim.opt.shellcmdflag = "-ic"
