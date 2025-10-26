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
  {
    "lewis6991/gitsigns.nvim",
    -- event = "VeryLazy",
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
      signs_staged_enable = true,
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        follow_files = true,
      },
      auto_attach = true,
      attach_to_untracked = false,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
      },
      current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000, -- Disable if file is longer than this (in lines)
      preview_config = {
        -- Options passed to nvim_open_win
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
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
        end)

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end)

        map("n", "<localleader>gd", gitsigns.diffthis)
        -- map("n", "<leader>hD", function() gitsigns.diffthis("@") end, { desc = "git [D]iff against last commit" })

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
        map("n", "<leader>hi", gitsigns.preview_hunk_inline)
        map("n", "<leader>hp", gitsigns.preview_hunk)

        -- map('n', '<leader>hb', function()
        --   gitsigns.blame_line({ full = true })
        -- end)

        -- map('n', '<leader>hd', gitsigns.diffthis)

        -- map('n', '<leader>hD', function()
        --   gitsigns.diffthis('~')
        -- end)

        map("n", "<leader>hQ", function()
          gitsigns.setqflist("all")
        end)
        map("n", "<leader>hq", gitsigns.setqflist)

        -- Toggles
        map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
        map("n", "<leader>tw", gitsigns.toggle_word_diff)
        -- map("n", "<leader>tD", gitsigns.toggle_deleted, { desc = "[T]oggle git show [D]eleted" })

        -- Text object
        map({ "o", "x" }, "ih", gitsigns.select_hunk)
      end,
    },
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    keys = {
      { "dvo", "<cmd>DiffviewOpen<cr>" },
      { "dvc", "<cmd>DiffviewClose<cr>" },
    },
  },
}

-- {
-- 	"mattn/vim-gist",
-- 	dependencies = { "mattn/webapi-vim" },
-- },
-- { "junegunn/gv.vim" },
-- { "akinsho/git-conflict.nvim", version = "*", config = true },

-- map(
--   "n",
--   "<leader>ur",
--   "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
--   { desc = "Redraw / Clear hlsearch / Diff Update" }
-- )

-- https://www.reddit.com/r/neovim/comments/1j9fy2w/diffviewnvim_is_so_underrated/
