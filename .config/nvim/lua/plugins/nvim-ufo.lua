-- TODO: complete this

--- Show total number of lines in a fold
-- local folding_handler = function(virtual_text, left_number, end_line_number, width, truncate)
-- 	local new_virtual_text = {}
-- 	local suffix = (" 󰁂 %d "):format(end_line_number - left_number)
-- 	local suffix_width = vim.fn.strdisplaywidth(suffix)
-- 	local target_width = width - suffix_width
-- 	local current_width = 0
-- 	for _, chunk in ipairs(virtual_text) do
-- 		local chunk_text = chunk[1]
-- 		local chunk_width = vim.fn.strdisplaywidth(chunk_text)
-- 		if target_width > current_width + chunk_width then
-- 			table.insert(new_virtual_text, chunk)
-- 		else
-- 			chunk_text = truncate(chunk_text, target_width - current_width)
-- 			local hl_group = chunk[2]
-- 			table.insert(new_virtual_text, { chunk_text, hl_group })
-- 			chunk_width = vim.fn.strdisplaywidth(chunk_text)
-- 			-- str width returned from truncate() may less than 2nd argument, need padding
-- 			if current_width + chunk_width < target_width then
-- 				suffix = suffix .. (" "):rep(target_width - current_width - chunk_width)
-- 			end
-- 			break
-- 		end
-- 		current_width = current_width + chunk_width
-- 	end
-- 	table.insert(new_virtual_text, { suffix, "MoreMsg" })
-- 	return new_virtual_text
-- end
return {
	-- "kevinhwang91/nvim-ufo",
	-- config = function()
	-- 	require("ufo").setup({
	-- 		fold_virt_text_handler = folding_handler,
	-- 		provider_selector = function(bufnr, filetype, buftype)
	-- 			return { "treesitter", "indent" }
	-- 		end,
	-- 	})
	-- end,
}
