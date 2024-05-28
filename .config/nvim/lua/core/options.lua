local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.timeoutlen = 333
opt.updatetime = 50
opt.history = 9999
opt.inccommand = "split"
opt.shell = "/bin/bash"
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

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
opt.sidescrolloff = 3
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
opt.undolevels = 333
opt.undoreload = 3333

opt.virtualedit = "block"
opt.modeline = false -- opt.modelines = 1
opt.mouse = "a"
opt.smoothscroll = true

vim.cmd("filetype plugin indent on")

-- opt.backup = false
-- opt.writebackup = false
opt.swapfile = false

-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.cmd([[ set guicursor=n-v-c-i:block ]])
vim.cmd("set whichwrap+=<,>,[,],h,l")

opt.wildmode = "longest:full,full"

opt.wildignorecase = true
vim.opt.wildignore:append({
	"*~",
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
