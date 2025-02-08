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

keymap("n", "<leader>we", "<C-W>c")
keymap("n", "<leader>s=", "<C-w>=")

keymap("n", "<C-c>", "<cmd>bd<CR>")
keymap("n", "<leader>bd", ":bd<CR>")
keymap("n", "<C-q>", "<cmd>q<CR>")
keymap("n", "<leader>qq", ":qa<CR>")
keymap("n", "<leader>Q", ":qa!<CR>")

keymap("n", "<leader>`", "<cmd>e #<cr>")

keymap("n", "<leader><tab>o", ":tabnew<CR>")
keymap("n", "<leader><tab>l", "<cmd>tabnext<cr>")
keymap("n", "<leader><tab>h", "<cmd>tabprevious<cr>")
-- keymap("n", "", "<cmd>tabclose<cr>")

-- keymap("n", "==", "gg<S-v>G")

keymap("n", "J", "myJ`y")

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
-- vim.keymap.set("n", "<C-_>", function() vim.cmd("normal! gcc") end, { silent = true })

-- keymap("n", "gx", ":!open <c-r><c-a><CR>")

-- vim.keymap.set("c", "<C-a>", "<Home>")
vim.keymap.set("c", "<C-h>", "<Up>")
vim.keymap.set("c", "<C-l>", "<Down>")

keymap("n", "gV", "`[V`]")
keymap("n", "gl", "`.zz")

vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("n", ":", ";", { noremap = true })

keymap("n", "<leader>M", "mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm")

keymap("n", "<leader>8", ":%s/")
keymap("n", "<leader>*", "yiw :%s/<C-r>0/")
keymap("n", "<leader>c8", ":.s/")
keymap("n", "<leader>c*", "yiw :.s/<C-r>0/")
keymap("n", "<leader>rw", ":%s/\\<<c-r><c-w>\\>/")
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

-- Add undo break-points
-- map("i", ",", ",<c-g>u")
-- map("i", ".", ".<c-g>u")
-- map("i", ";", ";<c-g>u")

-- for key, keymap in pairs({ b = 'b', q = 'c', l = 'l' }) do
--     map({ 'n', ('[%s'):format(key), ('<cmd>%sprev<cr>'):format(keymap) })
--     map({ 'n', (']%s'):format(key), ('<cmd>%snext<cr>'):format(keymap) })
-- end


-- window management
-- keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
-- keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
-- keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
-- keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
--
-- keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
