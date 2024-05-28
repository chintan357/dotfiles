return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		{ "j-hui/fidget.nvim", opts = {} },
		{ "folke/neodev.nvim" },
		{
			"SmiteshP/nvim-navbuddy",
			dependencies = {
				"SmiteshP/nvim-navic",
				"MunifTanjim/nui.nvim",
			},
			opts = { lsp = { auto_attach = true } },
		},
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {

			group = vim.api.nvim_create_augroup("atomic-lsp-attach", { clear = true }),

			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				map("K", vim.lsp.buf.hover, "Hover Documentation")

				local client = vim.lsp.get_client_by_id(event.data.client_id)

				if client and client.server_capabilities.documentHighlightProvider then
					local highlight_augroup = vim.api.nvim_create_augroup("atomic-lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})
					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})
				end

				if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
					map("yoh", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					end, "[T]oggle Inlay [H]ints")
				end
			end,
		})

		vim.api.nvim_create_autocmd("LspDetach", {
			group = vim.api.nvim_create_augroup("atomic-lsp-detach", { clear = true }),
			callback = function(event)
				vim.lsp.buf.clear_references()
				vim.api.nvim_clear_autocmds({ group = "atomic-lsp-highlight", buffer = event.buf })
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local servers = {
			marksman = {},
			lua_ls = {
				settings = {
					Lua = {
						-- cmd = {...},
						-- filetypes = { ...},
						-- capabilities = {},
						completion = {
							callSnippet = "Replace",
						},
						diagnostics = {
							globals = { "vim" },
						},
						-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
						-- diagnostics = { disable = { 'missing-fields' } },
					},
				},
			},
			-- pyright = {},
		}
		require("mason").setup()

		local ensure_installed = vim.tbl_keys(servers or {})

		vim.list_extend(ensure_installed, {
			"pyright",
			"lua_ls",
			"jsonls",
		})

		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		vim.api.nvim_command("MasonToolsInstall")

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					-- This handles overriding only values explicitly passed
					-- by the server configuration above. Useful when disabling
					-- certain features of an LSP (for example, turning off formatting for tsserver)
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
-- Globally configure all LSP floating preview popups (like hover, signature help, etc)
-- local open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
-- 	opts = opts or {}
-- 	opts.border = opts.border or "rounded" -- Set border to rounded
-- 	return open_floating_preview(contents, syntax, opts, ...)
-- end
-- There is an issue with mason-tools-installer running with VeryLazy, since it triggers on VimEnter which has already occurred prior to this plugin loading so we need to call install explicitly
-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/issues/39

-- Call setup on each LSP server
-- require("mason-lspconfig").setup_handlers({
--   function(server_name)
--     lspconfig[server_name].setup({
--       on_attach = lsp_attach,
--       capabilities = lsp_capabilities,
--     })
--   end,
-- })

--     local capabilities = vim.lsp.protocol.make_client_capabilities()
--     capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
--
--     --  - filetypes (table): Override the default list of associated filetypes for the server
--     --  - settings (table): Override the default settings passed when initializing the server.
--     --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
--
-- and elegantly composed help section, `:help lsp-vs-treesitter`
--  See `:help K` for why this keymap.
-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
