return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  -- -@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    -- bigfile = { enabled = true },
    dashboard = {
      preset = {
        header = [[
 _   _ _____ _____     _____ __  __
| \ | | ____/ _ \ \   / /_ _|  \/  |
|  \| |  _|| | | \ \ / / | || |\/| |
| |\  | |__| |_| |\ V /  | || |  | |
|_| \_|_____\___/  \_/  |___|_|  |_|
]]
      },
    },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    -- notifier = { enabled = true },
    quickfile = { enabled = true },
    zen = { enabled = true },
    scope = { enabled = true },
    -- scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  }
}

--       ████ ██████           █████      ██
--      ███████████             █████ 
--      █████████ ███████████████████ ███   ███████████
--     █████████  ███    █████████████ █████ ██████████████
--    █████████ ██████████ █████████ █████ █████ ████ █████
--  ███████████ ███    ███ █████████ █████ █████ ████ █████
-- ██████  █████████████████████ ████ █████ █████ ████ ██████
--
-- https://github.com/folke/snacks.nvim/blob/main/docs/bufdelete.md
