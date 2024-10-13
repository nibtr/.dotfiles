vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>e", "<cmd>:25Lex<CR>") -- open explorer
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("x", "<leader>p", '"_dP')

-- next greatest remap ever
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("n", "<C-c>", "<Esc>")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("v", "<C-c>", "<Esc>")
vim.keymap.set("s", "<C-c>", "<Esc>")
vim.keymap.set("x", "<C-c>", "<Esc>")
vim.keymap.set("c", "<C-c>", "<Esc>")
vim.keymap.set("o", "<C-c>", "<Esc>")
vim.keymap.set("l", "<C-c>", "<Esc>")
vim.keymap.set("t", "<C-c>", "<Esc>")

-- neotree
vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle<CR>")

-- always center search results
vim.keymap.set("n", "n", "nzz", { silent = true })
vim.keymap.set("n", "N", "Nzz", { silent = true })
vim.keymap.set("n", "*", "*zz", { silent = true })
vim.keymap.set("n", "#", "#zz", { silent = true })
vim.keymap.set("n", "g*", "g*zz", { silent = true })

-- "very magic" (less escaping needed) regexes by default
vim.keymap.set("n", "?", "?\\v")
vim.keymap.set("n", "/", "/\\v")
vim.keymap.set("c", "%s/", "%sm/")

-- remap buffers
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>") -- next buffer
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>") -- previous buffer
vim.keymap.set("n", "<leader>d", "<cmd>bd!<CR>") -- delete buffer

-- resize buffer
vim.keymap.set("n", "<C-S-Left>", "<cmd>vertical resize +3<CR>")
vim.keymap.set("n", "<C-S-Right>", "<cmd>vertical resize -3<CR>")
--
-- Easily hit escape in terminal mode.
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set("n", "<leader>tm", function()
	vim.cmd.new()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 12)
	vim.wo.winfixheight = true
	vim.cmd.term()
end)
