syntax enable
"set colorcolumn=120 "Muestra una linea vertical en la columna 80
set autoindent "Indentacion automatica
set clipboard^=unnamed,unnamedplus
set cmdheight=1
set cursorline "Resalta la linea en la que se encuentra el cursor
set encoding=utf-8 "Codificacion de caracteres
"set expandtab "Reemplaza los tabuladores por espacios
set modifiable
"set fileformat=unix "Formato de archivo
set foldlevel=1 "Nivel de colapso de las lineas de codigo
set foldlevelstart=0 "Nivel de colapso de las lineas de codigo 0 es que colapse automaticamente todo
set foldmethod=manual "Permite que se puedan colapsar las lineas de codigo

set foldnestmax=10 "Nivel de colapso de las lineas de codigo
set hidden
set ignorecase "No distingue entre mayusculas y minusculas
set lazyredraw "Permite que se actualice el archivo sin tener que cerrarlo
set list "Muestra los espacios en blanco y los caracteres especiales como tabuladores 
set mouse= "Desactiva el uso del mouse
set nobackup "No crea archivos de respaldo
set nofoldenable "Permite que se puedan colapsar las lineas de codigo
set nowrap "No permite que el texto se desborde de la pantalla
set nowritebackup 
set number
set numberwidth=1 "Ancho de la columna de numeros de linea
set relativenumber "Muestra el numero de linea relativo" copy paste to system clipboard 
set ruler "Muestra la posicion del cursor en la parte inferior
set shiftwidth=4 "Ancho de sangria
set showcmd "Muestra el comando que se esta ejecutando en la parte inferior
set showmatch "Muestra el parentesis que cierra
set signcolumn=yes "Muestra la columna de signos
set smartcase "Si se escribe una mayuscula, se distingue entre mayusculas y minusculas
set smartindent "Indentacion inteligente
set spell 
set spell spelllang=es,en_us
set tabstop=4 "Ancho de tabulacion
set undodir=~/.vim/undodir
set undofile "Permite que se pueda desacer en el achivo aun aun cuando se haya cerrado
set updatetime=200 "Tiempo de espera para que se actualice el archivo
set nowrap "Permite que: el texto se ajuste al tamaño de la pantalla
set wrapmargin=0 "Margen de ajuste de texto
set fcs=eob:\ 
set fillchars+=vert:\ ,
set wrap
set display=lastline "Muestra la ultima linea
" enable indentation
set breakindent
set linebreak
" ident by an additional 2 characters on wrapped lines, when line >= 40 characters, put 'showbreak' at start of line
set breakindentopt=shift:2,min:40,sbr

" append '>>' to indent
set showbreak=
set showmatch 

set nobomb
set incsearch " Search as you type
set infercase " Smart case when doing keyword completion
set smartcase " Use case-sensitive search if there is a capital letter

set autoread

set display=lastline

  " Consolidate temporary files into a central spot
  if has("patch-8.1.0251")
    set backupdir=~/.vim/tmp/backup//
  else
    set backupdir=~/.vim/tmp/backup
  endif
  set directory=~/.vim/tmp/swap//
