-- See `:help telescope` and `:help telescope.setup()` and `:help telescope.builtin` and `:help telescope.defaults.mappings`
return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    lazy = true,
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "nvim-tree/nvim-web-devicons",            enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- local actions = require("telescope.actions")
      -- local action_layout = require("telescope.actions.layout")
      -- local action_state = require("telescope.actions.state")
      local builtin = require("telescope.builtin")

      require("telescope").setup({
        defaults = {
          --   mappings = {
          --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
          --   },
          prompt_prefix = "🔍 ",
          -- prompt_prefix = "  ",
          -- entry_prefix = "  ",
          color_devicons = true,
          path_display = { "smart" },
          dynamic_preview_title = true,
          -- selection_caret = "  ",
          preview = {
            filesize_limit = 0.1, --MB
          },
          -- wrap_results = true,
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
          -- selection_strategy = "reset",
          -- winblend = 0,
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim",
            "--hidden",
            "--glob",
            "!**/.git/*"
          },
          set_env = { COLORTERM = "truecolor" },
          file_ignore_patterns = {
            ".git/",
            "%.jpg",
            "%.jpeg",
            "%.png",
            "%.svg",
            "%.otf",
            "%.ttf",
            "__pycache__",
            "%.sqlite3",
            "%.ipynb",
            "node_modules",
          },
          -- file_sorter = require("telescope.sorters").get_fuzzy_file,
        },
        pickers = {
          -- diagnostics = {
          --   theme = "ivy",
          --   initial_mode = "normal",
          --   layout_config = {
          --     preview_cutoff = 9999,
          --   },
          -- },
          -- find_files = {
          --   find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
          --   mappings = {
          --     n = {
          --       ["cd"] = function(prompt_bufnr)
          --         local selection = require("telescope.actions.state").get_selected_entry()
          --         local dir = vim.fn.fnamemodify(selection.path, ":p:h")
          --         require("telescope.actions").close(prompt_bufnr)
          --         -- Depending on what you want put `cd`, `lcd`, `tcd`
          --         vim.cmd(string.format("silent lcd %s", dir))
          --       end,
          --     },
          --   },
          -- },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
          -- fzf = {
          --   fuzzy = true,
          --   override_generic_sorter = true,
          --   override_file_sorter = true,
          --   case_mode = "smart_case",
          -- },
          -- zoxide = {},
          -- 	show_scores = false,
          -- 	show_unindexed = false,
          -- 	ignore_patterns = {
          -- 		"*.git/*",
          -- 		"*/tmp/*",
          -- 		"*/node_modules/*",
          -- 		"*/vendor/*",
          -- 	},
          -- 	-- workspaces = {
          -- 	--   ["nvim"] = os.getenv("HOME_DIR") .. ".config/nvim",
          -- 	--   ["dots"] = os.getenv("HOME_DIR") .. ".dotfiles",
          -- 	--   ["project"] = os.getenv("PROJECT_DIR"),
          -- 	-- },
          -- },
        },
      })

      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")
      -- require("telescope").load_extension("undo")
      -- pcall(require("telescope").load_extension, "smart_history")

      local is_inside_work_tree = {}

      local project_files = function()
        local opts = {} -- define here if you want to define something

        local cwd = vim.fn.getcwd()
        if is_inside_work_tree[cwd] == nil then
          vim.fn.system("git rev-parse --is-inside-work-tree")
          is_inside_work_tree[cwd] = vim.v.shell_error == 0
        end

        if is_inside_work_tree[cwd] then
          builtin.git_files(opts)
        else
          builtin.find_files(opts)
        end
      end

      vim.keymap.set("n", "<leader><Space>", project_files)
      -- vim.vim.keymap.set('n', '<leader>.', function() builtin.find_files({ cwd = vim.fn.expand('%:p:h') }) end)

      -- stylua: ignore start
      vim.keymap.set("n", "<leader>sk", builtin.keymaps)
      vim.keymap.set("n", "<leader>sh", builtin.help_tags)

      -- vim.keymap.set("n", "<leader>s:", builtin.command_history)
      -- vim.keymap.set("n", '<leader>s"', builtin.registers)
      -- vim.keymap.set("n", "<leader>sa", builtin.autocommands)
      -- vim.keymap.set("n", "<leader>sm", builtin.marks)

      vim.keymap.set("n", "<leader>sf", function() builtin.find_files({ hidden = true }) end)
      -- vim.keymap.set("n", "<leader>sF", function() builtin.find_files({ cwd = vim.fn.expand("~") }) end)
      -- vim.keymap.set("n", "<leader>sr", builtin.oldfiles)
      vim.keymap.set("n", "<leader>sc", function() builtin.find_files({ cwd = vim.fn.stdpath("config") }) end)
      vim.keymap.set("n", "<leader>sa", function() builtin.find_files({ cwd = "/mnt/c/chintan357/vaults/atomic" }) end)
      vim.keymap.set("n", "<leader>sb",
        function() builtin.buffers({ path_display = { "smart" }, sort_mru = true, sort_lastused = true }) end)
      -- vim.keymap.set("n", "<C-p>", function() builtin.buffers({ path_display = { "smart" }, sort_mru = true, sort_lastused = true }) end)

      -- vim.keymap.set("n", "<leader>sq", builtin.quickfix)

      vim.keymap.set("n", "<leader>hf", builtin.git_files)
      vim.keymap.set("n", "<leader>hc", builtin.git_commits)
      vim.keymap.set("n", "<leader>hs", builtin.git_status)
      -- builtin.git_bcommits
      -- builtin.git_bcommits_range
      -- builtin.git_branches
      -- builtin.git_stash

      vim.keymap.set("n", "<leader>sH", builtin.highlights)
      vim.keymap.set("n", "<leader>sM", builtin.man_pages)
      -- vim.keymap.set("n", "<leader>sC", builtin.commands)

      vim.keymap.set("n", "<leader>fs", require("telescope.builtin").treesitter)
      vim.keymap.set("n", "<leader>fm",
        function() require("telescope.builtin").treesitter({ default_text = ":method:" }) end)
      vim.keymap.set("n", "<leader>fw", builtin.grep_string)

      vim.keymap.set("n", "<leader>sg", function() builtin.live_grep({ path_display = { "smart" } }) end)
      vim.keymap.set("n", "<leader>s/",
        function()
          builtin.live_grep({
            path_display = { "shorten" },
            grep_open_files = true,
            prompt_title =
            "Live Grep in Open Files"
          })
        end, { desc = "[S]earch [/] in Open Files" })
      vim.keymap.set("n", "<leader>/", function()
        builtin.current_buffer_fuzzy_find(
          require("telescope.themes").get_dropdown({ winblend = 0, previewer = false })
        )
      end)

      -- vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
      -- vim.keymap.set("n", "<leader>tb", builtin.builtin)

      -- builtin.vimoptions
    end,
  },
  {
    "jvgrootveld/telescope-zoxide",
    dependencies = {
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      require("telescope").load_extension("zoxide")
      vim.keymap.set("n", "<leader>cd", "<cmd>Telescope zoxide list<cr>")
    end
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      require("telescope").load_extension("frecency")
      vim.keymap.set("n", "<leader>sr", "<cmd>Telescope frecency<cr>")
    end
    -- "<cmd>lua require('telescope').extensions.frecency.frecency({ prompt_title = 'Recent Files', workspace = 'CWD', path_display = { 'smart' } })<CR>"
  },
}
