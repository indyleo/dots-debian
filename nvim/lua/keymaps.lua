-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { noremap = true, silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Better paste
keymap("v", "p", "P", opts)

-- Function to toggle spell checker
function ToggleSpellCheckOff()
  vim.opt.spell = false
  print("Spell checker turned off")
end

function ToggleSpellCheckOn()
  vim.opt.spell = true
  print("Spell checker turned on")
end

-- Source Function
function SourceConf()
  vim.cmd(":source ~/.config/nvim/init.lua")
  print("Reloaded Conf")
end

-- Turn off and on spellcheck
keymap("n", "<leader>cf", "<cmd>lua ToggleSpellCheckOff()<CR>", opts)
keymap("n", "<leader>cn", "<cmd>lua ToggleSpellCheckOn()<CR>", opts)

-- source the main conf file
keymap("n", "<leader>so", "<cmd>lua SourceConf()<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<esc>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --
keymap("n", "<C-a>", "<cmd>Alpha<CR>", opts)
keymap("n", "<C-q>", "<cmd>ToggleTerm<CR>", opts)
keymap("n", "<leader>bn", "<cmd>BuffergineCycleNext<CR>", opts)
keymap("n", "<leader>bp", "<cmd>BuffergineCyclePrev<CR>", opts)
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

-- Harpoon
function FileMark()
  require("harpoon.mark").add_file()
end

function FileUi()
  require("harpoon.ui").toggle_quick_menu()
end

function File1()
  require("harpoon.ui").nav_file(1)
end

function File2()
  require("harpoon.ui").nav_file(2)
end

function File3()
  require("harpoon.ui").nav_file(3)
end

function File4()
  require("harpoon.ui").nav_file(4)
end

keymap("n", "<leader>a", "<cmd>lua FileMark()<CR>", opts)
keymap("n", "<C-e>",  "<cmd>lua FileUi()<CR>", opts)
keymap("n", "<C-h>", "<cmd>lua File1()<CR>", opts)
keymap("n", "<C-t>", "<cmd>lua File2()<CR>", opts)
keymap("n", "<C-n>", "<cmd>lua File3()<CR>", opts)
keymap("n", "<C-s>", "<cmd>lua File4()<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", "<cmd>Telescope projects<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope git_files<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- LSP
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<CR>", opts)
keymap("n", "<leader>li", "<cmd>LspInfo<CR>", opts)
keymap("n", "<leader>lI", "<cmd>LspInstallInfo<CR>", opts)
keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", opts)
keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>", opts)
keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()CR>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<CR>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()CR>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<CR>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<CR>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<CR>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()CR>", opts)
