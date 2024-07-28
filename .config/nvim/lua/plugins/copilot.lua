return {
	"github/copilot.vim",
	config = function()
		-- vim.g.copilot_no_tab_map = true
		vim.g.copilot_filetypes = { ["TelescopePrompt"] = false }
		-- Set to true to assume that copilot is already mapped
		-- vim.g.copilot_assume_mapped = true
		-- Set workspace folders
		-- vim.g.copilot_workspace_folders = "~/Projects"

		local keymap = vim.keymap.set
		local opts = { silent = true }

		keymap("i", "<C-i>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})

		keymap("i", "<C-o>", "<Plug>(copilot-accept-line)", opts)
		-- keymap("i", "<C-S-p>", "<Plug>(copilot-previous)", opts)
		-- keymap("i", "<C-S-n>", "<Plug>(copilot-next)", opts)
		-- keymap("i", "<C-k>", "<Plug>(copilot-suggest)", opts)
	end,
}
-- {
--   "zbirenbaum/copilot.lua", -- AI programming
--   event = "InsertEnter",
--   init = function()
--     require("legendary").commands({
--       itemgroup = "Copilot",
--       commands = {
--         {
--           ":CopilotToggle",
--           function()
--             require("copilot.suggestion").toggle_auto_trigger()
--           end,
--           description = "Toggle on/off for buffer",
--         },
--       },
--     })
--       keys = {
--         {
--           "<C-a>",
--           function()
--             require("copilot.suggestion").accept()
--           end,
--           description = "Accept suggestion",
--           mode = { "i" },
--         },
--         {
--           "<C-x>",
--           function()
--             require("copilot.suggestion").dismiss()
--           end,
--           description = "Dismiss suggestion",
--           mode = { "i" },
--         },
--         {
--           "<C-\\>",
--           function()
--             require("copilot.panel").open()
--           end,
--           description = "Show Copilot panel",
--           mode = { "n", "i" },
--         },
--       },
--   end,
--   opts = {
--     panel = {
--       auto_refresh = true,
--     },
--     suggestion = {
--       auto_trigger = true, -- Suggest as we start typing
--       keymap = {
--         accept_word = "<C-l>",
--         accept_line = "<C-j>",
--       },
--     },
--   },
-- },
