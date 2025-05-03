local opt = vim.opt
-- local vb = vim.bo
-- local vw = vim.wo

opt.number = true
opt.relativenumber = true

opt.background = "dark"
opt.termguicolors = true

opt.timeoutlen = 300
opt.ttimeoutlen = 10                                                       -- Time in milliseconds to wait for a key code sequence to complete
opt.updatetime = 100                                                       -- If in this many milliseconds nothing is typed, the swap file will be written to disk. Also used for CursorHold autocommand and set to 100 as per https://github.com/antoinemadec/FixCursorHold.nvim

opt.inccommand = "split"                                                   -- nosplit

opt.sessionoptions = "buffers,curdir,folds,resize,tabpages,winpos,winsize" -- Session options to store in the session
-- opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.shiftround = true -- Round indent
opt.numberwidth = 2

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.wrap = false
opt.linebreak = true -- Wrap lines at convenient points

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
opt.sidescrolloff = 8 -- The minimal number of columns to keep to the left and to the right of the cursor if 'nowrap' is set
opt.scrolloff = 999
opt.ruler = false     --Disable the default ruler

-- opt.lazyredraw = true -- Improve performance during macros

if vim.fn.exists("syntax_on") ~= 1 then
  vim.cmd([[syntax enable]])
end

-- only set clipboard if not in ssh, to make sure the OSC 52
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
-- opt.iskeyword:append("-")

opt.splitright = true
opt.splitbelow = true

opt.confirm = true

opt.formatoptions = "jcroqlnt" -- tcqj
-- opt.formatoptions = "qjl1" -- Don't autoformat comments
vim.o.errorformat = vim.o.errorformat .. ",%f:%l"
opt.grepprg = "rg --vimgrep --no-heading"
opt.grepformat = "%f:%l:%c:%m"
-- vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"

opt.completeopt = { "menu", "menuone", "noselect" }

opt.shortmess:append("c")
-- opt.shortmess = "aoOTIcF"
-- opt.shortmess:append({ W = true, I = true, c = true, C = true })
-- opt.shortmess = {
-- 	A = true, -- ignore annoying swap file messages
-- 	c = true, -- Do not show completion messages in command line
-- 	F = true, -- Do not show file info when editing a file, in the command line
-- 	I = true, -- Do not show the intro message
-- 	W = true, -- Do not show "written" in command line when writing
-- }

opt.pumblend = 10  -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.winblend = 0


opt.splitkeep = "screen"

opt.autowrite = true
opt.swapfile = false
opt.backup = false

opt.undolevels = 3333
opt.undoreload = 3333

-- opt.writebackup = false
-- opt.backupdir = vim.fn.stdpath("data") .. "/backups"
-- opt.directory = vim.fn.stdpath("data") .. "/swaps"

opt.virtualedit = "block"
opt.modeline = false    -- opt.modelines = 1
opt.mouse = "a"
opt.smoothscroll = true -- TODO: is this needed?

vim.cmd("filetype plugin indent on")

-- vim.cmd([[ set guicursor=n-v-c-i:block ]])
vim.opt.guicursor = ""
vim.cmd("set whichwrap+=<,>,[,],h,l")

-- opt.wildmode = "list:longest" -- Command-line completion mode
opt.wildmode = "longest:full,full" -- Command-line completion mode

opt.wildignorecase = true
opt.wildignore:append({
  "*~",
  "*/.git/*",
  "*/node_modules/*",
  "*.pyc",
  "*/.git/*",
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

-- vim.g.markdown_folding = 1 -- enable markdown folding

-- vim.opt.fillchars = { fold = " " }

-- opt.redrawtime = 1500
-- opt.infercase = true

-- opt.spelloptions = "camel"

-- vim.opt.stc = "%!v:lua.show_stc()"
-- if vim.fn.executable("rg") == 1 then
-- 	opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
-- 	opt.grepprg = "rg --vimgrep --no-heading --smart-case"
-- end

-- vim.g.markdown_recommended_style = 0

-- vim.opt.isfname:append("@-@")

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

-- editorconfig
-- vim.g.loaded_netrw = 0
-- vim.g.loaded_netrwPlugin = 0
-- vim.cmd("let g:netrw_liststyle = 3")
-- vim.cmd("let g:netrw_banner = 0 ")
