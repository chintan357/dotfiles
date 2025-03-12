return {
  "jpalardy/vim-slime",
  init = function()
    vim.g.slime_target = "tmux"
    vim.g.slime_no_mappings = 1
    vim.g.slime_paste_file = vim.fn.expand("$HOME/.slime_paste")
    vim.g.slime_default_config = { socket_name = "default", target_pane = "1" }
    vim.g.slime_dont_ask_default = true
    vim.g.slime_bracketed_paste = 1
    vim.g.slime_cell_delimiter = "#{{{"
    -- vim.g.slime_python_ipython = true
  end,
  config = function()
    -- vim.keymap.set("n", "<leader>al", "<Plug>SlimeLineSend")
    -- vim.keymap.set("n", "<leader>am", "<Plug>SlimeMotionSend<cr>")
    -- vim.keymap.set("n", "<leader>ac", "<Plug>SlimeSendCell<cr>")
    -- vim.keymap.set("n", "<leader>ap", "<Plug>SlimeParagraphSend")
    -- vim.keymap.set("n", "<leader>sl", "<Plug>SlimeConfig<cr>")
    -- nmap <leader>s <Plug>SlimeMotionSend

    -- vim.cmd([[
    --     xmap <silent> <leader>sl :<C-U>exec 'let g:slime_default_config.target_pane = "1"'<cr><Plug>SlimeRegionSend
    --     xmap <silent> <leader>sr :<C-U>exec 'let g:slime_default_config.target_pane = "2"'<cr><Plug>SlimeRegionSend
    --   ]])

    -- vim.keymap.set({ "x", "v" }, "<leader>", function() end)

    vim.keymap.set({ "x", "v" }, "<leader>s", "my<Plug>SlimeRegionSend<cr>`y", { noremap = true, silent = true })
  end,
}
