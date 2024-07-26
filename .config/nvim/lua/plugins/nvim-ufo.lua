return {
	"kevinhwang91/nvim-ufo",
	event = "VeryLazy",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	config = function()
		local folding_handler = function(virtual_text, left_number, end_line_number, width, truncate)
			local new_virtual_text = {}
			local suffix = (" 󰁂 %d "):format(end_line_number - left_number)
			local suffix_width = vim.fn.strdisplaywidth(suffix)
			local target_width = width - suffix_width
			local current_width = 0
			for _, chunk in ipairs(virtual_text) do
				local chunk_text = chunk[1]
				local chunk_width = vim.fn.strdisplaywidth(chunk_text)
				if target_width > current_width + chunk_width then
					table.insert(new_virtual_text, chunk)
				else
					chunk_text = truncate(chunk_text, target_width - current_width)
					local hl_group = chunk[2]
					table.insert(new_virtual_text, { chunk_text, hl_group })
					chunk_width = vim.fn.strdisplaywidth(chunk_text)
					-- str width returned from truncate() may less than 2nd argument, need padding
					if current_width + chunk_width < target_width then
						suffix = suffix .. (" "):rep(target_width - current_width - chunk_width)
					end
					break
				end
				current_width = current_width + chunk_width
			end
			table.insert(new_virtual_text, { suffix, "MoreMsg" })
			return new_virtual_text
		end

		-- vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		-- vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
		-- vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
		-- vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
		-- vim.keymap.set("n", "K", function()
		-- 	local winid = require("ufo").peekFoldedLinesUnderCursor()
		-- 	if not winid then
		-- 		-- choose one of coc.nvim and nvim lsp
		-- 		vim.fn.CocActionAsync("definitionHover") -- coc.nvim
		-- 		vim.lsp.buf.hover()
		-- 	end
		-- end)

		require("ufo").setup({
			-- fold_virt_text_handler = folding_handler,
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
			open_fold_hl_timeout = 150,
			-- close_fold_kinds_for_ft = {
			-- 	default = { "imports", "comment" },
			-- 	json = { "array" },
			-- 	c = { "comment", "region" },
			-- },
			-- preview = {
			-- 	win_config = {
			-- 		border = { "", "─", "", "", "", "─", "", "" },
			-- 		winhighlight = "Normal:Folded",
			-- 		winblend = 0,
			-- 	},
			-- 	mappings = {
			-- 		scrollU = "<C-u>",
			-- 		scrollD = "<C-d>",
			-- 		jumpTop = "[",
			-- 		jumpBot = "]",
			-- 	},
			-- },
		})
	end,
}
