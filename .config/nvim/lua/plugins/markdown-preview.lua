return {
  -- {
  --   "OXY2DEV/markview.nvim",
  --   ft = { "markdown", "codecompanion" },
  --   opts = {
  --     filetypes = { "markdown", "codecompanion" },
  --     buf_ignore = {},
  --   },
  -- },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you use the mini.nvim suite
    ft = { "markdown", "codecompanion" },
  },
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   -- keys = {
  --   -- 	{ "yom", "<cmd>MarkdownPreviewToggle<cr>" },
  --   -- },
  --   build = "cd app && npm install",
  --   init = function()
  --     vim.g.mkdp_filetypes = { "markdown" }
  --   end,
  --   config = function()
  --     vim.g.mkdp_auto_close = 1
  --   end,
  -- },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  }
}
