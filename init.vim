"source  ~/.config/nvim/init.vim
"
" Directorio de plugins

syntax enable
"Muestra el numero de linea
set number
set undofile "Permite que se pueda desacer en el achivo aun aun cuando se haya cerrado
set undodir=~/.vim/undodir
set showcmd "Muestra el comando que se esta ejecutando en la parte inferior
set list "Muestra los espacios en blanco y los caracteres especiales como tabuladores 
set encoding=utf-8 "Codificacion de caracteres
set numberwidth=1 "Ancho de la columna de numeros de linea
set ruler "Muestra la posicion del cursor en la parte inferior
set cursorline "Resalta la linea en la que se encuentra el cursor
set autoindent "Indentacion automatica
set smartindent "Indentacion inteligente
set ignorecase "No distingue entre mayusculas y minusculas
set smartcase "Si se escribe una mayuscula, se distingue entre mayusculas y minusculas
set nowrap "No permite que el texto se desborde de la pantalla
set expandtab "Reemplaza los tabuladores por espacios
set tabstop=4 "Ancho de tabulacion
set shiftwidth=4 "Ancho de sangria
set fileformat=unix "Formato de archivo
" set spell
set spelllang=es,en_us
" TextEdit might fail if hidden is not set.
set hidden 
" Some servers have issues with backup files, see #649.
set nobackup "No crea archivos de respaldo
set nowritebackup 
" Give more space for displaying messages.
set cmdheight=1
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=200 "Tiempo de espera para que se actualice el archivo
set signcolumn=yes "Muestra la columna de signos
set relativenumber "Muestra el numero de linea relativo
" copy paste to system clipboard 
set clipboard=unnamedplus "Permite copiar y pegar desde el portapapeles
set foldmethod=indent "Permite que se puedan colapsar las lineas de codigo
set foldlevel=1 "Nivel de colapso de las lineas de codigo
set lazyredraw "Permite que se actualice el archivo sin tener que cerrarlo
set foldenable "Permite que se puedan colapsar las lineas de codigo
set foldlevelstart=0 "Nivel de colapso de las lineas de codigo 0 es que colapse automaticamente todo
set foldnestmax=10 "Nivel de colapso de las lineas de codigo
set colorcolumn=120 "Muestra una linea vertical en la columna 80
set mouse= "Desactiva el uso del mouse
call plug#begin('~/.vim/plugged')
"   Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --all' }
    Plug 'sainnhe/gruvbox-material'
    Plug 'sheerun/vim-polyglot'
    Plug 'maximbaz/lightline-ale'
    Plug 'itchyny/lightline.vim'
    Plug 'preservim/nerdtree'
    Plug 'github/copilot.vim'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'skywind3000/asyncrun.vim'
    Plug 'nanotech/jellybeans.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'majutsushi/tagbar'
    Plug 'w0rp/ale'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/goyo.vim'        " write mode
    Plug 'junegunn/limelight.vim'   " spotlight on cursorline
    Plug 'mileszs/ack.vim'
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    Plug 'tmhedberg/SimpylFold'     " for python
    Plug 'matze/vim-tex-fold'
    Plug 'akaron/vim-markdown-fold'
    Plug 'Yggdroot/indentLine'
    Plug 'vim-airline/vim-airline'  " alt.: lightline; manually build statusline (see below)
    Plug 'tpope/vim-unimpaired'  " define some paired key-bindings
    Plug 'tpope/vim-eunuch'  " some unix commands
    Plug 'semanticart/tag-peek.vim'
    Plug 'puremourning/vimspector'
    Plug 'mikelue/vim-maven-plugin'
    Plug 'iberianpig/tig-explorer.vim'
    Plug 'rbgrouleff/bclose.vim'
    Plug 'puremourning/vimspector'
    Plug 'chrisbra/NrrwRgn'
    Plug 'christoomey/vim-quicklink'
    Plug 'christoomey/vim-quicklink'
call plug#end()

let mapleader = "F"
let g:gruvbox_material_background='medium'
let NERDTreeShowHidden=1
let $FZF_DEFAULT_COMMAND='find . \! \( -type d -path ./.git -prune \) \! -type d \! -name ''*.tags'' -printf ''%P\n'''
let g:fzf_action = { 'enter': 'tab split' }

nnoremap <C-E> :NERDTreeToggle<CR>

" Don't pass messages to |ins-completion-menu|.
imap <C-a> <Plug>(copilot-next)
imap <C-d> <Plug>(copilot-previous)
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")

"Use Ctrl-S for save 
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

"Use Ctrl-z for undo
noremap <silent> <C-z> :undo<CR>
vnoremap <silent> <C-z> :undo<CR>

"auto poner los parentesis y llaves
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha
inoremap < <><Esc>ha


function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang Grep call RipgrepFzf(<q-args>, <bang>0)

nnoremap <leader>e :FZF<CR> 
noremap  <leader>n :tabnew <CR>
