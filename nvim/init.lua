-- Require
require('keymaps')
require('plugins')
require('impatient')
-- ========================================================================== --
-- ==                           EDITOR SETTINGS                            == --
-- ========================================================================== --
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
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

-- ========================================================================== --
-- ==                         PLUGIN CONFIGURATION                         == --
-- ========================================================================== --

-- Colorscheme
vim.cmd('colorscheme nord')

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'nord',
	},
}
-- End of colorscheme

-- File Explorer nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

-- Add Ctrl + X and initialize toggle term 
require("toggleterm").setup {
	open_mapping = [[<c-x>]],
	shade_terminals = false
}

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

