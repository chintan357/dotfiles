return {
  "jackMort/ChatGPT.nvim",
  keys = {
    { "<leader>aa", ":ChatGPTActAs<CR>" },
    { ",c",         "<cmd>ChatGPT<cr>" }
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    chat = {
      welcome_message = "",
      loading_text = "Loading ...",
      question_sign = "Q:",
      answer_sign = "A:",
    },
    openai_params = {
      model = "gpt-4o",
      frequency_penalty = 0,
      presence_penalty = 0,
      max_tokens = 4096,
      temperature = 0,
      top_p = 1,
      n = 1,
    },
    -- gpt-4-1106-preview
    openai_edit_params = {
      model = "gpt-4o",
      frequency_penalty = 0,
      max_tokens = 4096,
      presence_penalty = 0,
      temperature = 0,
      top_p = 1,
      n = 1,
    },
  },
}
