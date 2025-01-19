local function augroup(name)
	return vim.api.nvim_create_augroup("atomic_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		vim.diagnostic.enable(false)
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
		-- 		vim.highlight.on_yank({ timeout = 200 })
	end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = augroup("checktime"),
	callback = function()
		if vim.o.buftype ~= "nofile" then
			vim.cmd("checktime")
		end
	end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = augroup("resize_splits"),
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("last_loc"),
	callback = function(event)
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
			return
		end
		vim.b[buf].lazyvim_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"notify",
		"qf",
		"query",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("man_unlisted"),
	pattern = { "man" },
	callback = function(event)
		vim.bo[event.buf].buflisted = false
	end,
})

-- vim.api.nvim_create_autocmd("FileType", {
-- 	group = augroup("wrap_spell"),
-- 	pattern = { "gitcommit", "markdown" },
-- 	callback = function()
-- 		vim.opt_local.wrap = true
-- 		vim.opt_local.spell = true
-- 	end,
-- })

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = augroup("json_conceal"),
	pattern = { "json", "jsonc", "json5" },
	callback = function()
		vim.opt_local.conceallevel = 0
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})

-- vim.cmd([[
--   augroup autochange_chdir
--     autocmd!
--     autocmd BufEnter * execute 'lcd ' .. fnamemodify(expand('%:p'), ':h')
--     autocmd BufWritePre * execute 'lcd ' .. fnamemodify(expand('%:p'), ':h')
--   augroup END
-- ]])

-- function change_directory_to_current_file()
-- 	vim.cmd("lcd " .. vim.fn.expand("%:p:h"))
-- end
-- vim.keymap.set("n", "", ":lua change_directory_to_current_file()<CR>", { silent = true, noremap = true })

-- vim.api.nvim_create_autocmd("TermOpen", {
-- 	desc = "Auto enter insert mode when opening a terminal",
-- 	group = augroup("term_enter_insert"),
-- 	pattern = "*",
-- 	callback = function()
-- 		-- Wait briefly just in case we immediately switch out of the buffer (e.g. Neotest)
-- 		vim.defer_fn(function()
-- 			if vim.api.nvim_buf_get_option(0, "buftype") == "terminal" then
-- 				vim.cmd([[startinsert]])
-- 			end
-- 		end, 100)
-- 	end,
-- })

-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
-- 	group = augroup("auto_create_dir"),
-- 	callback = function(event)
-- 		if event.match:match("^%w%w+:[\\/][\\/]") then
-- 			return
-- 		end
-- 		local file = vim.uv.fs_realpath(event.match) or event.match
-- 		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
-- 	end,
-- })
