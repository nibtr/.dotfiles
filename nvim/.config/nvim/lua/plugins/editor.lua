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
        { "<leader>/", group = "Fuzzily search" },
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
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    -- opts = {}
  },
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
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      require('mini.comment').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- Configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  -- {
  --   'iamcco/markdown-preview.nvim',
  --   cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  --   ft = { 'markdown' },
  --   build = function()
  --     vim.fn['mkdp#util#install']()
  --   end,
  -- },
}
