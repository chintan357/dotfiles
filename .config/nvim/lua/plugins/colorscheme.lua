return {
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure it loads first
  opts = {
    styles = {
      tags = "italic",
      methods = "bold",
      functions = "italic",
      keywords = "bold,italic",
      comments = "italic",
      parameters = "italic",
      conditionals = "italic",
      Directory = { bold = true },
      ErrorMsg = { italic = true, bold = true },
      -- virtual_text = "italic",
      -- types = "NONE",     -- Style that is applied to types
      -- numbers = "NONE",   -- Style that is applied to numbers
      -- strings = "NONE",   -- Style that is applied to strings
      -- constants = "NONE", -- Style that is applied to constants
      -- operators = "NONE", -- Style that is applied to operators
      -- variables = "NONE", -- Style that is applied to variables
    },
    options = {
      cursorline = true,
      lualine_transparency = true,
      transparency = true,
      -- highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
    },
  },
  config = function(_, opts)
    require("onedarkpro").setup(opts)
    vim.cmd([[colorscheme onedark]])
  end,
}
