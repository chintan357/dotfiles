local win_state = {}

function ToggleMaximizeWindow()
  local current_win = vim.api.nvim_get_current_win()
  if win_state.win and win_state.win == current_win then
    -- Restore window sizes
    vim.api.nvim_set_current_win(win_state.win)
    for _, entry in ipairs(win_state.sizes) do
      vim.api.nvim_win_set_width(entry.win, entry.width)
      vim.api.nvim_win_set_height(entry.win, entry.height)
    end
    win_state = {}
  else
    -- Save current layout
    win_state = { win = current_win, sizes = {} }
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      table.insert(win_state.sizes, {
        win = win,
        width = vim.api.nvim_win_get_width(win),
        height = vim.api.nvim_win_get_height(win),
      })
    end
    -- Maximize current window
    vim.cmd("wincmd _")
    vim.cmd("wincmd |")
  end
end

vim.keymap.set("n", "<leader>vo", ToggleMaximizeWindow, { noremap = true, silent = true })

local currentmode = {
  n = "N",
  v = "V",
  V = "VL",
  [""] = "VB",
  i = "I",
  R = "R",
  c = "C",
  ["r?"] = "Confirm",
  t = "T",
}

-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

BuildStatusline = function()
  local vim_mode = currentmode[vim.fn.mode()] or "?"
  local relative_path = vim.fn.expand("%:~:.")
  local parts = {
    -- "%n",
    "[",
    vim_mode,
    "]",
    " ",
    "%<", -- truncate here if too long
    relative_path, -- filename
    -- "%4* %<%f%*", -- filename
    " ",
    "%h", -- help text indicator
    "%m",
    "  %#Normal#",
    -- "%{%v:lua.require'nvim-navic'.get_location()%}",
    " ",
    "%r",
    "%=", -- alignment break
    "%y",
    " ",
    "%P",
  }
  return table.concat(parts)
end

-- vim.opt.statusline = "%!v:lua.BuildStatusline()"

-- Function to select text between markdown code blocks
local function select_markdown_codeblock()
  -- Save current cursor position
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local current_line = cursor_pos[1]

  -- Search backwards for opening ```
  local start_line = nil
  for i = current_line, 1, -1 do
    local line_content = vim.api.nvim_buf_get_lines(0, i - 1, i, false)[1] or ""
    if line_content:match("^```") then
      start_line = i
      break
    end
  end

  if not start_line then
    print("No opening code block found")
    return
  end

  -- Search forwards for closing ```
  local end_line = nil
  local total_lines = vim.api.nvim_buf_line_count(0)
  for i = current_line + 1, total_lines do
    local line_content = vim.api.nvim_buf_get_lines(0, i - 1, i, false)[1] or ""
    if line_content:match("^```") then
      end_line = i
      break
    end
  end

  if not end_line then
    print("No closing code block found")
    return
  end

  -- Select the content between the code blocks (excluding the ``` lines)
  vim.api.nvim_win_set_cursor(0, { start_line + 1, 0 })
  vim.cmd("normal! V")
  vim.api.nvim_win_set_cursor(0, { end_line - 1, vim.fn.col("$") })
end

vim.keymap.set("n", ",sc", select_markdown_codeblock, {
  desc = "Select markdown code block content",
  silent = true,
})

-- local function toggle_blink()
--   vim.b.completion = not vim.b.completion
--   require("blink.cmp").hide()
--   print("blink.cmp: " .. (vim.b.completion and "ON" or "OFF"))
-- end
--
-- vim.keymap.set({ "n" }, "yoc", toggle_blink, { desc = "Toggle completion" })
