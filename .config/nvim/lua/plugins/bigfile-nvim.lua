return {
	"LunarVim/bigfile.nvim",
	event = "BufReadPre",
	enabled = false,
	opts = {
		filesize = 2,
		pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
		features = {
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
