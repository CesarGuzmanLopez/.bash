let g:copilot_no_tab_map = 1
let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
let g:lastplace_ignore_buftype = "quickfix,nofile,help"
let g:lastplace_open_folds = 0

function! TSInstalAll(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
    TSUpdate
    TSInstall all
endfunction

call plug#begin('~/.vim/plugged')
    Plug 'Yggdroot/indentLine'
    Plug 'akaron/vim-markdown-fold'
    Plug 'chrisbra/NrrwRgn'
    Plug 'christoomey/vim-quicklink'
    Plug 'christoomey/vim-quicklink'
    Plug 'github/copilot.vim'
    Plug 'iberianpig/tig-explorer.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/limelight.vim'   " spotlight on cursorline
    Plug 'majutsushi/tagbar'
    Plug 'matze/vim-tex-fold'
    Plug 'mikelue/vim-maven-plugin'
    Plug 'nanotech/jellybeans.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'Pocco81/true-zen.nvim'
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'puremourning/vimspector'
    Plug 'rbgrouleff/bclose.vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'sainnhe/gruvbox-material'
    Plug 'sheerun/vim-polyglot'
    Plug 'skywind3000/asyncrun.vim'
    Plug 'tmhedberg/SimpylFold'     " for python
    Plug 'tmsvg/pear-tree'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'  " some unix commands
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-rhubarb'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'  " define some paired key-bindings
    Plug 'w0rp/ale'
    Plug 'mhinz/vim-startify'
    if has('nvim') || has('patch-8.0.902')
        Plug 'mhinz/vim-signify'
    else
        Plug 'mhinz/vim-signify', { 'tag': 'legacy' }
    endif
    Plug 'vim-airline/vim-airline'
    Plug 'mhinz/vim-janah'
    Plug 'easymotion/vim-easymotion'
    Plug 'mboughaba/i3config.vim'
    Plug 'b0o/incline.nvim'
    Plug 'Pocco81/auto-save.nvim'
    Plug 'ethanholz/nvim-lastplace'
    Plug 'alec-gibson/nvim-tetris'
    Plug 'sindrets/winshift.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'phaazon/hop.nvim'
    Plug 'utilyre/barbecue.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'SmiteshP/nvim-navic'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'mfussenegger/nvim-treehopper'
    Plug 'nvim-treesitter/nvim-treesitter', {'do':  function('TSInstalAll')}
    Plug 'lewis6991/impatient.nvim'
    Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'williamboman/mason.nvim'
    Plug 'rafamadriz/friendly-snippets'
    Plug 'numToStr/Comment.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'folke/which-key.nvim'
call plug#end()



aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end
let g:copilot_node_command = "~/.nvm/versions/node/v17.9.1/bin/node"
lua require('impatient')
set foldexpr=nvim_treesitter#foldexpr()
