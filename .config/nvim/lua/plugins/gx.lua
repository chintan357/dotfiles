return {
  "chrishrb/gx.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
  cmd = { "Browse" },
  init = function()
    vim.g.netrw_nogx = 1 -- disable netrw gx
  end,
  submodules = false, -- not needed, submodules are required only for tests
  opts = {
    open_browser_app = "open-cli",
  },
}
