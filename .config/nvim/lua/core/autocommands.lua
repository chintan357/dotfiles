local function augroup(name)
  return vim.api.nvim_create_augroup("neo_" .. name, { clear = true })
end

-- don't auto comment new line
-- vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

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

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "man",
    "checkhealth",
    "tsplayground",
    "dbout",
    "gitsigns-blame",
    "help",
    "lspinfo",
    "notify",
    "qf",
    "startuptime",
    -- "grug-far",
    -- "spectre_panel",
    -- "codecompanion",
    -- "query",
    -- "neotest-output",
    -- "neotest-output-panel",
    -- "neotest-summary",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})

-- make it easier to close man-files when opened inline
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("man_unlisted"),
  pattern = { "man" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
  end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("json_conceal"),
  pattern = { "json", "jsonc", "json5" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})


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
