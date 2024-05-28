-- General purpose linters
return {
	"mfussenegger/nvim-lint",
	event = "BufWritePost",
	-- event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("lint").linters_by_ft = {
			python = {
				"pylint",
			},
			markdown = { "markdownlint" }, -- { "vale" }
			json = { "jsonlint" },
		}

		-- Automatically run linters after saving.  Use "InsertLeave" for more aggressive linting.
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
			group = lint_augroup,
			callback = function()
				require("lint").try_lint()
			end,
		})
		-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		-- 	pattern = { "*.py" },
		-- 	callback = function()
		-- 		require("lint").try_lint()
		-- 	end,
		-- })
	end,
}

-- You can disable the default linters by setting their filetypes to nil:
-- lint.linters_by_ft['json'] = nil
-- lint.linters_by_ft['markdown'] = nil
-- lint.linters_by_ft['text'] = nil
