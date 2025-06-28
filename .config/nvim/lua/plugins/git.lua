-- local is_inside_git_repo = function()
-- 	local git_dir = vim.fn.finddir(".git", vim.fn.expand("%:p:h") .. ";")
-- 	return vim.fn.isdirectory(git_dir) ~= 0
-- end
-- lazy = not is_inside_git_repo(),
-- vim.keymap.set({ "n" }, "gy", function() vim.cmd("GBrowse") end)

-- TODO: add toggle binding to diffview

return {
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
  { "junegunn/gv.vim" },
  { 'akinsho/git-conflict.nvim', version = "*", config = true },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      signs_staged = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
      },
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end, { desc = "Jump to next git [c]hange" })
        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end, { desc = "Jump to previous git [c]hange" })
        map("n", "]C", function() gitsigns.nav_hunk("last") end)
        map("n", "[C", function() gitsigns.nav_hunk("first") end)

        map("n", "<localleader>gd", gitsigns.diffthis)
        -- map("n", "<leader>hD", function() gitsigns.diffthis("@") end, { desc = "git [D]iff against last commit" })

        -- Toggles
        -- map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "[T]oggle git show [b]lame line" })
        -- map("n", "<leader>tD", gitsigns.toggle_deleted, { desc = "[T]oggle git show [D]eleted" })

        map("n", "<leader>H", gitsigns.preview_hunk)
        -- map("n", "", gitsigns.preview_hunk_inline)

        -- Actions
        -- map('n', '<leader>hs', gitsigns.stage_hunk)
        -- map('n', '<leader>hr', gitsigns.reset_hunk)

        -- map('v', '<leader>hs', function()
        --   gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        -- end)
        --
        -- map('v', '<leader>hr', function()
        --   gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        -- end)

        -- map('n', '<leader>hS', gitsigns.stage_buffer)
        -- map('n', '<leader>hR', gitsigns.reset_buffer)
        -- map('n', '<leader>hp', gitsigns.preview_hunk)
        -- map('n', '<leader>hi', gitsigns.preview_hunk_inline)

        -- map('n', '<leader>hb', function()
        --   gitsigns.blame_line({ full = true })
        -- end)

        -- map('n', '<leader>hd', gitsigns.diffthis)

        -- map('n', '<leader>hD', function()
        --   gitsigns.diffthis('~')
        -- end)

        map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
        map('n', '<leader>hq', gitsigns.setqflist)

        -- Toggles
        -- map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
        -- map('n', '<leader>tw', gitsigns.toggle_word_diff)

        -- Text object
        map({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
      end,
    },
  },
}

-- {
-- 	"mattn/vim-gist",
-- 	dependencies = { "mattn/webapi-vim" },
-- },

-- map(
--   "n",
--   "<leader>ur",
--   "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
--   { desc = "Redraw / Clear hlsearch / Diff Update" }
-- )
-- {
--   "sindrets/diffview.nvim",
--   cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
--   keys = {
--     { "dvo", "<cmd>DiffviewOpen<cr>" },
--     { "dvc", "<cmd>DiffviewClose<cr>" },
--   },
-- },
