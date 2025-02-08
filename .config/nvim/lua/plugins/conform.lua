return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" }, -- { "BufReadPre", "BufNewFile" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>fo",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      local lsp_format_opt
      if disable_filetypes[vim.bo[bufnr].filetype] then
        lsp_format_opt = "never"
      else
        lsp_format_opt = "fallback"
      end
      return {
        timeout_ms = 500,
        lsp_format = lsp_format_opt,
        -- lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        -- 			bufnr = args.buf,
        -- 			lsp_fallback = true,
        -- 			quiet = true,
      }
    end,
    formatters_by_ft = {
      lua = { "stylua" },
      -- python = { "black" },
      -- python = { "isort", "black" },
      python = {
        -- To fix auto-fixable lint errors.
        "ruff_fix",
        -- To run the Ruff formatter.
        "ruff_format",
        -- To organize the imports.
        "ruff_organize_imports",
      },
      json = { "prettierd", "prettier", stop_after_first = true },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      toml = { "taplo" },
      bash = { "beautysh" },
      sh = { "beautysh" },
      html = { "prettier" },
      css = { "prettier" },
      yaml = { "yamlfix" },
      -- You can customize some of the format options for the filetype (:help conform.format)
      -- rust = { "rustfmt", lsp_format = "fallback" },
      -- ruby = { "rubocop" },
      -- proto = { "buf" },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
  },
  -- init = function()
  -- 	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  -- end,
}
