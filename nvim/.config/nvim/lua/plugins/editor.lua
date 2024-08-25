return {
  'tpope/vim-sleuth',
  { 'numToStr/Comment.nvim', opts = {} },
  -- which-key helps to remember keybindings
  -- {
  --   'folke/which-key.nvim',
  --   event = 'VeryLazy',
  --   init = function()
  --     vim.o.timeout = true
  --     vim.o.timeoutlen = 300
  --
  --     require('which-key').add({
  --       { "<leader>c",  group = "[C]ode" },
  --       { "<leader>c_", hidden = true },
  --       { "<leader>d",  group = "[D]ocument" },
  --       { "<leader>d_", hidden = true },
  --       { "<leader>f",  group = "[F]ind" },
  --       { "<leader>f_", hidden = true },
  --       { "<leader>r",  group = "[R]ename" },
  --       { "<leader>r_", hidden = true },
  --       { "<leader>w",  group = "[W]orkspace" },
  --       { "<leader>w_", hidden = true },
  --     })
  --   end,
  -- },
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    config = function()
      require('nvim-treesitter.configs').setup {
        autotag = {
          enable = true,
        },
      }
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
}
