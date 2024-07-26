local vb = vim.bo
local vw = vim.wo
local vo = vim.opt

vim.g.loaded_perl_provider = 0 -- Do not load Perl

local opt = vim.opt

-- vo.background = "dark"
-- vo.cursorlineopt = "screenline,number" -- Highlight the screen line of the cursor with CursorLine and the line number with CursorLineNr
-- vo.emoji = false -- Turn off emojis
-- vw.list = true -- Show some invisible characters like tabs etc
-- vo.fillchars = {
-- 	fold = " ",
-- 	foldopen = "",
-- 	foldclose = "",
-- 	foldsep = " ",
-- 	diff = "╱",
-- 	eob = " ",
-- }

opt.relativenumber = true
opt.number = true
opt.timeout = true
opt.timeoutlen = 333
opt.ttimeoutlen = 10 -- Time in milliseconds to wait for a key code sequence to complete
opt.updatetime = 100 -- If in this many milliseconds nothing is typed, the swap file will be written to disk. Also used for CursorHold autocommand and set to 100 as per https://github.com/antoinemadec/FixCursorHold.nvim
opt.history = 9999
opt.inccommand = "split"
opt.shell = "/bin/bash"
opt.sessionoptions = "buffers,curdir,folds,resize,tabpages,winpos,winsize" -- Session options to store in the session

opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

opt.autowrite = true
opt.expandtab = true
opt.ignorecase = true
opt.smartcase = true
opt.smartindent = true
opt.scrollbind = false
opt.cursorbind = false
opt.cursorline = true
opt.wrap = false

opt.title = false
opt.showmode = false
opt.showtabline = 0
opt.laststatus = 3
opt.cmdheight = 0
opt.showcmd = false
opt.cmdwinheight = 1
opt.signcolumn = "yes"
opt.conceallevel = 2
opt.linebreak = true

opt.colorcolumn = "80"
opt.textwidth = 79
opt.winwidth = 30
-- opt.sidescrolloff = 3
vo.sidescrolloff = 8 -- The minimal number of columns to keep to the left and to the right of the cursor if 'nowrap' is set
opt.scrolloff = 10
opt.ruler = false

if vim.fn.exists("syntax_on") ~= 1 then
	vim.cmd([[syntax enable]])
end

opt.clipboard:append("unnamedplus")
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

opt.completeopt = "menu,menuone,noselect"
opt.pumblend = 10
opt.pumheight = 10
opt.winblend = 0

opt.shiftround = true
opt.numberwidth = 2

opt.splitkeep = "screen"

opt.undofile = true
opt.undolevels = 666
opt.undoreload = 3333
opt.backupdir = vim.fn.stdpath("data") .. "/backups" -- Use backup files
opt.directory = vim.fn.stdpath("data") .. "/swaps" -- Use Swap files
opt.undodir = vim.fn.stdpath("data") .. "/undos" -- Set the undo directory

opt.virtualedit = "block"
opt.modeline = false -- opt.modelines = 1
opt.mouse = "a"
opt.smoothscroll = true

vim.cmd("filetype plugin indent on")

-- opt.backup = false
-- opt.writebackup = false
-- opt.swapfile = false

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

opt.foldcolumn = "1" -- '0' is not bad
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

vim.cmd([[ set guicursor=n-v-c-i:block ]])
vim.cmd("set whichwrap+=<,>,[,],h,l")

-- opt.wildmode = "longest:full,full"
opt.wildmode = "list:longest" -- Command-line completion mode

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

opt.redrawtime = 1500
opt.infercase = true

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

-- opt.shortmess = "aoOTIcF"
-- vim.g.markdown_recommended_style = 0
-- vim.opt.isfname:append("@-@")
-- opt.fillchars = "eob: " -- Don't show `~` outside of buffer
-- opt.breakindent = true
-- opt.langnoremap = false
-- opt.foldlevelstart = 99
-- opt.shortmess:append({ W = true, I = true, c = true, C = true })
-- opt.spelllang = { "en" }
vo.shortmess = {
	A = true, -- ignore annoying swap file messages
	c = true, -- Do not show completion messages in command line
	F = true, -- Do not show file info when editing a file, in the command line
	I = true, -- Do not show the intro message
	W = true, -- Do not show "written" in command line when writing
}
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
vim.cmd("silent call mkdir(stdpath('data').'/backups', 'p', '0700')")
vim.cmd("silent call mkdir(stdpath('data').'/undos', 'p', '0700')")
vim.cmd("silent call mkdir(stdpath('data').'/swaps', 'p', '0700')")
vim.cmd("silent call mkdir(stdpath('data').'/sessions', 'p', '0700')")

-- Buffer options
-- vb.autoindent = true
-- vb.expandtab = true -- Use spaces instead of tabs
-- vb.shiftwidth = 4 -- Size of an indent
-- vb.smartindent = true -- Insert indents automatically
-- vb.softtabstop = 4 -- Number of spaces tabs count for
-- vb.tabstop = 4 -- Number of spaces in a tab
-- vb.wrapmargin = 1

-- vo.modelines = 1 -- Only use folding settings for this file
--[[
  NOTE: don't store marks as they are currently broken in Neovim!
  @credit: wincent
]]

-- vo.shada = "!,'0,f0,<50,s10,h"
-- vo.shiftround = true -- Round indent
-- Homedir = os.getenv("HOME")
-- Sessiondir = vim.fn.stdpath("data") .. "/sessions"
