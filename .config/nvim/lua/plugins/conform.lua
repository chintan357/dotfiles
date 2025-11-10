return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
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
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      lua = { "stylua" },
      python = {
        -- "ruff_fix",
        -- "ruff_format",
        "ruff_organize_imports",
      },
      json = { "prettierd" },
      javascript = { "prettierd" },
      toml = { "taplo" },
      bash = { "beautysh" },
      sh = { "beautysh" },
      html = { "prettierd" },
      css = { "prettierd" },
      yaml = { "yamlfix" },
      -- proto = { "buf" },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
  },
}
