-- TODO: refer docs
return {
  "folke/trouble.nvim",
  enabled = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "Trouble" },
  opts = { use_diagnostic_signs = true },
  keys = {
    {
      "yoT",
      ":Trouble",
      desc = "Diagnostics (Trouble)",
    },
    -- {
    -- 	"<leader>td",
    -- 	"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    -- 	desc = "Buffer Diagnostics (Trouble)",
    -- },
    -- {
    -- 	"<leader>ts",
    -- 	"<cmd>Trouble symbols toggle focus=false<cr>",
    -- 	desc = "Symbols (Trouble)",
    -- },
    -- {
    -- 	"<leader>tL",
    -- 	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    -- 	desc = "LSP Definitions / references / ... (Trouble)",
    -- },
    {
      "[q",
      function()
        if require("trouble").is_open() then
          require("trouble").previous({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "Previous Trouble/Quickfix Item",
    },
    {
      "]q",
      function()
        if require("trouble").is_open() then
          require("trouble").next({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "Next Trouble/Quickfix Item",
    },
  },
}
