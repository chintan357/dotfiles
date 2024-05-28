return {
	"ggandor/leap.nvim",
	config = function()
		local leap = require("leap")
		-- leap.add_default_mappings()
		-- leap.opts.case_sensitive = true
		vim.keymap.set("n", "s", "<Plug>(leap)")
		-- vim.keymap.set("n", "S", "<Plug>(leap-from-window)")
		vim.keymap.set({ "x", "o" }, "s", "<Plug>(leap-forward)")
		-- vim.keymap.set({ "x", "o" }, "S", "<Plug>(leap-backward)")
	end,
}
