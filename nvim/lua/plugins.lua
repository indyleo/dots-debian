-- automatically install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  --  My plugins here
use { "wbthomason/packer.nvim"} -- have packer manage itself
use { "nvim-lua/plenary.nvim"} -- useful lua functions used by lots of plugins
use { "folke/which-key.nvim"}
use { "JoosepAlviste/nvim-ts-context-commentstring"}
use { "ahmedkhalf/project.nvim"}
use { "lewis6991/impatient.nvim"} -- faster startup
use { "lukas-reineke/indent-blankline.nvim"} -- smarter indent
use { "nvim-orgmode/orgmode"}
use { "frazrepo/vim-rainbow"}
use { "ap/vim-css-color"}
use { "goolord/alpha-nvim"}
use { "numToStr/Comment.nvim"}
use { "akinsho/toggleterm.nvim"}
use { "nvim-lualine/lualine.nvim"}

  -- Essential plugins
  use { "tpope/vim-surround"} -- add, delete, change surroundings (it's awesome)
  use { "inkarkat/vim-ReplaceWithRegister"} -- replace with register contents using motion (gr + motion)

  -- File Explorer Stuff
  use { "kyazdani42/nvim-web-devicons"}
  use { "kyazdani42/nvim-tree.lua"}
  use { "akinsho/bufferline.nvim"}
  use { "moll/vim-bbye"}

  -- Cmp 
  use { "hrsh7th/nvim-cmp" } -- The completion plugin
  use { "hrsh7th/cmp-buffer" } -- buffer completions
  use { "hrsh7th/cmp-path" } -- path completions
  use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-nvim-lua" }
  
  -- Snippets
  use { "L3MON4D3/LuaSnip" } --snippet engine
  use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use

  -- LSP
  use { "neovim/nvim-lspconfig" } -- enable LSP
  use { "williamboman/mason.nvim" } -- simple to use language server installer
  use { "williamboman/mason-lspconfig.nvim" }
  use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
  use { "RRethy/vim-illuminate" }

  -- Colorschemes
  use { "folke/tokyonight.nvim"}
  use { "lunarvim/darkplus.nvim"}
  use { "shaunsingh/nord.nvim"}

  -- Telescope
  use { "nvim-telescope/telescope.nvim"}

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter"}
  use { "windwp/nvim-autopairs"}

   -- DAP
  use { "mfussenegger/nvim-dap"}
  use { "rcarriga/nvim-dap-ui"}
  use { "ravenxrz/DAPInstall.nvim"}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
