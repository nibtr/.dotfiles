-- Hightlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- jump to last edit position on opening file
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
			-- except for in git commit messages
			-- https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
			if not vim.fn.expand("%:p"):find(".git", 1, true) then
				vim.cmd('exe "normal! g\'\\""')
			end
		end
	end,
})

-- prevent accidental writes to buffers that shouldn't be edited
vim.api.nvim_create_autocmd("BufRead", { pattern = "*.orig", command = "set readonly" })
vim.api.nvim_create_autocmd("BufRead", { pattern = "*.pacnew", command = "set readonly" })

-- shorter columns in text because it reads better that way
local text = vim.api.nvim_create_augroup("text", { clear = true })
for _, pat in ipairs({ "text", "markdown", "mail", "gitcommit" }) do
	vim.api.nvim_create_autocmd("Filetype", {
		pattern = pat,
		group = text,
		command = "setlocal spell tw=72 colorcolumn=73",
	})
end
