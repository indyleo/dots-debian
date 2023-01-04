-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- tabs & indentation
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- cursor line & cursor column
vim.opt.cursorline = true
-- vim.opt.cursorcolumn = true

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
vim.opt.list = true
vim.opt.listchars:append("tab:> ")
