local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Map Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Lazy
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

lazy.setup({
  --  My plugins here
  {"folke/which-key.nvim"},
  {"nvim-lua/plenary.nvim"},
  {"lukas-reineke/indent-blankline.nvim"}, -- smarter indent
  {"nvim-orgmode/orgmode"},
  {"goolord/alpha-nvim"},
  {"numToStr/Comment.nvim"},
  {"akinsho/toggleterm.nvim"},
  {"nvim-lualine/lualine.nvim"},

  -- Searching
  {"ggandor/leap.nvim", config = function() require('leap').add_default_mappings() end},
  {"tpope/vim-repeat"},
 
  -- Markdown Viewer
  {"ellisonleao/glow.nvim", config = true, cmd = "Glow"},

  -- Colorschemes
  {"shaunsingh/nord.nvim"},
  {"folke/tokyonight.nvim"},
  {"lunarvim/darkplus.nvim"},

  -- Nice Colors
  {"ap/vim-css-color"},
  {"frazrepo/vim-rainbow"},

  -- Essential plugins
  {"tpope/vim-surround"}, -- add, delete, change surroundings (it's awesome)
  {"inkarkat/vim-ReplaceWithRegister"}, -- replace with register contents usi>
  
  -- File Explorer Stuff
  {"kyazdani42/nvim-web-devicons"},
  {"kyazdani42/nvim-tree.lua"},
  {"akinsho/bufferline.nvim"},
  {"famiu/bufdelete.nvim"},
  {"moll/vim-bbye"},

  -- Cmp
  {"hrsh7th/nvim-cmp"}, -- The completion plugin
  {"hrsh7th/cmp-buffer"}, -- buffer completions
  {"hrsh7th/cmp-path"}, -- path completions
  {"saadparwaiz1/cmp_luasnip"}, -- snippet completions
  {"hrsh7th/cmp-nvim-lsp"},
  {"hrsh7th/cmp-nvim-lua"},

  -- Snippets
  {"L3MON4D3/LuaSnip"}, --snippet engine
  {"rafamadriz/friendly-snippets"}, -- a bunch of snippets to use

  -- LSP
  {"williamboman/nvim-lsp-installer"},
  {"neovim/nvim-lspconfig"}, -- enable LSP
  {"williamboman/mason.nvim"}, -- simple to use language server installer
  {"williamboman/mason-lspconfig.nvim"},
  {"VonHeikemen/lsp-zero.nvim"},
  {"jose-elias-alvarez/null-ls.nvim"}, -- for formatters and linters
  {"RRethy/vim-illuminate"},

  -- Telescope
  {"nvim-telescope/telescope.nvim"},

  -- Harpoon
  {"ThePrimeagen/harpoon"},

  -- Treesitter
  {"nvim-treesitter/nvim-treesitter"},
  {"windwp/nvim-autopairs"},

  -- DAP
  {"mfussenegger/nvim-dap"},
  {"rcarriga/nvim-dap-ui"},
  {"ravenxrz/DAPInstall.nvim"},

  -- Git
  {"lewis6991/gitsigns.nvim"},
  {"kdheepak/lazygit.nvim"},

  -- Trouble
  {"folke/trouble.nvim", config = function() require("trouble").setup {} end},

  -- TODO
  {"folke/todo-comments.nvim", config = function()require("todo-comments").setup {} end},
})
