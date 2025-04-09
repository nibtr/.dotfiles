-- clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- reload config
vim.keymap.set('n', '<leader><S-r>', '<cmd>:source ~/.config/nvim/init.lua<CR>')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")        -- move line up
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")        -- move line down
vim.keymap.set('n', '<C-d>', '<C-d>zz')             -- cursor always middle when scroll down
vim.keymap.set('n', '<C-u>', '<C-u>zz')             -- cursor always middle when scroll up
-- vim.keymap.set('n', '<leader>e', vim.cmd.Ex)
vim.keymap.set('n', '<leader>e', '<cmd>:25Lex<CR>') -- open explorer
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- greatest remap ever
vim.keymap.set('x', '<leader>p', '"_dP')
vim.keymap.set('x', '<leader>p', '"_dP')

-- next greatest remap ever
-- copy to system clipboard
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

-- map Ctrl-C to Esc
vim.keymap.set('n', '<C-c>', '<Esc>')
vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set('v', '<C-c>', '<Esc>')
vim.keymap.set('s', '<C-c>', '<Esc>')
vim.keymap.set('x', '<C-c>', '<Esc>')
vim.keymap.set('c', '<C-c>', '<Esc>')
vim.keymap.set('o', '<C-c>', '<Esc>')
vim.keymap.set('l', '<C-c>', '<Esc>')
vim.keymap.set('t', '<C-c>', '<Esc>')

vim.keymap.set('n', 'Q', '<nop>')

-- neotree
vim.keymap.set('n', '<C-n>', '<cmd>Neotree toggle<CR>')

-- make missing : less annoying
vim.keymap.set('n', ';', ':')

-- always center search results
vim.keymap.set('n', 'n', 'nzz', { silent = true })
vim.keymap.set('n', 'N', 'Nzz', { silent = true })
vim.keymap.set('n', '*', '*zz', { silent = true })
vim.keymap.set('n', '#', '#zz', { silent = true })
vim.keymap.set('n', 'g*', 'g*zz', { silent = true })

-- "very magic" (less escaping needed) regexes by default
vim.keymap.set('n', '?', '?\\v')
vim.keymap.set('n', '/', '/\\v')
vim.keymap.set('c', '%s/', '%sm/')

-- remap buffers
vim.keymap.set('n', '<Tab>', '<cmd>bnext<CR>')       -- next buffer
vim.keymap.set('n', '<S-Tab>', '<cmd>bprevious<CR>') -- previous buffer
vim.keymap.set('n', '<leader>d', '<cmd>bd!<CR>')     -- delete buffer

-- resize buffer
vim.keymap.set('n', '<C-S-Left>', '<cmd>vertical resize +3<CR>')
vim.keymap.set('n', '<C-S-Right>', '<cmd>vertical resize -3<CR>')

-- execution
vim.keymap.set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })
