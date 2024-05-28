local exclude_filetypes = {
	"help",
	"dashboard",
	"neotree",
	"Trouble",
	"trouble",
	"lazy",
	"mason",
	"notify",
	"toggleterm",
}
return {
	{
		"echasnovski/mini.indentscope",
		version = "*",
		event = "VeryLazy",
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = exclude_filetypes,
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
		mapping = {
			object_scope = "ii",
			object_scope_with_border = "ai",
			goto_top = "[i",
			goto_bottom = "]i",
		},
		opts = {
			symbol = "▏",
			-- symbol = "│",
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		main = "ibl",
		opts = {
			enabled = true,
			indent = {
				char = "|",
			},
			exclude = {
				filetypes = exclude_filetypes,
			},
		},
	},
}
