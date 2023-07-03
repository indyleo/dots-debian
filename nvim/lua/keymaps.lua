-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

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

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<esc>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --
keymap("n", "<C-a>", "<cmd>Alpha<CR>", opts)
keymap("n", "<C-x>", "<cmd>ToggleTerm<CR>", opts)
keymap("n", "<leader>bn", "<cmd>BuffergineCycleNext<CR>", opts)
keymap("n", "<leader>bp", "<cmd>BuffergineCyclePrev<CR>", opts)
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", "<cmd>Telescope projects<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

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

