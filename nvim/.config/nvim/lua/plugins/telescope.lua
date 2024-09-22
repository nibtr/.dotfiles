return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    -- { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- ignore binary files
    -- local previewers = require('telescope.previewers')
    -- local Job = require('plenary.job')
    -- local new_maker = function(filepath, bufnr, opts)
    --   filepath = vim.fn.expand(filepath)
    --   Job:new({
    --     command = 'file',
    --     args = { '--mime-type', '-b', filepath },
    --     on_exit = function(j)
    --       local mime_type = vim.split(j:result()[1], '/')[1]
    --       if mime_type == 'text' then
    --         previewers.buffer_previewer_maker(filepath, bufnr, opts)
    --       else
    --         -- maybe we want to write something to the buffer here
    --         vim.schedule(function()
    --           vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { 'BINARY' })
    --         end)
    --       end
    --     end,
    --   }):sync()
    -- end

    require('telescope').setup({
      --  More info -> :help telescope.setup()`
      defaults = {
        -- buffer_previewer_maker = new_maker,
        file_ignore_patterns = {
          'node_modules',
          'yarn.lock',
          '.git',
          '.sl',
          '_build',
          '.next',
        },
      },
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
        buffers = {
          show_all_buffers = true,
          sort_mru = true,
          mappings = {
            i = {
              ['<c-d>'] = 'delete_buffer',
            },
          },
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    })

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require('telescope.builtin')
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { desc = desc })
    end

    map('<leader>fc', builtin.commands, '[F]ind [C]ommands')
    map('<leader>fh', builtin.help_tags, '[F]ind [H]elp')
    map('<leader>fk', builtin.keymaps, '[F]ind [K]eymaps')
    map('<leader>ff', builtin.find_files, '[F]ind [F]iles')
    map('<leader>fs', builtin.lsp_document_symbols, '[F]ind [S]ymbol')
    map('<leader>fw', builtin.grep_string, '[F]ind current [W]ord')
    map('<leader>fg', builtin.live_grep, '[F]ind by [G]rep')
    map('<leader>fd', builtin.diagnostics, '[F]ind [D]iagnostics')
    map('<leader>fr', builtin.resume, '[F]ind [R]esume')
    map('<leader>f.', builtin.oldfiles, '[F]ind Recent Files ("." for repeat)')
    map('<leader>fb', builtin.buffers, '[F]ind existing buffers')
    map('<leader>fB', builtin.builtin, '[F]ind [B]uiltin')
    map('<leader>th', builtin.colorscheme, '[TH]eme Switcher')

    map('<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 0, -- transparency (0-100)
        previewer = false,
      })
    end, '[/] Fuzzily search in current buffer')

    map('<leader>f/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, '[F]ind [/] in Open Files')

    -- Shortcut for searching your Neovim configuration files
    map('<leader>fn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, '[F]ind [N]eovim files')
  end,
}
