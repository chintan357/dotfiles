local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>")

map("n", ":", ";")
map({ "n", "v" }, ";", ":")

map("x", "v", "<C-v>")

map("t", "<Esc><Esc>", "<C-\\><C-n>")

map("n", "sh", "<C-w>s")
map("n", "sv", "<C-w>v")
map("n", "s=", "<C-w>=")
map("n", "se", "<C-w>c")

map("n", "Q", "<cmd>bd<CR>")

map("n", "U", "<C-r>")

map("x", "K", ":m '<-2<CR>gv=gv")
map("x", "J", ":m '>+1<CR>gv=gv")

map("x", "p", '"_dP')

map("x", "<", "<gv")
map("x", ">", ">gv")

map("n", "<S-l>", "<cmd>bnext<CR>")
map("n", "<S-h>", "<cmd>bprevious<CR>")

map({ "n", "x" }, "<C-_>", "gcc", { remap = true })
map("x", "<C-_>", "gc", { remap = true })

map("n", "yow", function()
  vim.wo.wrap = not vim.wo.wrap
end)

map("n", "yor", function()
  vim.wo.number = not vim.wo.number
  vim.wo.relativenumber = not vim.wo.relativenumber
end)


map("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "Lazy" })

-- map("n", "<leader>mx", "<cmd>!chmod u+x %<CR>")
-- map("n", "<leader>fp", function() vim.fn.setreg("+", vim.fn.expand("%:~")) end)
-- map("n", "<C-j>", "<cmd>e #<cr>")
-- map("n", "]t", "gt")
-- map("n", "[t", "gT")
map("n", "gV", "`[v`]")
-- map("n", "gl", "`.zz")
-- map("x", "g/", "<Esc>/\\%V")
-- map("c", "<C-h>", "<Up>")
-- map("c", "<C-l>", "<Down>")
-- map({ "x", "o", "v" }, "H", "^")
-- map({ "x", "o", "v" }, "L", "g_")
-- map("n", "<leader>-", ":!")
-- map("n", "<leader><Enter>", "!!bash<CR>")
-- map("n", "<leader>fn", "<cmd>enew<cr>")
-- map("n", "n", "nzz")
-- map("n", "N", "Nzz")
