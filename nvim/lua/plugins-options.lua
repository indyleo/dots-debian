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

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

