vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
    -- (vim.hl or vim.highlight).on_yank({ timeout = 200 })
  end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

-- make it easier to close man-files when opened inline
-- vim.api.nvim_create_autocmd("FileType", {
--   group = augroup("man_unlisted"),
--   pattern = { "man" },
--   callback = function(event)
--     vim.bo[event.buf].buflisted = false
--   end,
-- })

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("json_conceal"),
  pattern = { "json", "jsonc", "json5" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})
-- Save and restore fold states
-- vim.api.nvim_create_autocmd("BufWinLeave", {
--   pattern = "*",
--   group = augroup("mkview"),
--   callback = function()
--     if vim.bo.filetype ~= "" then
--       vim.cmd("mkview")
--     end
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("BufWinEnter", {
--   pattern = "*",
--   group = augroup("loadview"),
--   callback = function()
--     if vim.bo.filetype ~= "" then
--       vim.cmd("silent! loadview")
--     end
--   end,
-- })

-- Remember folds between sessions
-- vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
--   pattern = "*",
--   command = "mkview",
-- })
-- vim.api.nvim_create_autocmd("BufWinLeave", {
--   callback = function()
--     if vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
--       vim.cmd("mkview")
--     end
--   end,
-- })
-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
--   pattern = "*",
--   command = "silent! loadview",
-- })
-- vim.api.nvim_create_autocmd("BufWinEnter", {
--   callback = function()
--     if vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
--       vim.cmd("silent! loadview")
--     end
--   end,
-- })

-- don't auto comment new line
-- vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- -- Auto create dir when saving a file, in case some intermediate directory does not exist
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   group = augroup("auto_create_dir"),
--   callback = function(event)
--     if event.match:match("^%w%w+:[\\/][\\/]") then
--       return
--     end
--     local file = vim.uv.fs_realpath(event.match) or event.match
--     vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
--   end,
-- })

-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   pattern = { "*" },
--   command = [[%s/\s\+$//e]],
-- })

-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.diagnostic.enable(false)
-- 	end,
-- })

-- FIX: oil.nvim
-- vim.cmd([[
--   augroup autochange_chdir
--     autocmd!
--     autocmd BufEnter * execute 'lcd ' .. fnamemodify(expand('%:p'), ':h')
--     autocmd BufWritePre * execute 'lcd ' .. fnamemodify(expand('%:p'), ':h')
--   augroup END
-- ]])

-- -- wrap and check for spell in text filetypes
-- vim.api.nvim_create_autocmd("FileType", {
--   group = augroup("wrap_spell"),
--   pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
--   callback = function()
--     vim.opt_local.wrap = true
--     -- vim.opt_local.spell = true
--   end,
-- })

-- -- close some filetypes with <q>
-- vim.api.nvim_create_autocmd("FileType", {
--   group = augroup("close_with_q"),
--   pattern = {
--     "PlenaryTestPopup",
--     "man",
--     "checkhealth",
--     "tsplayground",
--     "dbout",
--     "gitsigns-blame",
--     "help",
--     "lspinfo",
--     "notify",
--     "qf",
--     "startuptime",
--     -- "grug-far",
--     -- "spectre_panel",
--     -- "codecompanion",
--     -- "query",
--     -- "neotest-output",
--     -- "neotest-output-panel",
--     -- "neotest-summary",
--   },
--   callback = function(event)
--     vim.bo[event.buf].buflisted = false
--
--     -- Store the buffer ID
--     local bufnr = event.buf
--
--     vim.schedule(function()
--       -- Check if buffer is still valid before setting keymap
--       if vim.api.nvim_buf_is_valid(bufnr) then
--         vim.keymap.set("n", "q", function()
--           if vim.fn.winnr("$") > 1 then
--             vim.cmd("close")
--           else
--             vim.cmd("bdelete")
--           end
--           pcall(vim.api.nvim_buf_delete, bufnr, { force = true })
--         end, {
--           buffer = bufnr,
--           silent = true,
--           desc = "Quit buffer",
--         })
--       end
--     end)
--   end,
-- })
