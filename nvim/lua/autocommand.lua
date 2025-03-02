-- Automatically add the header on new file creation
vim.api.nvim_create_autocmd("BufNewFile", {
	group = vim.api.nvim_create_augroup("FileHeader", { clear = true }),
	pattern = "*",
	callback = function()
		-- Delay execution to ensure filetype is set
		vim.defer_fn(function()
			InsertFileHeader()
		end, 10) -- Delay of 10ms
	end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("Highlight-Yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Hides the "[Process exited 0]" call whenever you close a terminal
vim.api.nvim_create_autocmd("TermClose", {
	group = vim.api.nvim_create_augroup("SilentKill", { clear = true }),
	callback = function()
		vim.cmd("silent! bd!") -- Close the buffer silently
	end,
})

vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("TermSettings", { clear = true }),
	pattern = "*",
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
	end,
})
