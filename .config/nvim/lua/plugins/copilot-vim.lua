return {
  {
    "github/copilot.vim",
    enabled = false,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    enabled = false,
    dependencies = {
      { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",                          -- Only on MacOS or Linux
    config = true
  },
}
