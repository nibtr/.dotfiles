-- Hightlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim.api.nvim_create_autocmd("BufEnter", {
--   desc = 'Change color based on file type',
--   group = vim.api.nvim_create_augroup('change-color-filetype', { clear = true }),
--   callback = function()
--     if vim.bo.filetype == "javascript" or vim.bo.filetype == "ts" then
--       vim.cmd.colorscheme("gruvbox")
--     else
--       vim.cmd.colorscheme("gruber")
--     end
--   end
-- })
