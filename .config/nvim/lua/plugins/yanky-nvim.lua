-- TODO: is this needed?
return {
  "gbprod/yanky.nvim",
  event = "VeryLazy",
  enabled = false,
  keys = {
    { "y",     "<Plug>(YankyYank)",                      mode = { "n", "x" },                                desc = "Yank text" },

    { "p",     "<Plug>(YankyPutAfter)",                  mode = { "n", "x" },                                desc = "Put yanked text after cursor" },
    { "P",     "<Plug>(YankyPutBefore)",                 mode = { "n", "x" },                                desc = "Put yanked text before cursor" },

    { "gp",    "<Plug>(YankyGPutAfter)",                 mode = { "n", "x" },                                desc = "Put yanked text after selection" },
    { "gP",    "<Plug>(YankyGPutBefore)",                mode = { "n", "x" },                                desc = "Put yanked text before selection" },

    { "<c-p>", "<Plug>(YankyPreviousEntry)",             desc = "Select previous entry through yank history" },
    { "<c-n>", "<Plug>(YankyNextEntry)",                 desc = "Select next entry through yank history" },

    { "]p",    "<Plug>(YankyPutIndentAfterLinewise)",    desc = "Put indented after cursor (linewise)" },
    { "[p",    "<Plug>(YankyPutIndentBeforeLinewise)",   desc = "Put indented before cursor (linewise)" },

    { "]P",    "<Plug>(YankyPutIndentAfterLinewise)",    desc = "Put indented after cursor (linewise)" },
    { "[P",    "<Plug>(YankyPutIndentBeforeLinewise)",   desc = "Put indented before cursor (linewise)" },

    { ">p",    "<Plug>(YankyPutIndentAfterShiftRight)",  desc = "Put and indent right" },
    { "<p",    "<Plug>(YankyPutIndentAfterShiftLeft)",   desc = "Put and indent left" },

    { ">P",    "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
    { "<P",    "<Plug>(YankyPutIndentBeforeShiftLeft)",  desc = "Put before and indent left" },

    -- { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
    -- { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
    {
      "<leader>p",
      function()
        local tele_status_ok, telescope = pcall(require, "telescope")
        if not tele_status_ok then
          return
        end
        telescope.extensions.yank_history.yank_history({})
      end,
      desc = "Open Yank History",
    },
    -- { "]v", "<Plug>(YankyCycleBackward)", desc = "Cycle backward through yank history" },
    -- { "[v", "<Plug>(YankyCycleForward)", desc = "Cycle forward through yank history" },
  },
  opts = {
    system_clipboard = {
      sync_with_ring = true,
    },
    highlight = {
      on_put = true,
      on_yank = false,
      timer = 300,
    },
  },
  config = function()
    require("yanky").setup()
  end,
}
