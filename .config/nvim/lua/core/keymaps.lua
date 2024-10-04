function keymap(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

keymap("n", "<Esc>", ":nohls<CR>")

keymap("n", "N", [[v:searchforward ? 'Nzz' : 'nzz']], { expr = true })
keymap("n", "n", [[v:searchforward ? 'nzz' : 'Nzz']], { expr = true })

keymap("v", "v", "<C-v>")

keymap("n", "+", "<C-a>")
keymap("n", "-", "<C-x>")

keymap("n", "<leader>_", "<c-W>s")
keymap("n", "<leader>|", "<C-W>v")

keymap("n", "<leader>ww", "<C-W>w")
keymap("n", "<leader>we", "<C-W>c")
keymap("n", "<leader>s-", ":close<CR>")
keymap("n", "<leader>s=", "<C-w>=")

keymap("n", "<C-c>", "<cmd>bd<CR>")
keymap("n", "<C-q>", "<cmd>q<CR>")
keymap("n", "<leader>bd", ":bd<CR>")
keymap("n", "<leader>qq", ":qa<CR>")
keymap("n", "<leader>Q", ":qa!<CR>")

keymap("n", "<leader>`", "<cmd>e #<cr>")

keymap("n", "<leader><tab>o", ":tabnew<CR>")
keymap("n", "<leader><tab>l", "<cmd>tabnext<cr>")
keymap("n", "<leader><tab>h", "<cmd>tabprevious<cr>")
keymap("n", "<leader><tab>d", "<cmd>tabclose<cr>")

-- keymap("n", "==", "gg<S-v>G")

keymap("n", "J", "mzJ`z")

keymap("n", "<leader>qo", ":copen<CR>")

keymap("n", "U", "<C-r>", {})

keymap("v", "K", ":m '<-2<CR>gv=gv")
keymap("v", "J", ":m '>+1<CR>gv=gv")

keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

keymap("n", "<S-l>", ":bnext<cr>")
keymap("n", "<S-h>", ":bprevious<cr>")

-- vim.cmd("command! W execute 'w !sudo tee % > /dev/null' <bar> edit!")

-- keymap("n", "<leader>mx", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })

keymap({ "n", "v" }, "gg", "gg0")
keymap({ "n", "v" }, "G", "G$")
keymap("n", "d,", "d$")
keymap("n", "c,", "c$")
keymap("n", "y,", "y$")
keymap({ "x", "v" }, ",", "$")

-- stylua: ignore start


vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { silent = true })
vim.api.nvim_set_keymap("v", "<C-_>", "gc", { silent = true })

keymap("n", "gx", ":!open <c-r><c-a><CR>")

local opts = { buffer = 0 }
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)

vim.keymap.set("c", "<C-a>", "<Home>")
vim.keymap.set("c", "<C-h>", "<Up>")
vim.keymap.set("c", "<C-l>", "<Down>")

local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
-- keymap("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
-- [e is also mapped inside vim-unimpaired
keymap("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
keymap("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
keymap("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
keymap("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })

keymap("n", "gV", "`[V`]")
keymap("n", "gl", "`.zz")

keymap("n", "<leader><Enter>", "!!bash<CR>")

vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("n", ":", ";", { noremap = true })
-- vim.keymap.set("n", ";", ":")
-- vim.keymap.set("n", ":", ";")

keymap("n", "<leader>M", "mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm")

keymap("n", "<leader>8", ":%s/")
keymap("n", "<leader>*", "yiw :%s/<C-r>0/")
keymap("n", "<leader>c8", ":.s/")
keymap("n", "<leader>c*", "yiw :.s/<C-r>0/")
-- keymap("n", "<leader>rw", ":%s/\\<<c-r><c-w>\\>/")
-- keymap("n", "<leader><leader>8", ":argdo %s/")
-- keymap("n", "<leader><leader>*", "yiw :argdo %s/<C-r>0/")

keymap("n", "<leader>-", ":!")
keymap("n", "<leader><leader>k", ":sp | hor resize 10 | term<CR> A")

keymap("n", "<leader>so", function()
  vim.cmd("so %")
end)

keymap("n", "<leader>gb", ":GitBlameToggle<CR>")

keymap("n", "yod", "<cmd>lua if vim.diagnostic.is_enabled() then vim.diagnostic.enable(false) else vim.diagnostic.enable(true) end<CR>")
keymap("n", "yoT", function() if vim.b.ts_highlight then vim.treesitter.stop() else vim.treesitter.start() end end, { desc = "Toggle Treesitter Highlight" })

keymap("n", "<leader>yF",
  function()
    local filename = vim.fn.expand("%")
    local lineno = vim.fn.line(".")
    vim.fn.setreg("+", filename .. ":" .. lineno)
  end)
keymap("n", "<leader>yf", function()
  local filename = vim.fn.expand("%")
  vim.fn.setreg("+", filename)
end)

-- keymap("n", "<C-,>", "<c-w>5>")
-- keymap("n", "<C-.>", "<c-w>5<")
-- keymap("n", "<C-,>", "<C-W>5-")
-- keymap("n", "<C-.>", "<C-W>5+")

-- keymap("i", "", "<cmd>lua vim.lsp.buf.completion()<CR>")
-- keymap("i", "<C-Y>", "<C-X><C-O>")

-- keymap.set("n", "<leader>ss", ":setlocal spell! spelllang=en_us<CR>", { noremap = true })
-- keymap.set("n", "<leader>sn", "]s", { noremap = true })
-- keymap.set("n", "<leader>sp", "[s", { noremap = true })
-- keymap.set("n", "<leader>sa", "zg", { noremap = true })
-- keymap.set("n", "<leader>s?", "z=", { noremap = true })

-- keymap("n", "<leader>oc", "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>", { desc = "Obsidian Check Checkbox" })
-- keymap("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "Insert Obsidian Template" })
-- keymap("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "Open in Obsidian App" })
-- keymap("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Show ObsidianBacklinks" })
-- keymap("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "Show ObsidianLinks" })
-- keymap("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Create New Note" })
-- keymap("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search Obsidian" })
-- keymap("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Quick Switch" })
-- keymap("n", "gf", function()
-- 	if require("obsidian").util.cursor_on_markdown_link() then
-- 		return "<cmd>ObsidianFollowLink<CR>"
-- 	else
-- 		return "gf"
-- 	end
-- end, { noremap = false, expr = true })

-- Toggle autocompletion
-- vim.keymap.set("n", "<leader>ua", ":lua ToggleAutocompletion()<CR>", { noremap = true })
-- function ToggleAutocompletion()
-- 	if vim.bo.omnifunc == "omni#complete#TextComplete" then
-- 		vim.bo.omnifunc = ""
-- 		print("Autocompletion disabled")
-- 	else
-- 		vim.bo.omnifunc = "omni#complete#TextComplete"
-- 		print("Autocompletion enabled")
-- 	end
-- end
--
-- Clear search, diff update and redraw
-- map(
--   "n",
--   "<leader>ur",
--   "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
--   { desc = "Redraw / Clear hlsearch / Diff Update" }
-- )
--
-- Add undo break-points
-- map("i", ",", ",<c-g>u")
-- map("i", ".", ".<c-g>u")
-- map("i", ";", ";<c-g>u")
--
-- Discovered it when using vim-forgit https://github.com/ray-x/forgit.nvim/issues/1
-- vim.opt.shellcmdflag = "-ic"

-- keymap("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
-- vim.g.undotree_SetFocusWhenToggle = 0
--

-- function _G.map(mapping, opts)
--     vim.keymap.set(
--         mapping[1],
--         mapping[2],
--         mapping[3],
--         vim.tbl_extend('keep', opts or {}, { silent = true })
--     )
-- end

-- function _G.bmap(mapping, opts)
--     _G.map(mapping, vim.tbl_extend('force', opts or {}, { buffer = 0 }))
-- end

-- map({
--     'n',
--     'gx',
--     function()
--         local url = vim.fn.expand('<cfile>', nil)
--
--         if not url:match('https') and url:match('/') then
--             url = 'https://github.com/' .. url
--         end
--
--         vim.fn.jobstart({ vim.env.BROWSER, url })
--     end,
-- })

-- map({
--     'n',
--     '<leader>r',
--     function()
--         vim.cmd('sil !mux file %')
--     end,
-- })

-- map({ 'x', 'p', '"_dp' })
-- map({ 'x', 'P', '"_dP' })
-- keymap.set("n", "x", '"_x')

-- for key, keymap in pairs({ b = 'b', q = 'c', l = 'l' }) do
--     map({ 'n', ('[%s'):format(key), ('<cmd>%sprev<cr>'):format(keymap) })
--     map({ 'n', (']%s'):format(key), ('<cmd>%snext<cr>'):format(keymap) })
-- end
--
-- -- Replace word under cursor across entire buffer
-- keymap(
--   "n",
--   "<leader>s",
--   [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
--   { desc = "Replace word under cursor" }
-- )

-- tnoremap <BS> <C-\><C-n>:echo "Backspace pressed in terminal mode"<CR>
-- keymap.set("n", "<C-a>", "gg<S-v>G")

-- keymap("n", "<leader>cp", ":diffput<CR>") -- put diff from current to other during diff
-- keymap("n", "<leader>ch", ":diffget 1<CR>") -- get diff from left (local) during merge
-- keymap("n", "<leader>cl", ":diffget 3<CR>") -- get diff from right (remote) during merge
-- keymap("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })
