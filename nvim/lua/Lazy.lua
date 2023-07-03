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
  {"lukas-reineke/indent-blankline.nvim"},
  {"nvim-orgmode/orgmode"},
  {"goolord/alpha-nvim"},
  {"akinsho/toggleterm.nvim"},
  {"nvim-lualine/lualine.nvim"},
  {"vimwiki/vimwiki"},
  {"folke/trouble.nvim", config = function() require("trouble").setup {} end},
  {"kovetskiy/sxhkd-vim"},
  {"lambdalisue/suda.vim"},

  -- Searching
  {"ggandor/leap.nvim", config = function() require('leap').add_default_mappings() end},
  {"tpope/vim-repeat"},

  -- Colors 
  {"shaunsingh/nord.nvim"},
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
  {"ThePrimeagen/harpoon"},
  {"nvim-telescope/telescope.nvim"},

  -- Cmp
  {"hrsh7th/nvim-cmp"}, -- The completion plugin
  {"hrsh7th/cmp-buffer"}, -- buffer completions
  {"hrsh7th/cmp-path"}, -- path completions
  {"hrsh7th/cmp-nvim-lsp"},
  {"hrsh7th/cmp-nvim-lua"},
  {"hrsh7th/cmp-cmdline"},

  -- Snippets
  {"L3MON4D3/LuaSnip"}, --snippet engine
  {"rafamadriz/friendly-snippets"}, -- a bunch of snippets to use
  {"saadparwaiz1/cmp_luasnip"}, -- snippet completions

  -- LSP
  {"williamboman/nvim-lsp-installer"},
  {"neovim/nvim-lspconfig"}, -- enable LSP
  {"williamboman/mason.nvim"}, -- simple to use language server installer
  {"williamboman/mason-lspconfig.nvim"},
  {"jose-elias-alvarez/null-ls.nvim"}, -- for formatters and linters
  {"RRethy/vim-illuminate"},

  -- Treesitter
  {"nvim-treesitter/nvim-treesitter"},
  {"windwp/nvim-autopairs"},

  -- DAP
  {"mfussenegger/nvim-dap"},
  {"rcarriga/nvim-dap-ui"},
  {"ravenxrz/DAPInstall.nvim"},

  -- Git
  {"lewis6991/gitsigns.nvim"},
  {"ahmedkhalf/project.nvim"},

  -- Markdown
  {"lukas-reineke/headlines.nvim"},
  {"ellisonleao/glow.nvim"},

  -- Comments
  {"numToStr/Comment.nvim"},
  {"folke/todo-comments.nvim", config = function() require("todo-comments").setup {} end},
})
