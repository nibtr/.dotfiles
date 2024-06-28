return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
        hijack_netrw_behavior = 'disabled',
      },
      buffers = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
      },
    }

    vim.keymap.set('n', '<C-n>', '<cmd>Neotree toggle<CR>')
  end,
}
