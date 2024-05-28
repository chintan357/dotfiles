return {
	"b0o/incline.nvim",
	dependencies = {
		"SmiteshP/nvim-navic",
	},
	-- event = "",
	layz = false,
	priority = 1200,
	config = function()
		local navic = require("nvim-navic")
		local devicons = require("nvim-web-devicons")
		require("incline").setup({
			-- window = { margin = { vertical = 0, horizontal = 1 } },
			window = {
				padding = 0,
				margin = { horizontal = 0, vertical = 0 },
			},
			hide = {
				cursorline = true,
			},
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
				if vim.bo[props.buf].modified then
					filename = "[+] " .. filename
				end

				local icon, color = require("nvim-web-devicons").get_icon_color(filename)
				local res = {
					{ icon, guifg = color },
					{ " " },
					{ filename },
				}
				if props.focused then
					for _, item in ipairs(navic.get_data(props.buf) or {}) do
						table.insert(res, {
							{ " > ", group = "NavicSeparator" },
							{ item.icon, group = "NavicIcons" .. item.type },
							{ item.name, group = "NavicText" },
						})
					end
				end
				table.insert(res, " ")
				return res
			end,
		})
	end,
}
