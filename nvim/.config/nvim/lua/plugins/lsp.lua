return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost' },
    cmd = { 'LspInfo', 'LspInstall', 'LspUninstall', 'Mason' },
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(e)
          local builtin = require 'telescope.builtin'
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = e.buf, desc = 'LSP: ' .. desc })
          end

          -- Keymaps
          map('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
          map('gr', builtin.lsp_references, '[G]oto [R]eferences')
          map('gI', builtin.lsp_implementations, '[G]oto [I]mplementation')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          map('<leader>D', builtin.lsp_type_definitions, 'Type [D]efinition')
          map('<leader>ds', builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
          map('<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          map('K', vim.lsp.buf.hover, 'Hover Documentation')

          local client = vim.lsp.get_client_by_id(e.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = e.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = e.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      local util = require 'lspconfig.util'
      -- setup lsp servers here
      local servers = {
        clangd = {
          cmd = { 'clangd' },
          filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
          root_dir = util.root_pattern('.clangd', '.clang-tidy', '.clang-format', 'compile_commands.json', 'compile_flags.txt', 'configure.ac', '.git'),
          single_file_support = true,
        },
        pyright = {
          cmd = { 'pyright-langserver', '--stdio' },
          filetypes = { 'python' },
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = 'openFilesOnly',
                useLibraryCodeForTypes = true,
              },
            },
          },
          single_file_support = true,
        },
        gopls = {
          cmd = { 'gopls' },
          filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
          single_file_support = true,
          root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
          settings = {
            gopls = {
              completeUnimported = true,
              analyses = {
                unusedparams = true,
              },
            },
          },
        },
        rust_analyzer = {
          cmd = { 'rust-analyzer' },
          filetypes = { 'rust' },
          root_dir = util.root_pattern('Cargo.toml', 'rust-project.json'),
          single_file_support = true,
          settings = {
            ['rust-analyzer'] = {
              cargo = {
                allFeatures = true,
              },
            },
          },
        },
        tsserver = {
          cmd = { 'typescript-language-server', '--stdio' },
          filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx' },
          init_options = {
            hostInfo = 'neovim',
          },
          root_dir = util.root_pattern('tsconfig.json', 'package.json', 'jsconfig.json', '.git'),
          single_file_support = true,
        },
        lua_ls = {
          -- cmd = {...},
          -- filetypes { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              diagnostics = {
                globals = { 'vim' },
                disable = { 'missing-fields' },
              },
            },
          },
        },
      }

      local ensure_installed = vim.tbl_keys(servers or {})

      require('mason').setup()
      require('mason-lspconfig').setup {
        ensure_installed = ensure_installed,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}

            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
