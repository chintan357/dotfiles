return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	config = function()
		vim.g.mkdp_auto_close = 1
		vim.keymap.set("n", "<M-S-O>", "<Plug>MarkdownPreviewToggle")
	end,
}
