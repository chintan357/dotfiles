return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      python = {
        -- "ruff"
        "pylint"
      },
      -- markdown = { "markdownlint" }, -- { "vale" }
      -- json = { "jsonlint" },
    }

    -- Automatically run linters after saving.  Use "InsertLeave" for more aggressive linting.
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
      group = lint_augroup,
      callback = function()
        -- Only run the linter in buffers that you can modify in order to
        -- avoid superfluous noise, notably within the handy LSP pop-ups that
        -- describe the hovered symbol using Markdown.
        if vim.opt_local.modifiable:get() then
          lint.try_lint()
        end
      end,
    })
    vim.keymap.set("n", "<leader>li", function()
      if vim.opt_local.modifiable:get() then
        lint.try_lint()
      end
    end)
  end,
}

-- {
--   dockerfile = { "hadolint" },
--   json = { "jsonlint" },
--   markdown = { "vale" },
--   terraform = { "tflint" },
--   text = { "vale" }
-- }
-- You can disable the default linters by setting their filetypes to nil:
-- lint.linters_by_ft['text'] = nil
