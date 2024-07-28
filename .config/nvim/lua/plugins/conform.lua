return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	lazy = false,
	keys = {
		{
			"<leader>fo",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "n",
		},
	},
	opts = {
		notify_on_error = true,
		format_on_save = function(bufnr)
			-- local disable_filetypes = { c = true, cpp = true }
			return {
				timeout_ms = 500,
				lsp_fallback = true,
				-- lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			}
		end,

		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			json = { "prettierd", "prettier", stop_after_first = true },
			toml = { "taplo" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			bash = { "beautysh" },
			sh = { "beautysh" },
			html = { "prettier" },
			css = { "prettier" },
			-- ruby = { "rubocop" },
			-- yaml = { "yamlfix" },
			-- proto = { "buf" },
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)
	end,
}
