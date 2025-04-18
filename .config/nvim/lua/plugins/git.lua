-- local is_inside_git_repo = function()
-- 	local git_dir = vim.fn.finddir(".git", vim.fn.expand("%:p:h") .. ";")
-- 	return vim.fn.isdirectory(git_dir) ~= 0
-- end
-- lazy = not is_inside_git_repo(),
-- vim.keymap.set({ "n" }, "gy", function() vim.cmd("GBrowse") end)

return {
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
  { "junegunn/gv.vim" },
  { "akinsho/git-conflict.nvim" },
  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen",
    keys = {
      { "dvo", "<cmd>DiffviewOpen<cr>" },
      { "dvc", "<cmd>DiffviewClose<cr>" },
    },
  },
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

        -- Actions

        -- map("v", "<leader>hs", function()
        -- 	gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        -- end, { desc = "git [s]tage hunk" })
        -- map("v", "<leader>hr", function()
        -- 	gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        -- end, { desc = "git [r]eset hunk" })

        -- map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "git [s]tage hunk" })
        -- map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "git [r]eset hunk" })
        -- map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "git [S]tage buffer" })
        -- map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "git [u]ndo stage hunk" })
        -- map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "git [R]eset buffer" })
        -- map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "git [p]review hunk" })
        -- map("n", "<leader>hb", gitsigns.blame_line, { desc = "git [b]lame line" })
        -- map("n", "<leader>hd", gitsigns.diffthis, { desc = "git [d]iff against index" })
        -- map("n", "<leader>hD", function()
        -- 	gitsigns.diffthis("@")
        -- end, { desc = "git [D]iff against last commit" })
        -- Toggles
        -- map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "[T]oggle git show [b]lame line" })
        -- map("n", "<leader>tD", gitsigns.toggle_deleted, { desc = "[T]oggle git show [D]eleted" })

        -- map("n", "]H", function() gs.nav_hunk("last") end, "Last Hunk")
        -- map("n", "[H", function() gs.nav_hunk("first") end, "First Hunk")
        -- map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        -- map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        -- map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        -- map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        -- map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        -- map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
        -- map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        -- map("n", "<leader>ghB", function() gs.blame() end, "Blame Buffer")
        -- map("n", "<leader>ghd", gs.diffthis, "Diff This")
        -- map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        -- map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },
}

-- {
-- 	"mattn/vim-gist",
-- 	dependencies = { "mattn/webapi-vim" },
-- },

-- {
-- 	"f-person/git-blame.nvim",
-- 	cmd = "GitBlameToggle",
-- 	opts = {
-- 		enabled = true,
-- 		date_format = "%m/%d/%y %H:%M:%S", -- "%m-%d-%Y %H:%M:%S"
-- 	},
-- },

-- keymap("n", "<leader>gb", ":GitBlameToggle<CR>")
-- map(
--   "n",
--   "<leader>ur",
--   "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
--   { desc = "Redraw / Clear hlsearch / Diff Update" }
-- )
