vim.keymap.set("n", "\tnn", "<Plug>(neorg.dirman.new-note)", { buffer = true })
-- vim.keymap.set("n", "", "<Plug>(neorg.pivot.list.toggle)", { buffer = true })
-- vim.keymap.set("n", "", "<Plug>(neorg.itero.next-iteration)", { buffer = true })
-- vim.keymap.set("n", "", "<Plug>(neorg.tempus.insert-date.insert-mode)", { buffer = true })
-- vim.keymap.set("n", "", "<Plug>(neorg.qol.todo-items.todo.task-cycle)", { buffer = true })
-- vim.keymap.set("n", "", "<Plug>(neorg.esupports.hop.hop-link)", { buffer = true })
-- vim.keymap.set("n", "", "<Plug>(neorg.esupports.hop.hop-link.vsplit)", { buffer = true })

-- :h ftplugin (more in-depth about this approach; not really needed for simple use cases)
-- :h ftplugin-special (notes about special things to use in these files)
-- :h lua-vim-setlocal (use vim.opt_local to set option locally)
-- :h after-directory (use 'after' directory so that these options are not overridden by defaults)
--
-- vim.api.nvim_create_autocmd("Filetype", {
--     pattern = "norg",
--     callback = function()
--         vim.keymap.set("n", "my-key-here", "<Plug>(neorg.pivot.list.toggle)", { buffer = true })
--     end,
-- })
