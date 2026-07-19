local function augroup(name)
  return vim.api.nvim_create_augroup("neo_" .. name, { clear = true })
end

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
    "man",
    "checkhealth",
    "help",
    -- "codecompanion",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    -- vim.schedule(function()
    vim.keymap.set("n", "q", function()
      if vim.fn.winnr("$") > 1 then
        vim.cmd("close")
      else
        -- vim.cmd("bdelete") -- closes the buffer but keeps the window
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end
    end, {
      buffer = event.buf,
      silent = true,
      desc = "Quit buffer",
    })
    -- end)
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
