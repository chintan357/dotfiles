return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon.setup()

    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>ho", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    vim.keymap.set("n", "\tj", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "\tk", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "\tl", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "\t;", function() harpoon:list():select(4) end)

    -- vim.keymap.set("n", "", function() harpoon:list():prev() end)
    -- vim.keymap.set("n", "", function() harpoon:list():next() end)
  end,
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
}
