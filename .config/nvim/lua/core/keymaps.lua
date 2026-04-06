local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>")

map("n", ":", ";")
map({ "n", "v" }, ";", ":")

map("x", "v", "<C-v>")

map("n", "<leader>s-", "<C-w>s")
map("n", "<leader>s\\", "<C-w>v")
map("n", "<leader>se", "<C-w>=")
map("n", "<leader>we", "<C-w>c")

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
