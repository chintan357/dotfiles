return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    dashboard = {
      sections = {
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
    bigfile = { enabled = true },
    explorer = { enabled = true },
    dim = { enabled = true },
    indent = { enabled = true },
    -- terminal = {},
    input = { enabled = true },
    picker = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 2000,
    },
    quickfile = { enabled = true },
    zen = { enabled = true },
    scope = { enabled = true },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
    },
  },
  keys = {
    -- stylua: ignore start
    { "<leader>N", function() Snacks.picker.notifications() end, desc = "Notification History", },
    { "<leader>E", function() Snacks.explorer() end, desc = "File Explorer", },

    {
      "<leader>of",
      function()
        Snacks.picker.buffers({
          win = {
            input = {
              keys = {
                ["dd"] = "bufdelete",
                ["<c-d>"] = { "bufdelete", mode = { "n", "i" } },
              },
            },
            list = { keys = { ["dd"] = "bufdelete" } },
          },
        })
      end,
      desc = "Buffers",
    },

    -- search
    { "<localleader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files", },
    { "<C-p>", function() Snacks.picker.git_files() end, desc = "Find Git Files", },
    { "<leader>sf", function() Snacks.picker.files() end, desc = "Find Files", },
    { "<leader>sr", function() Snacks.picker.recent() end, desc = "Recent", },
    { "<leader>sc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File", },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps", },
    { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages", },
    { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages", },

    -- LSP
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition", },
    { "grr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References", },

    -- Other
    { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode", },
    { "so", function() Snacks.zen.zoom() end, desc = "Toggle Zoom", },

    { "Q", function() Snacks.bufdelete() end, desc = "Delete Buffer", },

    -- { "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer", },
    -- { "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer", },

    { "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification History", },

    -- { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File", },
    --
    -- { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" }, },
    -- { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit", },

    -- { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications", },

    -- { "<c-/>",           function() Snacks.terminal() end,                                       desc = "Toggle Terminal" },
    -- { "<c-_>",           function() Snacks.terminal() end,                                       desc = "which_key_ignore" },
    -- { "]]",              function() Snacks.words.jump(vim.v.count1) end,                         desc = "Next Reference",           mode = { "n", "t" } },
    -- { "[[",              function() Snacks.words.jump(-vim.v.count1) end,                        desc = "Prev Reference",           mode = { "n", "t" } },

    -- {
    --   "<leader>N",
    --   desc = "Neovim News",
    --   function()
    --     Snacks.win({
    --       file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
    --       width = 0.6,
    --       height = 0.6,
    --       wo = {
    --         spell = false,
    --         wrap = false,
    --         signcolumn = "yes",
    --         statuscolumn = " ",
    --         conceallevel = 3,
    --       },
    --     })
    --   end,
    -- },
  },
  init = function()
    vim.g.snacks_animate = false
  end,
}

-- https://github.com/folke/snacks.nvim/blob/main/docs/bufdelete.md
-- https://github.com/folke/snacks.nvim/blob/main/docs/keymap.md
