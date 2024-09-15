return {
	"LunarVim/bigfile.nvim",
	event = "BufReadPre",
	opts = {
		filesize = 2, -- size of the file in MiB, the plugin round file sizes to the closest MiB
		pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
		features = { -- features to disable
			-- "illuminate",
			"indent_blankline",
			"lsp",
			"treesitter",
			"syntax",
			"matchparen",
			"vimopts",
			"filetype",
		},
	},
	config = function(_, opts)
		require("bigfile").setup(opts)
	end,
}
