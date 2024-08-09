return {
	"nvim-neorg/neorg",
	lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	version = "*", -- Pin Neorg to the latest stable release
	enabled = false,
	config = function()
		require("neorg").setup({
			load = {
				-- ["core.keybinds"] = {
				-- 	config = {
				-- 		default_keybinds = false,
				-- 	},
				-- },
				["core.defaults"] = {},
				["core.concealer"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/vaults/nsal",
						},
						default_workspace = "notes",
					},
				},
			},
		})

		vim.wo.foldlevel = 99
		vim.wo.conceallevel = 2
	end,
}
