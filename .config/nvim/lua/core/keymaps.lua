local keymap = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true } -- is noremap default option while setting keymaps?
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

keymap("n", "<Esc>", ":nohls<CR>")

vim.keymap.set("n", ":", ";", { noremap = true })
vim.keymap.set({ "n", "v" }, ";", ":", { noremap = true })

-- better up/down
keymap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- keymap("n", "j", "jzz")
-- keymap("n", "k", "kzz")
keymap("n", "n", "nzz")
keymap("n", "N", "Nzz")
-- vim.cmd([[nnoremap <leader>zz :let &l:scrolloff=999-&l:scrolloff<CR>]])

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
keymap("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
keymap("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
keymap("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
keymap("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
keymap("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
keymap("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

keymap("v", "v", "<C-v>")

-- keymap("n", "+", "<C-a>")
-- keymap("n", "-", "<C-x>")

keymap("n", "<leader>_", "<c-W>s")
keymap("n", "<leader>|", "<C-W>v")
keymap("n", "<leader>we", "<C-W>c")
keymap("n", "<leader>se", "<C-w>=")

keymap("n", "Q", "<cmd>bd<CR>")
keymap("n", "<leader>Q", ":qa!<CR>")
keymap("n", "<leader>qq", ":qa<CR>")

keymap("n", "<leader><tab>o", ":tabnew<CR>")
-- keymap("n", "", "<cmd>tabclose<cr>")

-- keymap("n", "==", "gg<S-v>G")

keymap("n", "J", "myJ`y")

keymap("n", "<leader>qo", ":copen<CR>")

keymap("n", "U", "<C-r>")

-- Move Lines (in insert mode pressing esc then j -> moves line)
-- keymap("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
-- keymap("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
-- keymap("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
-- keymap("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
-- keymap("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
-- keymap("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
keymap("v", "K", ":m '<-2<CR>gv=gv")
keymap("v", "J", ":m '>+1<CR>gv=gv")

keymap("v", "p", '"_dp')
keymap("v", "P", '"_dP')
keymap({ "x", "o", "v" }, "H", "^")
keymap({ "x", "o", "v" }, "L", "g_")

-- Panes resizing
keymap("n", "+", ":vertical resize +5<CR>")
keymap("n", "_", ":vertical resize -5<CR>")
keymap("n", "=", ":resize +5<CR>")
keymap("n", "-", ":resize -5<CR>")

keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

keymap("n", "<S-l>", ":bnext<cr>")
keymap("n", "<S-h>", ":bprevious<cr>")

keymap("n", "<leader>`", "<cmd>e #<cr>")

-- vim.cmd("command! W execute 'w !sudo tee % > /dev/null' <bar> edit!")
vim.keymap.set("n", "<leader>mx", "<cmd>!chmod u+x %<CR>", { silent = true, desc = "makes file executable" })

keymap({ "n", "v" }, "gg", "gg0")
keymap({ "n", "v" }, "G", "G$")

keymap({ "x", "v" }, ",", "$") -- has delay

-- stylua: ignore start

--keywordprg
keymap("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { silent = true })
vim.api.nvim_set_keymap("v", "<C-_>", "gc", { silent = true })
keymap("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
keymap("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })
-- vim.keymap.set("n", "<C-_>", function() vim.cmd("normal! gcc") end, { silent = true })

-- keymap("n", "gx", ":!open <c-r><c-a><CR>")

-- vim.keymap.set("c", "<C-a>", "<Home>")
vim.keymap.set("c", "<C-h>", "<Up>")
vim.keymap.set("c", "<C-l>", "<Down>")

keymap("n", "gV", "`[V`]") -- "`[v`]"
keymap("n", "gl", "`.zz")
keymap('x', 'g/', '<Esc>/\\%V')


keymap("n", "<leader>M", "mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm")
-- :%s/^M//g
-- :%s/\r//g

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- vim.keymap.set("n", "<Right>")
-- vim.keymap.set("n", "<Left>")

vim.keymap.set("n", "<leader>8", ":%s/", { noremap = true })
vim.keymap.set("n", "<leader>*", ":%s/\\<<c-r><c-w>\\>/", { noremap = true })
-- keymap("n", "<leader>c8", ":.s/")
-- keymap("n", "<leader>c*", ":.s/\\<<c-r><c-w>\\>/")
-- keymap("n", "<leader>rw", ":%s/\\<<c-r><c-w>\\>/")
-- keymap("n", "<leader>*", "yiw :%s/<C-r>0/")
-- keymap("n", "<leader><leader>8", ":argdo %s/")
-- keymap("n", "<leader><leader>*", "yiw :argdo %s/<C-r>0/")

-- keymap("n", "<leader><Enter>", "!!bash<CR>")
keymap("n", "<leader>-", ":!")

keymap("n", "<leader>so", function() vim.cmd("so %") end)

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

keymap( "n", "yod", "<cmd>lua if vim.diagnostic.is_enabled() then vim.diagnostic.enable(false) else vim.diagnostic.enable(true) end<CR>")

keymap("n", "yow", function()
  vim.wo.wrap = not vim.wo.wrap
end)
keymap("n", "]t", "gt")
keymap("n", "[t", "gT")

keymap("n", "yor", function()
  vim.wo.number = not vim.wo.number
  vim.wo.relativenumber = not vim.wo.relativenumber
end)

-- Clear search, diff update and redraw
keymap(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- lazy
keymap("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
keymap("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- location list
keymap("n", "<leader>xl", function()
  local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Location List" })

-- quickfix list
keymap("n", "<leader>xq", function()
  local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Quickfix List" })
vim.g.completion = true
keymap('n', 'yoc', function()
  vim.g.completion = not vim.g.completion
  print(vim.g.completion)
end, { noremap = true, silent = false, desc = "Toggle completion" })

-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>fp", function()
  local filePath = vim.fn.expand("%:~")
  vim.fn.setreg("+", filePath)
  print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" })

-- vim.keymap.set("v", "p", '"_dp', opts)
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word cursor is on globally" })

-- keymap("i", "", "<cmd>lua vim.lsp.buf.completion()<CR>")
-- keymap("i", "<C-Y>", "<C-X><C-O>")

-- keymap.set("n", "<leader>ss", ":setlocal spell! spelllang=en_us<CR>", { noremap = true })
-- keymap.set("n", "<leader>sn", "]s", { noremap = true })
-- keymap.set("n", "<leader>sp", "[s", { noremap = true })
-- keymap.set("n", "<leader>sa", "zg", { noremap = true })
-- keymap.set("n", "<leader>s?", "z=", { noremap = true })

-- Add undo break-points
-- map("i", ",", ",<c-g>u")
-- map("i", ".", ".<c-g>u")
-- map("i", ";", ";<c-g>u")

-- for key, keymap in pairs({ b = 'b', q = 'c', l = 'l' }) do
--     map({ 'n', ('[%s'):format(key), ('<cmd>%sprev<cr>'):format(keymap) })
--     map({ 'n', (']%s'):format(key), ('<cmd>%snext<cr>'):format(keymap) })
-- end

-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
