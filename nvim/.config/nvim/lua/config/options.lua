-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Nerdfont
vim.g.have_nerd_font = true

-- Set tabs to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Indentation
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.breakindent = true

-- Relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Column line
vim.opt.colorcolumn = "120"

-- Better split
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Case insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 50

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitution live as you type
vim.opt.inccommand = "split"

-- Enalbe cursorline
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Enable 24-bit color
vim.opt.termguicolors = true

-- Enable the sign column to prevent the screen from jumping
vim.opt.signcolumn = "yes"

vim.opt.showmode = false

-- Sync system clipboard
-- vim.opt.clipboard = 'unnamedplus'

-- Save undo history
vim.opt.undofile = true

-- vim.opt.hlsearch = true

-- When opening a file with a command (like :e),
-- don't suggest files like these:
vim.opt.wildignore = ".hg,.svn,*~,*.png,*.jpg,*.gif,*.min.js,*.swp,*.o,vendor,dist,_site"

-- Never ever make my terminal beep
vim.opt.vb = true

-- In completion, when there is more than one match,
-- list all matches, and only complete to longest common match
vim.opt.wildmode = "list:longest"

-- more useful diffs (nvim -d)
--- by ignoring whitespace
vim.opt.diffopt:append("iwhite")
--- and using a smarter algorithm
--- https://vimways.org/2018/the-power-of-diff/
--- https://stackoverflow.com/questions/32365271/whats-the-difference-between-git-diff-patience-and-git-diff-histogram
--- https://luppeng.wordpress.com/2020/10/10/when-to-use-each-of-the-git-diff-algorithms/
vim.opt.diffopt:append("algorithm:histogram")
vim.opt.diffopt:append("indent-heuristic")
