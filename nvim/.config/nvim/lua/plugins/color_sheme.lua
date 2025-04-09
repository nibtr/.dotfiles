return {
	-- {
	-- 	"scottmckendry/cyberdream.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		transparent = true,
	-- 	},
	-- },
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		variant = "moon",
	-- 		styles = {
	-- 			italic = false,
	-- 			transparency = true,
	-- 		},
	-- 	},
	-- },
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		transparent = false,
	-- 		style = "moon",
	-- 	},
	-- },
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
	-- {
	-- 	"Mofiqul/adwaita.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- },
	-- {
	-- 	"ayu-theme/ayu-vim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- },
	-- {
	-- 	"behemothbucket/gruber-darker-theme.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- },
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			compile = true,
			commentStyle = { italic = false },
			keywordStyle = { italic = false },
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none",
						},
					},
				},
			},
			overrides = function(colors)
				local theme = colors.theme
				local palette = colors.palette
				local makeDiagnosticColor = function(color)
					local c = require("kanagawa.lib.color")
					return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
				end

				return {
					-- diagnostic background
					DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
					DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
					DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
					DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),

					-- popup menu
					Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
					PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
					PmenuSbar = { bg = theme.ui.bg_m1 },
					PmenuThumb = { bg = theme.ui.bg_p2 },

					-- NormalFloat = { fg = theme.ui.float.fg, bg = theme.ui.float.bg },
					-- ColorColumn = { bg = theme.ui.float.bg },
				}
			end,
		},
	},
}
