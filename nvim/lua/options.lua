vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.swapfile = false
vim.opt.clipboard:append("unnamedplus")
vim.opt.list = true
vim.opt.undodir = vim.fn.expand('~/.vim/undodir')
vim.opt.undofile = true
vim.opt.iskeyword:append("-")
vim.opt.listchars:append("tab:> ")

-- Old VIM Script Commands
vim.cmd([[
set spell
]])

