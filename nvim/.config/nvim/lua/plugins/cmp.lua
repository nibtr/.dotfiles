return {
  {
    'hrsh7th/nvim-cmp',
    -- event = { 'BufReadPost, BufNewFile' },
    event = 'InsertEnter',
    dependencies = {
      {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
      },
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      luasnip.config.setup {}
      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-u>'] = cmp.mapping.scroll_docs(4),  -- scroll up preview
          ['<C-d>'] = cmp.mapping.scroll_docs(-4), -- scroll down preview
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm { select = true },
          ['<C-.>'] = cmp.mapping.complete {},
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),
          ['<C-c>'] = cmp.mapping.abort(),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'path' },
          { name = 'luasnip' },
        },
      }
    end,
  },
}
