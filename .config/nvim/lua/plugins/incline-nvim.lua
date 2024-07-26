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
			window = {
				padding = 0,
				margin = { horizontal = 0, vertical = 0 },
			},
			render = function(props)
				local isFirst = true
				local res = {}
				if props.focused then
					for _, item in ipairs(navic.get_data(props.buf) or {}) do
						local entry = {}
						if not isFirst then
							table.insert(entry, { " > ", group = "NavicSeparator" })
						end
						table.insert(entry, { item.icon, group = "NavicIcons" .. item.type })
						table.insert(entry, { item.name, group = "NavicText" })
						table.insert(res, entry)
						isFirst = false
					end
					-- for _, item in ipairs(navic.get_data(props.buf) or {}) do
					-- 	table.insert(res, {
					-- 		{ " > ", group = "NavicSeparator" },
					-- 		{ item.icon, group = "NavicIcons" .. item.type },
					-- 		{ item.name, group = "NavicText" },
					-- 	})
					-- end
				end
				table.insert(res, " ")
				return res
			end,
		})
	end,
}
