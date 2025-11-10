return {
  "olimorris/onedarkpro.nvim",
  priority = 1000,
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
      virtual_text = "italic",
    },
    options = {
      cursorline = true,
      transparency = true,
      -- lualine_transparency = true,
      -- highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
    },
  },
}
