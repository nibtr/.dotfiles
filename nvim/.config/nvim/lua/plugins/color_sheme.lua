return {
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
		},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		opts = {
			variant = "moon",
			styles = {
				italic = false,
				transparency = true,
			},
		},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = false,
			style = "moon",
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {},
		config = function() end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		name = "gruvbox",
		priority = 1000,
		opts = {
			--transparent_mode = true,
			contrast = "hard",
			italic = {
				strings = false,
				emphasis = false,
				comments = false,
				operators = false,
				folds = false,
			},
		},
	},
	{
		"Mofiqul/adwaita.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"ayu-theme/ayu-vim",
		lazy = false,
		priority = 1000,
	},
	-- {
	-- 	"m6vrm/gruber.vim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- },
	{
		"behemothbucket/gruber-darker-theme.nvim",
		lazy = false,
		priority = 1000,
	},
}
