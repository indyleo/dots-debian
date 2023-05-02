-- Colorscheme
vim.cmd.colorscheme('nord')

-- Nordic Theme Setup
vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_disable_background = true
vim.g.nord_italic = true
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = false

-- Load the colorscheme
require('nord').set()
