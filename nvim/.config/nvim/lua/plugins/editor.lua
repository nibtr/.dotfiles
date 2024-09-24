return {
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	-- 'gc' to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },

	-- highlight todos, notes, etc in comments
	-- { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

	-- which-key helps to remember keybindings
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300

			require("which-key").add({
				{ "<leader>c", group = "[C]ode" },
				{ "<leader>c_", hidden = true },
				{ "<leader>d", group = "[D]ocument" },
				{ "<leader>d_", hidden = true },
				{ "<leader>f", group = "[F]ind" },
				{ "<leader>f_", hidden = true },
				{ "<leader>r", group = "[R]ename" },
				{ "<leader>r_", hidden = true },
				{ "<leader>w", group = "[W]orkspace" },
				{ "<leader>w_", hidden = true },
			})
		end,
	},

	-- navigate between tmux and vim
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equalent to setup({}) function
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("nvim-treesitter.configs").setup({
				autotag = {
					enable = true,
				},
			})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- nvim status line
	-- {
	-- 	"nvim-lualine/lualine.nvim",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	opts = {
	-- 		theme = "auto",
	-- 	},
	-- },

	-- harpoon
	-- {
	-- 	"ThePrimeagen/harpoon",
	-- 	branch = "harpoon2",
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- 	config = function()
	-- 		local harpoon = require("harpoon")
	-- 		harpoon.setup({})
	-- 		vim.keymap.set("n", "<leader>a", function()
	-- 			harpoon:list():add()
	-- 		end)
	-- 		vim.keymap.set("n", "<C-e>", function()
	-- 			harpoon.ui:toggle_quick_menu(harpoon:list())
	-- 		end)
	--
	-- 		vim.keymap.set("n", "<C-1>", function()
	-- 			harpoon:list():select(1)
	-- 		end)
	-- 		vim.keymap.set("n", "<C-2>", function()
	-- 			harpoon:list():select(2)
	-- 		end)
	-- 		vim.keymap.set("n", "<C-3>", function()
	-- 			harpoon:list():select(3)
	-- 		end)
	-- 		vim.keymap.set("n", "<C-4>", function()
	-- 			harpoon:list():select(4)
	-- 		end)
	--
	-- 		-- Toggle previous & next buffers stored within Harpoon list
	-- 		vim.keymap.set("n", "<leader>hp", function()
	-- 			harpoon:list():prev()
	-- 		end)
	-- 		vim.keymap.set("n", "<leader>hn", function()
	-- 			harpoon:list():next()
	-- 		end)
	-- 	end,
	-- },
}
