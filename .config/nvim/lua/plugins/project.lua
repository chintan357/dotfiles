return {
	{
		"ahmedkhalf/project.nvim",
		event = "VeryLazy",
		opts = {
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
		},
		config = function(_, opts)
			require("project_nvim").setup(opts)

			local tele_status_ok, telescope = pcall(require, "telescope")
			if not tele_status_ok then
				return
			end

			telescope.load_extension("projects")

			vim.keymap.set("n", "<leader>sp", "<cmd>Telescope projects<CR>", {
				noremap = true,
				silent = true,
				desc = "Switch to project",
			})
		end,
	},
}
