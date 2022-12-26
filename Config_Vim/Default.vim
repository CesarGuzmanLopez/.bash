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
set clipboard^=unnamed,unnamedplus
set lazyredraw "Permite que se actualice el archivo sin tener que cerrarlo
"set colorcolumn=120 "Muestra una linea vertical en la columna 80
set mouse= "Desactiva el uso del mouse
set fcs=eob:\ 
set nofoldenable "Permite que se puedan colapsar las lineas de codigo
set foldmethod=syntax "Permite que se puedan colapsar las lineas de codigo
set foldlevel=1 "Nivel de colapso de las lineas de codigo
set foldlevelstart=0 "Nivel de colapso de las lineas de codigo 0 es que colapse automaticamente todo
set foldnestmax=10 "Nivel de colapso de las lineas de codigo
