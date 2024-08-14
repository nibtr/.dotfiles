return {
  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local conform = require 'conform'

      conform.setup {
        -- Disable formatting on save for certain filetypes
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        },
        -- Use a sub-list to run only the first available formatter, e.g.: python = { { "black" }, { "yapf" } }
        formatters_by_ft = {
          lua = { 'stylua' },
          python = { 'isort', 'black' },
          javascript = { 'prettier' },
          typescript = { 'prettier' },
          typescriptreact = { 'prettier' },
          javascriptreact = { 'prettier' },
          html = { 'prettier' },
          css = { 'prettier' },
          json = { 'prettier' },
          yaml = { 'prettier' },
          markdown = { 'prettier' },
        },
      }

      vim.keymap.set({ 'n', 'v' }, '<leader>cf', function()
        conform.format {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        }
      end, { desc = '[C]ode [F]ormat' })
    end,
  },
}
