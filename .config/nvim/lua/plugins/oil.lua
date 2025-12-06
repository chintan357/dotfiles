return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  opts = {
    -- See :help oil-columns
    win_options = {
      winbar = "%!v:lua.get_oil_winbar()",
    },
    skip_confirm_for_simple_edits = true,
    keymaps = {
      ["g?"] = { "actions.show_help", mode = "n" },
      ["l"] = "actions.select",
      ["h"] = { "actions.parent", mode = "n" },
      ["<C-s>"] = { "actions.select", opts = { vertical = true } },
      ["<C-x>"] = { "actions.select", opts = { horizontal = true } },
      ["<C-t>"] = { "actions.select", opts = { tab = true } },
      ["<C-p>"] = "actions.preview",
      ["q"] = "actions.close",
      -- ["q"] = { "actions.close", mode = "n" }, -- not working
      ["_"] = { "actions.open_cwd", mode = "n" },
      ["`"] = { "actions.cd", mode = "n" },
      ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
      ["gs"] = { "actions.change_sort", mode = "n" },
      ["gx"] = "actions.open_external",
      ["g."] = { "actions.toggle_hidden", mode = "n" },
      ["gd"] = {
        desc = "Toggle detail view",
        callback = function()
          local oil = require("oil")
          local config = require("oil.config")
          if #config.columns == 1 then
            oil.set_columns({ "icon", "permissions", "size", "mtime" })
          else
            oil.set_columns({ "icon" })
          end
        end,
      },
      [">"] = "actions.toggle_hidden",
      ["<C-y>"] = "actions.copy_entry_path",
      ["g\\"] = { "actions.toggle_trash", mode = "n" },
    },
    use_default_keymaps = false,
    view_options = {
      show_hidden = true,
      -- is_hidden_file = function(name, bufnr)
      --   return vim.startswith(name, ".")
      -- end,
      is_always_hidden = function(name, bufnr)
        return name == ".."
        -- return false
      end,
      -- Can be "fast", true, or false. "fast" will turn it off for large directories.
      -- natural_order = true,
      -- case_insensitive = true,
      -- sort = {
      --   { "type", "asc" },
      --   { "name", "asc" },
      -- },
    },
  },
  config = function(_, opts)
    require("oil").setup(opts)
    vim.keymap.set("n", "<M-o>", "<cmd>Oil<CR>", { silent = true, noremap = true })
    function _G.get_oil_winbar()
      local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
      local dir = require("oil").get_current_dir(bufnr)
      if dir then
        return vim.fn.fnamemodify(dir, ":~")
      else
        -- If there is no current directory (e.g. over ssh), just show the buffer name
        return vim.api.nvim_buf_get_name(0)
      end
    end
  end,
}
