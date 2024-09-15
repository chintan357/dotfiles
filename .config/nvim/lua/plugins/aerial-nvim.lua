return {
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",
	keys = {
		{ "yoa", "<cmd>AerialToggle!<cr>", desc = "AerialToggle" },
	},
	config = function()
		local status_ok, aerial = pcall(require, "aerial")
		if not status_ok then
			return
		end

		aerial.setup({
			on_attach = function(bufnr)
				vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
				vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
			end,
			attach_mode = "global",
			close_on_select = true,
			layout = {
				min_width = 30,
				default_direction = "prefer_right",
			},
			-- Use nvim-navic icons
			icons = {
				File = "󰈙 ",
				Module = " ",
				Namespace = "󰌗 ",
				Package = " ",
				Class = "󰌗 ",
				Method = "󰆧 ",
				Property = " ",
				Field = " ",
				Constructor = " ",
				Enum = "󰕘",
				Interface = "󰕘",
				Function = "󰊕 ",
				Variable = "󰆧 ",
				Constant = "󰏿 ",
				String = "󰀬 ",
				Number = "󰎠 ",
				Boolean = "◩ ",
				Array = "󰅪 ",
				Object = "󰅩 ",
				Key = "󰌋 ",
				Null = "󰟢 ",
				EnumMember = " ",
				Struct = "󰌗 ",
				Event = " ",
				Operator = "󰆕 ",
				TypeParameter = "󰊄 ",
			},
		})

		local tele_status_ok, telescope = pcall(require, "telescope")
		if not tele_status_ok then
			return
		end

		vim.keymap.set("n", "<leader>ta", "<cmd>Telescope aerial<CR>", {
			desc = "Telescope Aerial",
		})

		telescope.load_extension("aerial")
	end,
}
