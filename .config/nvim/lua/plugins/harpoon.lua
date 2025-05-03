return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    menu = {
      -- width = 120,
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    settings = {
      save_on_toggle = false,
      sync_on_ui_close = true,
    },
  },
  config = function(_, opts)
    require("harpoon").setup(opts)

    vim.keymap.set("n", "\ti", function() require("harpoon"):list():add() end)
    vim.keymap.set("n", "\to", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end)
    vim.keymap.set("n", "\tj", function() require("harpoon"):list():select(1) end)
    vim.keymap.set("n", "\tk", function() require("harpoon"):list():select(2) end)
    vim.keymap.set("n", "\tl", function() require("harpoon"):list():select(3) end)
    vim.keymap.set("n", "\t;", function() require("harpoon"):list():select(4) end)
  end,
}
