return {
  -- {
  --   'rose-pine/neovim',
  --   name = 'rose-pine',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     variant = 'moon',
  --     styles = {
  --       italic = false,
  --       transparency = true,
  --     },
  --   },
  -- },
  -- {
  --   'folke/tokyonight.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     style = 'moon',
  --   },
  -- },
  -- {
  --   'catppuccin/nvim',
  --   name = 'catppuccin',
  --   priority = 1000,
  --   opts = {},
  -- },
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    name = 'gruvbox',
    priority = 1000,
    opts = {
      -- transparent_mode = true,
      contrast = 'hard',
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
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },
}
