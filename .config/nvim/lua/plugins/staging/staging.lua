--\| hor resize 10 \| term

-- function M.ghline()
-- 	map("", "<Leader>gO", "<Plug>(gh-repo)", {})
-- 	map("", "<Leader>gL", "<Plug>(gh-line)", {})
-- end

-- vim.keymap.set("n", "<leader>a", function()
-- 	vim.cmd("Rg")
-- end)
-- vim.keymap.set("n", "<leader>e", function()
-- 	vim.cmd("RgIgnoreFilename")
-- end)
-- vim.keymap.set("n", "<leader>b", function()
-- 	vim.cmd("Buffers")
-- end)
-- vim.keymap.set("n", "<C-N>", function()
-- 	vim.cmd("Lines")
-- end)
-- vim.keymap.set("n", "<C-P>", function()
-- 	vim.cmd("Files")
-- end)

-- fzf.vim configuration {{{
vim.api.nvim_create_user_command("RgIgnoreFilename", function(opts)
  local spec = vim.fn["fzf#vim#with_preview"]()
  spec.options = { "--delimiter", ":", "--nth", 4, unpack(spec.options) }
  vim.fn["fzf#vim#grep"](
    "rg --column --line-number --no-heading --color=always --smart-case -- " .. vim.fn.shellescape(opts.args),
    spec,
    opts.bang and 1 or 0
  )
end, { nargs = "*", bang = true })
vim.api.nvim_create_user_command("RgIgnoreTests", function(opts)
  local spec = vim.fn["fzf#vim#with_preview"]()
  spec.options = { "--delimiter", ":", "--nth", 4, unpack(spec.options) }
  vim.fn["fzf#vim#grep"](
    "rg --column --line-number --no-heading --color=always --smart-case --glob !test/ --glob !spec/ -- "
    .. vim.fn.shellescape(opts.args),
    spec,
    opts.bang and 1 or 0
  )
end, { nargs = "*", bang = true })

return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
  },
  config = function()
    require("neoclip").setup({
      history = 1000,
      enable_persistent_history = false,
      length_limit = 1048576,
      continuous_sync = false,
      db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
      filter = nil,
      preview = true,
      prompt = nil,
      default_register = '"',
      default_register_macros = "q",
      enable_macro_history = true,
      content_spec_column = false,
      disable_keycodes_parsing = false,
      on_select = {
        move_to_front = false,
        close_telescope = true,
      },
      on_paste = {
        set_reg = false,
        move_to_front = false,
        close_telescope = true,
      },
      on_replay = {
        set_reg = false,
        move_to_front = false,
        close_telescope = true,
      },
      on_custom_action = {
        close_telescope = true,
      },
      keys = {
        telescope = {
          i = {
            select = "<cr>",
            paste = "<c-j>",
            paste_behind = "<c-k>",
            replay = "<c-q>", -- replay a macro
            delete = "<c-d>", -- delete an entry
            edit = "<c-e>", -- edit an entry
            custom = {},
          },
          n = {
            select = "<cr>",
            paste = "p",
            --- It is possible to map to more than one key.
            -- paste = { 'p', '<c-p>' },
            paste_behind = "P",
            replay = "q",
            delete = "d",
            edit = "e",
            custom = {},
          },
        },
      },
    })

    vim.keymap.set("n", "<leader>o", "<cmd>Telescope neoclip<CR>", { desc = "Telescope Neoclip" })
  end,
}


return {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  config = function()
    vim.o.foldcolumn = "1" -- '0' is not bad
    vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
    vim.keymap.set("n", "zK", function()
      local winid = require("ufo").peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end, { desc = "Peek Fold" })

    require("ufo").setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { "lsp", "indent" }
      end,
    })
  end,
}

return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "ObsidianVault",
          path = "/Users/andrew/Documents/ObsidianVault",
        },
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      new_notes_location = "notes_subdir",
      note_id_func = function(title)
        return title
      end,
      note_frontmatter_func = function(note)
        local out = { id = note.id, aliases = note.aliases, tags = note.tags }

        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end

        return out
      end,
      mappings = {},

      templates = {
        subdir = "Templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        tags = "",
        substitutions = {
          yesterday = function()
            return os.date("%Y-%m-%d", os.time() - 86400)
          end,
          tomorrow = function()
            return os.date("%Y-%m-%d", os.time() + 86400)
          end,
        },
      },

      ui = {
        enable = true,
      },
    })
  end,
}

vim.keymap.set({ "n", "v" }, ";", ":")
vim.keymap.set({ "n", "v" }, ":", ";")
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
--
-- Lsp Lines
vim.keymap.set("n", "<Leader>lt", function()
  require("lsp_lines").toggle()
end, { desc = "toggle `lsp_lines`" })
--
-- Toggleterm
vim.keymap.set("n", "<Leader>t", function()
  return "<cmd>" .. tostring(vim.v.count1) .. "ToggleTerm direction=float<CR>"
end, { expr = true, silent = true })
-- Neogen
vim.keymap.set(
  "n",
  "<Leader>o",
  "<cmd>Neogen<CR>",
  { desc = "generates documentation for the current item", silent = true }
)
