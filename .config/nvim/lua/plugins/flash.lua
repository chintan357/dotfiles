return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore start
  keys = {
    { "sf", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash", },
    { "st", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter", },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search", },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash", },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search", },
  },
}
