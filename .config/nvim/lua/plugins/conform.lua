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
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		-- format_on_save = function(bufnr)
		-- 	local disable_filetypes = { c = true, cpp = true }
		-- 	return {
		-- 		timeout_ms = 500,
		-- 		lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
		-- 	}
		-- end,
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			json = { { "prettierd", "prettier" } },
			markdown = { { "prettierd", "prettier" } },
			bash = { "beautysh" },
			yaml = { "yamlfix" },
			sh = { "shellcheck" },
			javascript = { { "prettierd", "prettier" } },
			-- html = { "htmlbeautifier" },
			-- proto = { "buf" },
			-- toml = { "taplo" },
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
