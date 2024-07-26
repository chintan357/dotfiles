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
