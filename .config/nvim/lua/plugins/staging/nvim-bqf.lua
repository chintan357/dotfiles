-- https://github.com/stevearc/quicker.nvim
-- TODO: check the docs
return {
  {
    "kevinhwang91/nvim-bqf",
    enabled = false,
    config = function()
      require("bqf").setup()
    end,
  },
}
