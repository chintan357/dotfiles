return {
  {
    "neovim/nvim-lspconfig",
    -- priority = 1000,
    dependencies = {
      { "williamboman/mason.nvim", opts = {} },
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      { "j-hui/fidget.nvim",       opts = {} },
      "b0o/SchemaStore.nvim",
      { 'saghen/blink.cmp' },
      { "williamboman/mason-lspconfig.nvim", opts = {} },
      -- { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf })
          end
          --  To jump back, press <C-t>.
          -- map("gd", vim.lsp.buf.definition)
          -- map("gD", vim.lsp.buf.declaration)
          -- map("gy", vim.lsp.buf.type_definition)
          -- map("<C-k>", function() return vim.lsp.buf.signature_help() end, "i")
          map("gK", function() return vim.lsp.buf.signature_help() end)
          -- vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
          -- map("gl", vim.diagnostic.open_float, "Open Diagnostic Float")
          -- map("K", vim.lsp.buf.hover, "Hover Documentation")
          -- map("gs", vim.lsp.buf.signature_help, "Signature Documentation")
          -- map("gD", vim.lsp.buf.declaration, "Goto Declaration")
          -- map("<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split")

          -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
          ---@param client vim.lsp.Client
          ---@param method vim.lsp.protocol.Method
          ---@param bufnr? integer some lsp support methods only in specific files
          ---@return boolean
          local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
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

          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map("yoh", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })) end)
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

      vim.keymap.set("n", "yod",
        "<cmd>lua if vim.diagnostic.is_enabled() then vim.diagnostic.enable(false) else vim.diagnostic.enable(true) end<CR>")

      -- local opts = { buffer = bufnr, noremap = true, silent = true }

      -- vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
      -- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      -- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      -- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

      -- local diagnostic_goto = function(next, severity)
      --   local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
      --   severity = severity and vim.diagnostic.severity[severity] or nil
      --   return function()
      --     go({ severity = severity })
      --   end
      -- end
      -- keymap("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
      -- [e is also mapped inside vim-unimpaired

      -- vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
      -- vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
      -- vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
      -- vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })

      -- local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.

      local servers = {
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
        marksman = {},
        pyright = {},
        -- pyright = {
        --     settings = {
        --       pyright = {
        --         -- Using Ruff's import organizer
        --         disableOrganizeImports = true,
        --       },
        --       python = {
        --         analysis = {
        --           -- Ignore all files for analysis to exclusively use Ruff for linting
        --           ignore = { "*" },
        --       },
        --     },
        --   },
        -- },
        -- ruff = {},
        lua_ls = {
          settings = {
            Lua = {
              -- server_capabilities = { semanticTokensProvider = vim.NIL, },
              completion = {
                callSnippet = "Replace",
              },
              -- diagnostics = { globals = { "vim" }, },
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
        -- server_capabilities = { semanticTokensProvider = false, },
      }
      local lspconfig = require('lspconfig')
      for server, config in pairs(servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end


      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        "shellcheck",
        "shfmt",
        -- "stylua",
      })
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

      -- require('mason-lspconfig').setup {
      --   ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
      --   automatic_installation = false,
      --   handlers = {
      --     function(server_name)
      --       local server = servers[server_name] or {}
      --       server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
      --       require('lspconfig')[server_name].setup(server)
      --     end,
      --   },
      -- }
    end,
  },
  -- {
  --   "SmiteshP/nvim-navic",
  --   dependencies = {
  --     "neovim/nvim-lspconfig",
  --   },
  --   opts = {
  --     lsp = {
  --       auto_attach = true,
  --       preference = nil,
  --     },
  --     lazy_update_context = true,
  --   },
  --   config = function(_, opts)
  --     local navic = require("nvim-navic")
  --     -- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
  --     navic.setup(opts)
  --     vim.keymap.set("n", "<leader>no", ":Navbuddy<CR>")
  --   end,
  -- },
  -- {
  --   "SmiteshP/nvim-navbuddy",
  --   dependencies = {
  --     "neovim/nvim-lspconfig",
  --     "SmiteshP/nvim-navic",
  --     "MunifTanjim/nui.nvim",
  --   },
  --   opts = { lsp = { auto_attach = true } },
  -- },
}

-- Globally configure all LSP floating preview popups (like hover, signature help, etc)
-- local open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
-- 	opts = opts or {}
-- 	opts.border = opts.border or "rounded" -- Set border to rounded
-- 	return open_floating_preview(contents, syntax, opts, ...)
-- end

--  - filetypes (table): Override the default list of associated filetypes for the server
--  - settings (table): Override the default settings passed when initializing the server.
--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/

-- and elegantly composed help section, `:help lsp-vs-treesitter`
-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
