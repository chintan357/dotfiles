return {
	"SmiteshP/nvim-navic",
	opts = {
		lsp = {
			auto_attach = true,
			preference = nil,
		},
		lazy_update_context = true,
	},
	config = function(_, opts)
		-- require("nvim-navic").setup()
		local navic = require("nvim-navic")

		-- local on_attach = function(client, bufnr)
		-- 	if client.server_capabilities.documentSymbolProvider then
		-- 		navic.attach(client, bufnr)
		-- 	end
		-- end
		--
		-- require("lspconfig").clangd.setup({
		-- 	on_attach = on_attach,
		-- })

		-- require("lspconfig").clangd.setup({
		-- 	on_attach = function(client, bufnr)
		-- 		navic.attach(client, bufnr)
		-- 	end,
		-- })
		navic.setup(opts)
	end,
}
