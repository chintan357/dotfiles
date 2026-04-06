-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
-- ~/.config/nvim/after/lsp/lua_ls.lua

-- Diagnostics {{{
local config = {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
  virtual_text = true,
  severity_sort = true,
  -- virtual_lines = true,
  -- update_in_insert = true,
  float = {
    border = "single",
  },
}
vim.diagnostic.config(config)
-- }}}

-- Create keybindings on LSP attach {{{
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    local keymap = vim.keymap.set
    -- keymap("n", "gl", vim.diagnostic.open_float)
    -- keymap("n", "<Leader>dq", vim.diagnostic.setloclist)
    keymap("n", "yov", function()
      vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
    end)
  end,
})
-- }}}

vim.lsp.enable("lua_ls")
-- vim.lsp.enable("basedpyright")
vim.lsp.enable("ty")
