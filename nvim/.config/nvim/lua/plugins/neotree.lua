return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	opts = {
		filesystem = {
			filtered_items = {
				-- visible = true,
				hide_gitignored = false,
				hide_dotfiles = false,
				hide_by_name = {
					".git",
					".DS_Store",
					"thumbs.db",
					"node_modules",
				},
			},
			follow_current_file = {
				enabled = true,
				leave_dirs_open = true,
			},
			-- hijack_netrw_behavior = 'disabled',
		},
		buffers = {
			follow_current_file = {
				enabled = true,
				leave_dirs_open = false,
			},
		},
	},
}
