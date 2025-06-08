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
    vim.cmd('wincmd _')
    vim.cmd('wincmd |')
  end
end

vim.keymap.set('n', '<leader>vo', ToggleMaximizeWindow, { noremap = true, silent = true })

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
    "%<",          -- truncate here if too long
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
