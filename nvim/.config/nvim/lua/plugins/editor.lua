return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- 'gc' to comment visual regions/lines
  -- { 'numToStr/Comment.nvim', opts = {} },

  -- highlight todos, notes, etc in comments
  -- { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- which-key helps to remember keybindings
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300

      require('which-key').add({
        { "<leader>c", group = "[C]ode",                 mode = { "n", "x" } },
        { "<leader>d", group = "[D]ocument" },
        { "<leader>f", group = "[F]ind" },
        { "<leader>r", group = "[R]ename" },
        { "<leader>w", group = "[W]orkspace" },
        { "<leader>h", group = "Git [Hunk]",             mode = { "n", "v" } },
        { "<leader>/", group = "Fuzzy search" },
        { "<leader>e", group = "[E]xplorer (netrw)" },
        { "<leader>d", group = "[D]elete current buffer" },
      })
    end,
  },

  -- navigate between tmux and vim
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
  },

  -- autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    -- opts = {}
  },

  -- autotags
  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    config = function()
      require('nvim-treesitter.configs').setup({
        autotag = {
          enable = true,
        },
      })
    end,
  },

  -- markdown preview
  -- {
  --   'iamcco/markdown-preview.nvim',
  --   cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  --   ft = { 'markdown' },
  --   build = function()
  --     vim.fn['mkdp#util#install']()
  --   end,
  -- },
}
