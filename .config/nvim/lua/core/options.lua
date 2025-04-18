local opt = vim.opt
-- local vb = vim.bo
-- local vw = vim.wo

-- vim.g.loaded_perl_provider = 0 -- Do not load Perl
opt.background = "dark"
opt.termguicolors = true
-- opt.cursorlineopt = "screenline,number" -- Highlight the screen line of the cursor with CursorLine and the line number with CursorLineNr
-- opt.emoji = false -- Turn off emojis
-- vw.list = true -- Show some invisible characters like tabs etc

opt.foldmethod = "indent"
opt.foldlevel = 99
opt.foldenable = false
-- vim.opt.fillchars = { fold = " " }
-- opt.foldmethod = "expr"
-- opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- This will respect your foldminlines and foldnestmax settings.
-- g.markdown_folding = 1 -- enable markdown folding

opt.number = true
opt.relativenumber = true

opt.timeout = true
opt.timeoutlen = 300
opt.ttimeoutlen = 10 -- Time in milliseconds to wait for a key code sequence to complete
opt.updatetime = 100 -- If in this many milliseconds nothing is typed, the swap file will be written to disk. Also used for CursorHold autocommand and set to 100 as per https://github.com/antoinemadec/FixCursorHold.nvim

opt.history = 9999
opt.inccommand = "split"                                                   -- nosplit
opt.shell = "/bin/bash"
opt.sessionoptions = "buffers,curdir,folds,resize,tabpages,winpos,winsize" -- Session options to store in the session
-- opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.autowrite = true

opt.ignorecase = true
opt.smartcase = true

opt.scrollbind = false
opt.cursorbind = false

opt.cursorline = true

opt.wrap = false

opt.title = false
opt.showmode = false
opt.showtabline = 0
opt.laststatus = 3
opt.cmdheight = 1
opt.showcmd = false
opt.cmdwinheight = 1
opt.signcolumn = "yes"
opt.conceallevel = 2
opt.linebreak = true -- Wrap lines at convenient points

opt.colorcolumn = "80"
opt.textwidth = 79
opt.winwidth = 30
opt.sidescrolloff = 8 -- The minimal number of columns to keep to the left and to the right of the cursor if 'nowrap' is set
opt.scrolloff = 999
opt.ruler = false     --Disable the default ruler

if vim.fn.exists("syntax_on") ~= 1 then
  vim.cmd([[syntax enable]])
end

-- only set clipboard if not in ssh, to make sure the OSC 52
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.iskeyword:append("-")

opt.splitright = true
opt.splitbelow = true

opt.confirm = true

opt.formatoptions = "jcroqlnt" -- tcqj
-- opt.formatoptions = "qjl1" -- Don't autoformat comments
vim.o.errorformat = vim.o.errorformat .. ",%f:%l"
opt.grepprg = "rg --vimgrep --no-heading"
opt.grepformat = "%f:%l:%c:%m"
-- vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"

-- opt.completeopt = { "menu", "menuone", "noselect" }

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

opt.shiftround = true -- Round indent
opt.numberwidth = 2

opt.splitkeep = "screen"

opt.undolevels = 3333
opt.undoreload = 3333

-- opt.writebackup = false
-- opt.backup = false
-- opt.backupdir = vim.fn.stdpath("data") .. "/backups"

-- opt.swapfile = false
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

-- opt.redrawtime = 1500
-- opt.infercase = true

--eol:¬
-- opt.spelloptions = "camel"

-- local function get_signs(name)
-- 	return function()
-- 		local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
-- 		local it = vim.iter(api.nvim_buf_get_extmarks(bufnr, -1, 0, -1, { details = true, type = "sign" }))
-- 			:find(function(item)
-- 				return item[2] == vim.v.lnum - 1 and item[4].sign_hl_group and item[4].sign_hl_group:find(name)
-- 			end)
-- 		return not it and "  " or "%#" .. it[4].sign_hl_group .. "#" .. it[4].sign_text .. "%*"
-- 	end
-- end
--
-- function _G.show_stc()
-- 	local stc_diagnostic = get_signs("Diagnostic")
-- 	local stc_gitsign = get_signs("GitSign")
--
-- 	local function show_break()
-- 		if vim.v.virtnum > 0 then
-- 			return (" "):rep(math.floor(math.ceil(math.log10(vim.v.lnum))) - 1) .. "↳"
-- 		elseif vim.v.virtnum < 0 then
-- 			return ""
-- 		else
-- 			return vim.v.lnum
-- 		end
-- 	end
-- 	return stc_diagnostic() .. "%=" .. show_break() .. stc_gitsign()
-- end
--
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
--
-- Window options
-- vw.colorcolumn = "80,120" -- Make a ruler at 80px and 120px
-- vw.list = true -- Show some invisible characters like tabs etc
-- vw.numberwidth = 2 -- Make the line number column thinner
---Note: Setting number and relative number gives you hybrid mode
---https://jeffkreeftmeijer.com/vim-number/
-- vw.number = true -- Set the absolute number
-- vw.relativenumber = true -- Set the relative number
-- vw.signcolumn = "yes" -- Show information next to the line numbers
-- vw.wrap = false -- Do not display text over multiple lines

-- Create folders for our backups, undos, swaps and sessions if they don't exist
-- vim.cmd("silent call mkdir(stdpath('data').'/backups', 'p', '0700')")
-- vim.cmd("silent call mkdir(stdpath('data').'/undos', 'p', '0700')")
-- vim.cmd("silent call mkdir(stdpath('data').'/swaps', 'p', '0700')")
-- vim.cmd("silent call mkdir(stdpath('data').'/sessions', 'p', '0700')")

-- Buffer options
-- vb.wrapmargin = 1

-- opt.modelines = 1 -- Only use folding settings for this file
--[[
  NOTE: don't store marks as they are currently broken in Neovim!
  @credit: wincent
]]

-- opt.shada = "!,'0,f0,<50,s10,h"
-- opt.shiftround = true -- Round indent
-- Homedir = os.getenv("HOME")
-- Sessiondir = vim.fn.stdpath("data") .. "/sessions"

-- Discovered it when using vim-forgit https://github.com/ray-x/forgit.nvim/issues/1
-- vim.opt.shellcmdflag = "-ic"

-- editorconfig
--
-- vim.g.loaded_netrw = 0
-- vim.g.loaded_netrwPlugin = 0
-- vim.cmd("let g:netrw_liststyle = 3")
-- vim.cmd("let g:netrw_banner = 0 ")
