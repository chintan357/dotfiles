return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {
		close_triple_quotes = true,
		check_ts = true,
		enable_moveright = true,
		fast_wrap = {
			map = "<c-e>",
		},
		ts_config = {
			lua = { "string" }, -- don't add pairs in lua string treesitter nodes
			javascript = { "template_string" }, -- don't add pairs in javascript template_string
		},
	},
}
