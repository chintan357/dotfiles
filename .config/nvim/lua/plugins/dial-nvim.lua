return {
	"monaqa/dial.nvim",
	-- lazy-load on keys
	-- mode is `n` by default. For more advanced options, check the section on key mappings
	keys = { "+", { "-", mode = "n" } },
	config = function(opts)
		vim.keymap.set("n", "+", function()
			require("dial.map").manipulate("increment", "normal")
		end)
		vim.keymap.set("n", "-", function()
			require("dial.map").manipulate("decrement", "normal")
		end)
		vim.keymap.set("n", "g+", function()
			require("dial.map").manipulate("increment", "gnormal")
		end)
		vim.keymap.set("n", "g-", function()
			require("dial.map").manipulate("decrement", "gnormal")
		end)
		vim.keymap.set("v", "+", function()
			require("dial.map").manipulate("increment", "visual")
		end)
		vim.keymap.set("v", "-", function()
			require("dial.map").manipulate("decrement", "visual")
		end)
		vim.keymap.set("v", "g+", function()
			require("dial.map").manipulate("increment", "gvisual")
		end)
		vim.keymap.set("v", "g-", function()
			require("dial.map").manipulate("decrement", "gvisual")
		end)
		-- See `:h dial.nvim`
		require("dial").setup(opts)
	end,
}
