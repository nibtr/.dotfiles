return {
  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    opts = {
      enable_autocmd = false
    }
  },

  -- 'gc' to comment visual regions/lines
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring"
    },
    opts = function()
      return {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end
  },

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
        { "<leader>c",  group = "[C]ode" },
        { "<leader>c_", hidden = true },
        -- { "<leader>d", group = "[D]ocument" },
        -- { "<leader>d_", hidden = true },
        { "<leader>f",  group = "[F]ind" },
        { "<leader>f_", hidden = true },
        { "<leader>r",  group = "[R]ename" },
        { "<leader>r_", hidden = true },
        { "<leader>w",  group = "[W]orkspace" },
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
      ---@diagnostic disable-next-line: missing-fields
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
  -- { 'akinsho/bufferline.nvim', version = "4.9.x", dependencies = 'nvim-tree/nvim-web-devicons' }


  -- nvim status line
  -- {
  -- 	"nvim-lualine/lualine.nvim",
  -- 	dependencies = { "nvim-tree/nvim-web-devicons" },
  -- 	opts = {
  -- 		theme = "auto",
  -- 	},
  -- },
  -- ,
}
