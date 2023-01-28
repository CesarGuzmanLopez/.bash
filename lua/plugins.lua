
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  use { 'junegunn/fzf', run = ":call fzf#install()" }
  use { 'junegunn/fzf.vim' }
  use "lukas-reineke/indent-blankline.nvim"
  use 'akaron/vim-markdown-fold'
  use 'chrisbra/NrrwRgn'
  use 'christoomey/vim-quicklink'
  use 'github/copilot.vim'
  use 'iberianpig/tig-explorer.vim'
  use 'majutsushi/tagbar'
  use 'mikelue/vim-maven-plugin'
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'nvim-tree/nvim-tree.lua'
  use 'puremourning/vimspector'
  use 'https://github.com/CesarGuzmanLopez/true-zen.nvim'
  use 'rbgrouleff/bclose.vim'
  use 'ryanoasis/vim-devicons'
  use 'folke/tokyonight.nvim'
  use 'sheerun/vim-polyglot'
  use{"skywind3000/asyncrun.vim"}
  use 'tmsvg/pear-tree'
  use 'tpope/vim-commentary'
  use 'tpope/vim-eunuch'  
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'w0rp/ale'
  use 'mhinz/vim-startify'
  use {'mhinz/vim-signify',  tag= 'legacy' }
  use 'mhinz/vim-janah'
  use 'easymotion/vim-easymotion'
  use 'mboughaba/i3config.vim'
  use 'b0o/incline.nvim'
  use 'Pocco81/auto-save.nvim'
  use 'ethanholz/nvim-lastplace'
  use 'alec-gibson/nvim-tetris'
  use 'sindrets/winshift.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'phaazon/hop.nvim'
  use 'utilyre/barbecue.nvim'
  use 'neovim/nvim-lspconfig'
  use 'SmiteshP/nvim-navic'
  use 'nvim-tree/nvim-web-devicons'
  use 'mfussenegger/nvim-treehopper'
  use 'lewis6991/gitsigns.nvim'
  use 'nvim-lua/popup.nvim'
  use 'rafamadriz/friendly-snippets' 
  use 'akinsho/toggleterm.nvim'
  use {'numToStr/Comment.nvim'} 
  use 'nvim-telescope/telescope.nvim'
  use 'folke/which-key.nvim'
  use 'lervag/vimtex'
  use { 'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',config = 'vim.cmd[[TSInstall all]]'  }
end)
