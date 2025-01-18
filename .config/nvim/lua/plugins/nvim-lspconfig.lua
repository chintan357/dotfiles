return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				--     -- Load luvit types when the `vim.uv` word is found
				--     { path = "luvit-meta/library", words = { "vim%.uv" } },
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"SmiteshP/nvim-navic",
		opts = {
			lsp = {
				auto_attach = true,
				preference = nil,
			},
			lazy_update_context = true,
		},
		config = function(_, opts)
			local navic = require("nvim-navic")
			-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
			navic.setup(opts)
			vim.keymap.set("n", "<leader>no", ":Navbuddy<CR>")
		end,
	},
	{
		"SmiteshP/nvim-navbuddy",
		dependencies = {
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
		},
		opts = { lsp = { auto_attach = true } },
	},
	{
		"neovim/nvim-lspconfig",
		-- event = "VeryLazy",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
			{ "j-hui/fidget.nvim", opts = {} },
			"hrsh7th/cmp-nvim-lsp",
			-- { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
			"stevearc/conform.nvim",
			-- { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
			"b0o/SchemaStore.nvim",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					-- local bufnr = event.buf
					-- local client = assert(vim.lsp.get_client_by_id(event.data.client_id), "must have valid client")
					-- local settings = servers[client.name]

					-- if type(settings) ~= "table" then
					-- 	settings = {}
					-- end

					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end
					--  To jump back, press <C-t>.
					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
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

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
							end,
						})
					end
					-- local builtin = require("telescope.builtin")
					--
					-- vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
					-- vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = 0 })
					-- vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = 0 })
					-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
					-- vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
					-- vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
					--
					-- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { buffer = 0 })
					-- vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = 0 })

					-- map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					-- map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					-- map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
					-- map("K", vim.lsp.buf.hover, "Hover Documentation")

					-- local opts = { buffer = bufnr, noremap = true, silent = true }
					-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					-- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
					-- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
					-- vim.keymap.set("n", "<space>wl", function()
					-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					-- end, opts)
					-- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
					-- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
					-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					-- vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
					-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
					-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
					-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

					-- local filetype = vim.bo[bufnr].filetype
					-- if disable_semantic_tokens[filetype] then
					-- 	client.server_capabilities.semanticTokensProvider = nil
					-- end
					--
					-- -- Override server capabilities
					-- if settings.server_capabilities then
					-- 	for k, v in pairs(settings.server_capabilities) do
					-- 		if v == vim.NIL then
					-- 			---@diagnostic disable-next-line: cast-local-type
					-- 			v = nil
					-- 		end
					--
					-- 		client.server_capabilities[k] = v
					-- 	end
					-- end

					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
						map("yoh", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})

			-- Change diagnostic symbols in the sign column (gutter)
			if vim.g.have_nerd_font then
				local signs = { ERROR = "", WARN = "", INFO = "", HINT = "" }
				local diagnostic_signs = {}
				for type, icon in pairs(signs) do
					diagnostic_signs[vim.diagnostic.severity[type]] = icon
				end
				vim.diagnostic.config({ signs = { text = diagnostic_signs } })
			end
			-- vim.keymap.set(
			-- 	"n",
			-- 	"yod",
			-- 	"<cmd>lua if vim.diagnostic.is_enabled() then vim.diagnostic.enable(false) else vim.diagnostic.enable(true) end<CR>"
			-- )
			-- local diagnostic_goto = function(next, severity)
			-- 	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
			-- 	severity = severity and vim.diagnostic.severity[severity] or nil
			-- 	return function()
			-- 		go({ severity = severity })
			-- 	end
			-- end
			-- -- keymap("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
			-- -- [e is also mapped inside vim-unimpaired
			-- keymap("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
			-- keymap("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
			-- keymap("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
			-- keymap("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })

			-- local lspconfig = require("lspconfig")

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			--  - cmd (table): Override the default command used to start the server
			--  - filetypes (table): Override the default list of associated filetypes for the server
			--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
			--  - settings (table): Override the default settings passed when initializing the server.
			--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
			-- See `:help lspconfig-all` for a list of all the pre-configured LSPs
			local servers = {
				marksman = {},
				jsonls = {
					settings = {
						json = {
							schemas = require("schemastore").json.schemas(),
							validate = { enable = true },
						},
					},
				},
				yamlls = {
					settings = {
						yaml = {
							-- schemaStore = { enable = false, url = "", },
							schemas = require("schemastore").yaml.schemas(),
						},
					},
				},
				bashls = {},
				pyright = {},
				lua_ls = {
					settings = {
						Lua = {
							-- server_capabilities = {
							-- 	semanticTokensProvider = vim.NIL,
							-- },
							completion = {
								callSnippet = "Replace",
							},
							-- diagnostics = {
							-- 	globals = { "vim" },
							-- },
							-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
							-- diagnostics = { disable = { 'missing-fields' } },
						},
					},
				},
				-- server_capabilities = {
				-- 	semanticTokensProvider = false,
				-- },
			}
			--
			-- require("mason").setup()
			--
			-- for name, config in pairs(servers) do
			-- 	if config == true then
			-- 		config = {}
			-- 	end
			-- 	config = vim.tbl_deep_extend("force", {}, {
			-- 		capabilities = capabilities,
			-- 	}, config)
			--
			-- 	lspconfig[name].setup(config)
			-- end
			--
			-- local disable_semantic_tokens = {
			-- 	lua = true,
			-- }
			--
			-- local ensure_installed = vim.tbl_filter(function(key)
			-- 	local t = servers[key]
			-- 	if type(t) == "table" then
			-- 		return not t.manual_install
			-- 	else
			-- 		return t
			-- 	end
			-- end, vim.tbl_keys(servers))
			--
			-- -- local ensure_installed = vim.tbl_keys(servers or {})
			--
			-- vim.list_extend(ensure_installed, {
			-- 	"cssls",
			-- 	"dockerls",
			-- 	"html",
			-- })
			--
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
			-- vim.api.nvim_command("MasonToolsInstall")
			--
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for ts_ls)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
			-- -- require("mason-lspconfig").setup({
			-- -- 	handlers = {
			-- -- 		function(server_name)
			-- -- 			local server = servers[server_name] or {}
			-- -- 			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
			-- -- 			require("lspconfig")[server_name].setup(server)
			-- -- 		end,
			-- -- 	},
			-- -- })
			-- --
			-- require("mason-lspconfig").setup_handlers({
			-- 	function(server_name)
			-- 		require("lspconfig")[server_name].setup({
			-- 			on_attach = lsp_attach,
			-- 			capabilities = lsp_capabilities,
			-- 		})
			-- 	end,
			-- })

			-- vim.api.nvim_create_autocmd("LspDetach", {
			-- 	group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
			-- 	callback = function(event)
			-- 		vim.lsp.buf.clear_references()
			-- 		-- vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event.buf })
			-- 	end,
			-- })

			-- require("lsp_lines").setup()
			-- vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
		end,
	},
	-- { -- optional completion source for require statements and module annotations
	--   "hrsh7th/nvim-cmp",
	--   opts = function(_, opts)
	--     opts.sources = opts.sources or {}
	--     table.insert(opts.sources, {
	--       name = "lazydev",
	--       group_index = 0, -- set group index to 0 to skip loading LuaLS completions
	--     })
	--   end,
	-- },
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

--  - filetypes (table): Override the default list of associated filetypes for the server
--  - settings (table): Override the default settings passed when initializing the server.
--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/

-- and elegantly composed help section, `:help lsp-vs-treesitter`
--  See `:help K` for why this keymap.
