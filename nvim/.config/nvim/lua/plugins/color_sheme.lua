return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
      require('rose-pine').setup {
        variant = 'moon',
        styles = {
          italic = false,
          transparency = true,
        },
      }
      -- vim.cmd 'colorscheme rose-pine'
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require('tokyonight').setup {
        style = 'moon',
        transparent = true,
      }
      -- vim.cmd 'colorscheme tokyonight'
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme 'catppuccin'
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    name = 'gruvbox',
    priority = 1000,
    config = function()
      require('gruvbox').setup {
        --transparent_mode = true,
        contrast = 'hard',
        italic = {
          strings = false,
          emphasis = false,
          comments = false,
          operators = false,
          folds = false,
        },
      }
      vim.cmd 'colorscheme gruvbox'
    end,
  },
}
