return {
  {
    'stevearc/conform.nvim',
    cmd = { 'ConformInfo' },
    event = { 'BufWritePre' },
    keys = {
      {
        '<leader>cf',
        function()
          require('conform').format({ async = true, lsp_format = 'fallback' })
        end,
        mode = '',
        desc = '[C]ode [F]ormat buffer',
      },
    },
    opts = {
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style.
        local disable_filetypes = { c = true, cpp = true }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
          async = false,
        }
      end,

      -- You can use 'stop_after_first' to run the first available formatter from the list
      formatters_by_ft = {
        go = { "goimports", "gofmt" },
        rust = { "rustfmt", lsp_format = "fallback" },
        lua = { 'stylua' },
        python = { 'isort', 'black', stop_after_first = true },
        javascript = { 'prettierd' },
        typescript = { 'prettierd' },
        typescriptreact = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        html = { 'prettierd' },
        css = { 'prettierd' },
        json = { 'jq' },
        yaml = { 'prettierd' },
        markdown = { 'prettierd', lsp_format = "fallback" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        java = { "google-java-format" },
        ocaml = { "ocamlformat" },
        -- Use the "*" filetype to run formatters on all filetypes.
        ["*"] = { "codespell" },
        -- Use the "_" filetype to run formatters on filetypes that don't
        -- have other formatters configured.
        ["_"] = { "trim_whitespace" },
      },
    }
  }
}
