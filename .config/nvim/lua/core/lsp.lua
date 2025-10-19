-- ~/.config/nvim/lsp
-- ~/.config/nvim/after/lsp
-- ~/.config/nvim/after/lsp/lua_ls.lua

-- https://github.com/Rishabh672003/Neovim/blob/main/lua/rj/lsp.lua
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

local config = {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
  update_in_insert = true,
  underline = true,
  virtual_text = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "single", -- "rounded"
    source = "always", -- true
    header = "",
    prefix = "",
    suffix = "",
  },
}
vim.diagnostic.config(config)

local icons = {
  Class = " ",
  Color = " ",
  Constant = " ",
  Constructor = " ",
  Enum = " ",
  EnumMember = " ",
  Event = " ",
  Field = " ",
  File = " ",
  Folder = " ",
  Function = "󰊕 ",
  Interface = " ",
  Keyword = " ",
  Method = "ƒ ",
  Module = "󰏗 ",
  Property = " ",
  Snippet = " ",
  Struct = " ",
  Text = " ",
  Unit = " ",
  Value = " ",
  Variable = " ",
}

local completion_kinds = vim.lsp.protocol.CompletionItemKind
for i, kind in ipairs(completion_kinds) do
  completion_kinds[i] = icons[kind] and icons[kind] .. kind or kind
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.foldingRange = {
  dynamicRegistration = true,
  lineFoldingOnly = true,
}

capabilities.textDocument.semanticTokens.multilineTokenSupport = true
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config("*", {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    local ok, diag = pcall(require, "extras.workspace-diagnostic")
    if ok then
      diag.populate_workspace_diagnostics(client, bufnr)
    end
  end,
})

-- Disable the default keybinds {{{
-- for _, bind in ipairs({ "grn", "gra", "gri", "grr" }) do
--   pcall(vim.keymap.del, "n", bind)
-- end
-- }}}

-- Create keybindings, commands, inlay hints and autocommands on LSP attach {{{
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then
      return
    end
    --     ---@diagnostic disable-next-line need-check-nil
    --     if client.server_capabilities.completionProvider then
    --       vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
    --       -- vim.bo[bufnr].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
    --     end
    --     ---@diagnostic disable-next-line need-check-nil
    --     if client.server_capabilities.definitionProvider then
    --       vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
    --     end
    --
    --     -- -- nightly has inbuilt completions, this can replace all completion plugins
    --     -- if client:supports_method("textDocument/completion", bufnr) then
    --     --   -- Enable auto-completion
    --     --   vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
    --     -- end
    --
    --     --- Disable semantic tokens
    --     ---@diagnostic disable-next-line need-check-nil
    --     client.server_capabilities.semanticTokensProvider = nil
    --
    --     -- All the keymaps
    --     -- stylua: ignore start
    local keymap = vim.keymap.set
    local lsp = vim.lsp
    local opts = { silent = true }
    local function opt(desc, others)
      return vim.tbl_extend("force", opts, { desc = desc }, others or {})
    end
    --     -- keymap("n", "gd", lsp.buf.definition, opt("Go to definition"))
    --     -- keymap("n", "gD", function()
    --     --   local ok, diag = pcall(require, "rj.extras.definition")
    --     --   if ok then
    --     --     diag.get_def()
    --     --   end
    --     -- end, opt("Get the definition in a float"))
    --     -- keymap("n", "gi", function() lsp.buf.implementation({ border = "single" })  end, opt("Go to implementation"))
    --     -- keymap("n", "gr", lsp.buf.references, opt("Show References"))
    --     -- keymap("n", "gl", vim.diagnostic.open_float, opt("Open diagnostic in float"))
    --     -- keymap("n", "<C-k>", lsp.buf.signature_help, opts)
    --     -- disable the default binding first before using a custom one
    --     -- pcall(vim.keymap.del, "n", "K", { buffer = ev.buf })
    --     -- keymap("n", "K", function() lsp.buf.hover({ border = "single", max_height = 30, max_width = 120 }) end, opt("Toggle hover"))
    --     -- keymap("n", "<Leader>lF", vim.cmd.FormatToggle, opt("Toggle AutoFormat"))
    --     -- keymap("n", "<Leader>lI", vim.cmd.Mason, opt("Mason"))
    --     -- keymap("n", "<Leader>lS", lsp.buf.workspace_symbol, opt("Workspace Symbols"))
    --     -- keymap("n", "<Leader>la", lsp.buf.code_action, opt("Code Action"))
    --     -- keymap("n", "<Leader>lh", function() lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled({})) end, opt("Toggle Inlayhints"))
    --     -- keymap("n", "<Leader>li", vim.cmd.LspInfo, opt("LspInfo"))
    --     -- keymap("n", "<Leader>ll", lsp.codelens.run, opt("Run CodeLens"))
    --     -- keymap("n", "<Leader>lr", lsp.buf.rename, opt("Rename"))
    --     -- keymap("n", "<Leader>ls", lsp.buf.document_symbol, opt("Doument Symbols"))
    --
    --     -- diagnostic mappings
    --     -- keymap("n", "<Leader>dD", function()
    --     --   local ok, diag = pcall(require, "rj.extras.workspace-diagnostic")
    --     --   if ok then
    --     --     for _, cur_client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    --     --       diag.populate_workspace_diagnostics(cur_client, 0)
    --     --     end
    --     --     vim.notify("INFO: Diagnostic populated")
    --     --   end
    --     -- end, opt("Popluate diagnostic for the whole workspace"))
    --     -- keymap("n", "<Leader>dn", function() vim.diagnostic.jump({ count = 1, float = true }) end, opt("Next Diagnostic"))
    --     -- keymap("n", "<Leader>dp", function() vim.diagnostic.jump({ count =-1, float = true }) end, opt("Prev Diagnostic"))
    --     -- keymap("n", "<Leader>dq", vim.diagnostic.setloclist, opt("Set LocList"))
    --     -- keymap("n", "<Leader>dv", function()
    --     -- vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines }) end, opt("Toggle diagnostic virtual_lines"))
    --     -- stylua: ignore end
  end,
})
-- }}}

-- local group = vim.api.nvim_create_augroup("LspMappings", { clear = true })
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = group,
--   callback = function(args)
--     local opts = { buffer = args.buf, silent = true }
--
--     set(n, "gd", function()
--       vim.lsp.buf.definition({})
--     end, opts)
--     set(n, "K", vim.lsp.buf.hover, opts)
--     set(n, "<c-s-K>", vim.lsp.buf.signature_help, opts)
--     set(n, "gD", function()
--       vim.lsp.buf.implementation({})
--     end, opts)
--     set(n, "1gD", function()
--       vim.lsp.buf.type_definition({})
--     end, opts)
--     set(n, "gr", function()
--       vim.lsp.buf.references()
--     end, opts)
--
--     set(n, "<c-]>", function()
--       vim.lsp.buf.declaration({})
--     end, opts)
--
--     set(n, "<Leader>re", vim.lsp.buf.rename, opts)
--     set(n, "<Leader>ca", vim.lsp.buf.code_action, opts)
--     set(n, "<Leader>ih", function()
--       -- toggles inlay hints
--       vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
--     end, opts)
--
--     -- diagnostics
--     set(n, "<Leader>di", vim.diagnostic.open_float, opts)
--     set(n, "<Leader>k", function()
--       vim.diagnostic.jump({ float = true, count = -1 })
--     end, opts)
--     set(n, "<Leader>j", function()
--       vim.diagnostic.jump({ float = true, count = 1 })
--     end, opts)
--   end,
-- })

vim.lsp.config["lua_ls"] = {
  name = "lua_ls",
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".git",
  },
  settings = {
    Lua = {
      -- runtime = { version = "LuaJIT", },
      telemetry = { enable = false },
    },
  },
}
vim.lsp.enable("lua_ls")

vim.lsp.config["copilot"] = {
  name = "copilot",
  cmd = {
    "copilot-language-server",
    "--stdio",
  },
  filetypes = { "*" },
  root_markers = { ".git" },
  settings = {
    telemetry = {
      enable = false,
    },
  },
}
-- vim.lsp.enable("copilot")

-- vim.lsp.config.ty = {
--   name = "ty",
--   cmd = { "ty", "server" },
--   filetypes = { "python" },
--   root_markers = { "ty.toml", "pyproject.toml", ".git" },
-- }
-- vim.lsp.enable("ty")
-- vim.lsp.config.ruff = {
--   name = "ruff",
--   cmd = { "ruff", "server" },
--   filetypes = { "python" },
--   root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
--   -- settings = {},
-- }
-- vim.lsp.enable("ruff")

vim.lsp.config.pyright = {
  filetypes = { "python" },
  cmd = { "pyright-langserver", "--stdio" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json",
    ".git",
  },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
      },
    },
  },
  -- settings = {
  --   -- python = {
  --   --   venvPath = vim.fn.expand("~") .. "/.virtualenvs",
  --   -- },
  --   basedpyright = {
  --     disableOrganizeImports = true,
  --     -- analysis = {
  --     --   autoSearchPaths = true,
  --     --   autoImportCompletions = true,
  --     --   useLibraryCodeForTypes = true,
  --     --   diagnosticMode = "openFilesOnly",
  --     --   typeCheckingMode = "strict",
  --     --   inlayHints = {
  --     --     variableTypes = true,
  --     --     callArgumentNames = true,
  --     --     functionReturnTypes = true,
  --     --     genericTypes = false,
  --     --   },
  --     -- },
  --   },
  -- },
}

vim.lsp.enable("pyright")

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "python",
--   callback = function()
--     local ok, venv = pcall(require, "rj.extras.venv")
--     if ok then
--       venv.setup()
--     end
--     local root = vim.fs.root(0, {
--       "pyproject.toml",
--       "setup.py",
--       "setup.cfg",
--       "requirements.txt",
--       "Pipfile",
--       "pyrightconfig.json",
--       ".git",
--       vim.uv.cwd(),
--     })
--     local client =
--       vim.lsp.start(vim.tbl_extend("force", vim.lsp.config.basedpyright, { root_dir = root }), { attach = false })
--     if client then
--       vim.lsp.buf_attach_client(0, client)
--     end
--   end,
-- })
-- }}}

-- vim.lsp.config.gopls = {
--   cmd = { "gopls" },
--   filetypes = { "go", "gotempl", "gowork", "gomod" },
--   root_markers = { ".git", "go.mod", "go.work", vim.uv.cwd() },
--   settings = {
--     gopls = {
--       completeUnimported = true,
--       usePlaceholders = true,
--       analyses = {
--         unusedparams = true,
--       },
--       ["ui.inlayhint.hints"] = {
--         compositeLiteralFields = true,
--         constantValues = true,
--         parameterNames = true,
--         rangeVariableTypes = true,
--       },
--     },
--   },
-- }

-- vim.lsp.config.bashls = {
--   cmd = { "bash-language-server", "start" },
--   filetypes = { "bash", "sh", "zsh" },
--   root_markers = { ".git", vim.uv.cwd() },
--   settings = {
--     bashIde = {
--       globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)",
--     },
--   },
-- }
-- vim.lsp.enable("bashls")

-- vim.lsp.config.eslint = {
--   cmd = { "vscode-eslint-language-server", "--stdio" },
--   filetypes = {
--     "javascript",
--     "javascriptreact",
--     "javascript.jsx",
--     "typescript",
--     "typescriptreact",
--     "typescript.tsx",
--     "vue",
--     "svelte",
--     "astro",
--     "htmlangular",
--   },
--   root_markers = { ".git", "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" },
--   settings = {
--     codeAction = {
--       disableRuleComment = {
--         enable = true,
--         location = "separateLine",
--       },
--       showDocumentation = {
--         enable = true,
--       },
--     },
--     codeActionOnSave = {
--       enable = false,
--       mode = "all",
--     },
--     experimental = {
--       useFlatConfig = false,
--     },
--     format = true,
--     nodePath = "",
--     onIgnoredFiles = "off",
--     problems = {
--       shortenToSingleLine = false,
--     },
--     quiet = false,
--     rulesCustomizations = {},
--     run = "onType",
--     useESLintClass = false,
--     validate = "on",
--     workingDirectory = {
--       mode = "auto",
--     },
--   },
-- }

-- vim.lsp.enable("eslint")

vim.api.nvim_create_user_command("LspStart", function()
  vim.cmd.e()
end, { desc = "Starts LSP clients in the current buffer" })

vim.api.nvim_create_user_command("LspStop", function(opts)
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    if opts.args == "" or opts.args == client.name then
      client:stop(true)
      vim.notify(client.name .. ": stopped")
    end
  end
end, {
  desc = "Stop all LSP clients or a specific client attached to the current buffer.",
  nargs = "?",
  complete = function(_, _, _)
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    local client_names = {}
    for _, client in ipairs(clients) do
      table.insert(client_names, client.name)
    end
    return client_names
  end,
})

vim.api.nvim_create_user_command("LspRestart", function()
  local detach_clients = {}
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    client:stop(true)
    if vim.tbl_count(client.attached_buffers) > 0 then
      detach_clients[client.name] = { client, vim.lsp.get_buffers_by_client_id(client.id) }
    end
  end
  local timer = vim.uv.new_timer()
  if not timer then
    return vim.notify("Servers are stopped but havent been restarted")
  end
  timer:start(
    100,
    50,
    vim.schedule_wrap(function()
      for name, client in pairs(detach_clients) do
        local client_id = vim.lsp.start(client[1].config, { attach = false })
        if client_id then
          for _, buf in ipairs(client[2]) do
            vim.lsp.buf_attach_client(buf, client_id)
          end
          vim.notify(name .. ": restarted")
        end
        detach_clients[name] = nil
      end
      if next(detach_clients) == nil and not timer:is_closing() then
        timer:close()
      end
    end)
  )
end, {
  desc = "Restart all the language client(s) attached to the current buffer",
})

vim.api.nvim_create_user_command("LspLog", function()
  vim.cmd.vsplit(vim.lsp.log.get_filename())
end, {
  desc = "Get all the lsp logs",
})

vim.api.nvim_create_user_command("LspInfo", function()
  vim.cmd("silent checkhealth vim.lsp")
end, {
  desc = "Get all the information about all LSP attached",
})

-- vim: fdm=marker:fdl=0
