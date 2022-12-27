call plug#begin('~/.vim/plugged')
    "Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --all' }
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    Plug 'Yggdroot/indentLine'
    Plug 'akaron/vim-markdown-fold'
    Plug 'chrisbra/NrrwRgn'
    Plug 'christoomey/vim-quicklink'
    Plug 'christoomey/vim-quicklink'
    Plug 'github/copilot.vim'
    Plug 'iberianpig/tig-explorer.vim'
    "Plug 'itchyny/lightline.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'   " spotlight on cursorline
    Plug 'majutsushi/tagbar'
    Plug 'matze/vim-tex-fold'
    "Plug 'maximbaz/lightline-ale'
    Plug 'mikelue/vim-maven-plugin'
    Plug 'nanotech/jellybeans.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'preservim/nerdtree'
    Plug 'puremourning/vimspector'
    Plug 'rbgrouleff/bclose.vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'sainnhe/gruvbox-material'
    Plug 'sheerun/vim-polyglot'
    Plug 'skywind3000/asyncrun.vim'
    Plug 'glepnir/spaceline.vim'
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
   " Plug 'vim-airline/vim-airline'  " almileszs/ack.vimt.: lightline; manually build statusline (see below)
    Plug 'w0rp/ale'
    Plug 'mhinz/vim-startify'
call plug#end()

