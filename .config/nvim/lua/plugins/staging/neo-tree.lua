return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  -- version = "*",
  cmd = { "Neotree" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "\\\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
  },
  config = function()
    vim.keymap.set("n", "<leader>fe", "<cmd>Neotree toggle<cr>", { noremap = true, silent = true })
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      window = {
        mappings = {
          ["<space>"] = {
            "toggle_node",
            nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
          },
          ["l"] = "open",
        },
      },
      hijack_netrw_behavior = "disabled",
    })
  end,
}
-- opts = {
-- 	filesystem = {
-- 		window = {
-- 			mappings = {
-- 				["\\"] = "close_window",
-- 			},
-- 		},
-- 	},
-- },
