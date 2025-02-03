return {
	"nvim-neorg/neorg",
	lazy = false,
	version = "*",
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
