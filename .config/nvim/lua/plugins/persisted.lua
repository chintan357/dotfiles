-- TODO: which one to use?
return {
	{

		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = { options = vim.opt.sessionoptions:get() },
    -- stylua: ignore
    keys = {
      { "<leader>rs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>rS", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      -- { "", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
	},
	{
		"olimorris/persisted.nvim",
		lazy = false,
		opts = {
			save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/persisted-session/"), -- Resolves to ~/.local/share/nvim/persisted-sessions/
			-- use_git_branch = true,
			-- silent = true,
			should_autosave = function()
				-- Ignore certain filetypes from autosaving
				local excluded_filetypes = {
					"dashboard",
					"oil",
					"lazy",
					"toggleterm",
					"",
				}

				for _, filetype in ipairs(excluded_filetypes) do
					if vim.bo.filetype == filetype then
						return false
					end
				end

				return true
			end,
		},
		config = function(_, options)
			require("persisted").setup(options)

			local ok, telescope = pcall(require, "telescope")
			if not ok then
				return
			end
			telescope.load_extension("persisted")
		end,
	},
}
