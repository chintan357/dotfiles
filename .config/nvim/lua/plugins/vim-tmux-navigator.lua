return {
  "christoomey/vim-tmux-navigator",
  event = "BufEnter",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<c-h>",  "<cmd>TmuxNavigateLeft<cr>", },
    { "<c-j>",  "<cmd>TmuxNavigateDown<cr>", },
    { "<c-k>",  "<cmd>TmuxNavigateUp<cr>", },
    { "<c-l>",  "<cmd>TmuxNavigateRight<cr>", },
    { "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", },
  },
  config = function()
    vim.keymap.set("i", "<C-h>", "<C-o>:TmuxNavigateLeft<cr>", { noremap = true, silent = true })
    vim.keymap.set("i", "<C-j>", "<C-o>:TmuxNavigateDown<cr>", { noremap = true, silent = true })
    vim.keymap.set("i", "<C-k>", "<C-o>:TmuxNavigateUp<cr>", { noremap = true, silent = true })
    vim.keymap.set("i", "<C-l>", "<C-o>:TmuxNavigateRight<cr>", { noremap = true, silent = true })

    vim.keymap.set("v", "<C-h>", ":<C-u>TmuxNavigateLeft<cr>gv", { noremap = true, silent = true })
    vim.keymap.set("v", "<C-j>", ":<C-u>TmuxNavigateDown<cr>gv", { noremap = true, silent = true })
    vim.keymap.set("v", "<C-k>", ":<C-u>TmuxNavigateUp<cr>gv", { noremap = true, silent = true })
    vim.keymap.set("v", "<C-l>", ":<C-u>TmuxNavigateRight<cr>gv", { noremap = true, silent = true })

    -- vim.g.tmux_navigator_no_mappings = 1
    -- " Write all buffers before navigating from Vim to tmux pane
    -- vim.g.tmux_navigator_save_on_switch = 2
    -- " Disable tmux navigator when zooming the Vim pane
    -- vim.g.tmux_navigator_disable_when_zoomed = 1
    -- " If the tmux window is zoomed, keep it zoomed when moving from Vim to another pane
    -- vim.g.tmux_navigator_preserve_zoom = 1
  end,
}
