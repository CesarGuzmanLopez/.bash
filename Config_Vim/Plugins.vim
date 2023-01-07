let g:copilot_no_tab_map = 1
call plug#begin('~/.vim/plugged')
    "Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --all' }
    "Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
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
"    Plug 'glepnir/spaceline.vim'
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
    if has('nvim') || has('patch-8.0.902')
        Plug 'mhinz/vim-signify'
    else
        Plug 'mhinz/vim-signify', { 'tag': 'legacy' }
    endif
    Plug 'vim-airline/vim-airline'
    Plug 'mhinz/vim-janah'
    Plug 'easymotion/vim-easymotion'
    Plug 'mboughaba/i3config.vim'
call plug#end()
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

let g:copilot_node_command = "~/.nvm/versions/node/v17.9.1/bin/node"
