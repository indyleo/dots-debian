-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- tabs & indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 4
vim.opt.listchars:append("tab:> ")
vim.opt.list = true
vim.opt.expandtab = true
vim.opt.autoindent = true

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- cursor line
vim.opt.cursorline = true

-- appearance
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

-- wrap text
vim.opt.wrap = false

-- swap file
vim.opt.swapfile = false

-- clipboard
vim.opt.clipboard:append("unnamedplus")

-- words
vim.opt.iskeyword:append("-")
