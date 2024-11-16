return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "yoa",        "<cmd>AerialToggle!<cr>",    desc = "AerialToggle" },
    { "<leader>ta", "<cmd>Telescope aerial<CR>", desc = "Telescope Aerial" }
  },
  config = function()
    require("aerial").setup({
      on_attach = function(bufnr)
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
      end,
      attach_mode = "global",
      close_on_select = true,
      layout = {
        min_width = 30,
        default_direction = "prefer_right",
      },

    })

    local tele_status_ok, telescope = pcall(require, "telescope")

    if not tele_status_ok then
      return
    end

    telescope.load_extension("aerial")
  end,
}
