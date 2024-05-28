return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon.setup()
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end
		vim.keymap.set("n", "<eader>pt", function()
			toggle_telescope(require("harpoon"):list())
		end, { desc = "Open harpoon window" })
		--
		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end)
		vim.keymap.set("n", "<M-S-P>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<M-S-N>", function()
			harpoon:list():next()
		end)
		vim.keymap.set("n", "<leader>hp", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
	end,
	opts = {
		menu = {
			-- width = 120,
			width = vim.api.nvim_win_get_width(0) - 4,
		},
		settings = {
			save_on_toggle = false,
			sync_on_ui_close = true,
		},
	},
}
