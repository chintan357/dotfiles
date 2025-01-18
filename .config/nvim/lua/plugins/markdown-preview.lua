return {
	"iamcco/markdown-preview.nvim",
	keys = {
		{ "yom", "<cmd>MarkdownPreviewToggle<cr>" },
	},
	build = "cd app && npm install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	config = function()
		vim.g.mkdp_auto_close = 1
	end,
}
