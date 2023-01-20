if has('termguicolors')
    set termguicolors
endif

"verifico su estamos en un fondo claro u oscuro

if (has('termguicolors') && &background == 'dark')
    let g:gruvbox_material_background = 'hard'
    let g:gruvbox_material_transparent_background = 1
    let g:gruvbox_material_better_performance = 1
    let g:gruvbox_material_enable_italic = 1
    colorscheme gruvbox-material
    hi LineNr guifg=#bdbfbd      
    hi CursorLineNr guifg=#ffffff
    hi CursorLine guibg=#3c3836  
    hi SignColumn guibg=#3c3836  
    hi CursorLineNr guibg=#3c3836
  else
    color zellner
    hi LineNr guifg=#010001
    autocmd ColorScheme zellner   hi CursorLine guibg=#ffffff
    autocmd ColorScheme zellner   hi SignColumn guibg=#ffffff

endif

set display=lastline "Muestra la ultima linea
hi foldcolumn guibg=bg
autocmd VimEnter hi foldcolumn guibg=bg
autocmd VimEnter * hi Normal ctermbg=none
autocmd VimEnter * hi Normal guibg=none
set laststatus=3


autocmd ColorScheme gruvbox-material   hi LineNr guifg=#bdbfbd
autocmd ColorScheme gruvbox-material   hi CursorLineNr guifg=#ffffff
autocmd ColorScheme gruvbox-material   hi CursorLine guibg=#3c3836
autocmd ColorScheme gruvbox-material   hi SignColumn guibg=#3c3836
autocmd ColorScheme gruvbox-material   hi CursorLineNr guibg=#3c3836

autocmd ColorScheme zellner   hi LineNr guifg=#010001
set display=lastline

let g:spaceline_seperate_style = 'none'
" returns all modified files of the current git repo
" `2>\dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>\dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
  let files = systemlist('git ls-files -o --exclude-standard 1>\dev/null')
  return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! BufWidth()
  let width = winwidth(0)
  let numberwidth = max([&numberwidth, strlen(line('$'))+1])
  let numwidth = (&number || &relativenumber)? numberwidth : 0
  let foldwidth = &foldcolumn

  if &signcolumn == 'yes'
    let signwidth = 2
  elseif &signcolumn == 'auto'
    let signs = execute(printf('sign place buffer=%d', bufnr('')))
    let signs = split(signs, "\n")
    let signwidth = len(signs)>2? 2: 0
  else
    let signwidth = 0
  endif
  return width - numwidth - foldwidth - signwidth
endfunction

let g:startify_lists = [
        \ { 'type': 'dir',       'header': ['   My most recently used files:' . getcwd()] },
        \ { 'type' : 'files',       'header' : ['   My most recently used files:']},
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
let g:startify_custom_header = ''
let g:startify_session_delete_buffers = 1
let g:startify_session_persistence = 1
let g:startify_change_to_dir = 0

let g:hammy = [
\    '                              ▓▓▓▓██▓▓▓░░░                          ',
\    '                        ░░░░▓▓▓▓▓▓▓▓██▓▓▓▓░░░░                          ',
\    '                  ░░██▒▒░░  ██████████████░░░░████▒▒                    ',
\    '                 ▓▓░░▒▒████              ████░░▒▒▒▒                    ',
\    '               ▒▒██░░██▒▒                      ▓▓██▒▒▓▓▓▓                ',
\    '           ░░▓▓░░▒▒                              ░░▒▒░░▓▓              ',
\    '          ██░░░░                                        ██▓▓░░          ',
\    '        ▒▒▒▒▓▓                                            ▒▒▓▓          ',
\    '      ░░▒▒▓▓                                              ░░░░██░░      ',
\    '      ▓▓▓▓                                                  ▓▓░░██      ',
\    '    ██░░░░                                                    ██░░▓▓    ',
\    '  ██  ▓▓                    ░░                                  ██▒▒░░  ',
\    '  ██░░▓▓              ▒▒▒▒▒▒▒▒▒▒                                ██░░░░  ',
\    '▓▓░░██              ▒▒░░      ░░██                                ▓▓▓▓  ',
\    '▓▓░░██            ▒▒▓▓░░      ░░████▒▒░░██▒▒░░                    ▓▓▒▒  ',
\    '░░██            ██░░▒▒░░      ░░██░░░░░░░░░░▒▒██      ████        ░░▒▒██',
\    '▒▒██          ▒▒░░░░░░░░      ▓▓░░░░░░░░░░░░░░░░▓▓▒▒██░░██        ░░▒▒██',
\    '░░██        ▓▓▒▒░░▓▓░░░░░░░░▒▒░░░░░░░░░░░░░░░░░░░░▒▒░░░░▓▓        ░░▒▒██',
\    '▒▒██    ▒▒██  ░░▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒          ░░▒▒██',
\    '░░██  ░░████  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██            ░░  ██',
\    '░░██  ░░░░        ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓░░          ░░▒▒██',
\    '░░██    ▒▒████░░      ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓          ░░▒▒██',
\    '░░██      ██▓▓▓▓      ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓          ░░▒▒██',
\    '▓▓▒▒██      ▓▓▓▓██      ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓          ▓▓▒▒  ',
\    '▓▓  ██        ▒▒████░░▒▒░░░░▒▒░░            ▒▒░░░░░░░░░░██        ▓▓▓▓  ',
\    '  ██▒▒▓▓            ▒▒▓▓░░░░▒▒░░░░░░░░░░░░▓▓▓▓░░░░░░░░░░▓▓░░    ██░░░░  ',
\    '  ██  ▓▓            ░░░░░░▓▓░░░░░░░░░░  ░░    ░░░░▓▓██▒▒░░▒▒░░  ██▒▒░░  ',
\    '    ██▒▒░░        ░░░░▒▒██                            ░░████░░██  ██    ',
\    '      ▓▓▒▒        ░░██▒▒                                    ▓▓░░██      ',
\    '      ░░▓▓▒▒                                                ▒▒▓▓░░      ',
\    '  ████▓▓▒▒  ▓▓                                            ▒▒▓▓          ',
\    '  ██░░▓▓  ▓▓░░▒▒░░                                  ░░░░▓▓▒▒            ',
\    '▒▒░░▒▒▒▒▒▒  ▒▒▒▒░░▒▒                              ░░▓▓▒▒▒▒░░            ',
\    '░░░░░░░░▒▒    ▒▒██▒▒██▒▒                      ████▒▒██▓▓                ',
\    '░▓▓▓▓▓▒▒▒▒▒▒░▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▓▓░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓'
\]


let g:tardis = [
      \'。★  ˚ •    -   ˚ •。★˚˛˚ ',
      \'    _______|@|_________  •',
      \'   --------------------- ˚',
      \'  ||  POLICE ---- BOX  || ',
      \'  -----------------------C',
      \'  |  ______  |  ______  |É',
      \'  |  |####|  |  |####|  |S',
      \'  |  |####|  |  |####|  |A',
      \'  |  |####|  |  |####|  |R',
      \'% |  ------  |  ------  |˚',
      \'  |  |BAD |  |  |    |  |˚',
      \'  |  |WOLF|  |  |    |  | ',
      \'  |  ------  |O ------  | ',
      \'  |  ------  |° ------  | ',
      \'˚ |  |    |  |  |    |  | ',
      \'L |  |    |  |  |    |  |•',
      \'A |  ------  |  ------  | ',
      \'U |  ------  |  ------  |•',
      \'  |  |    |  |  |    |  |˚',
      \'˚ |  |    |  |  |    |  |•',
      \'  |  ------  |  ------  | ',
      \' _|_____________________|_',
      \' |_______________________|'
      \]
"obtengo un nunmero aleatorio entre 0 y 4

let g:rnd = localtime() % 0x10000

function! Random(n) abort
  let g:rnd = (g:rnd * 31421 + 6927) % 0x10000
  return g:rnd * a:n / 0x10000
endfunction

let aleatorio = Random(5)

if aleatorio == 0  && BufWidth() > 85
  let g:startify_custom_header = 
        \startify#pad(g:hammy)
elseif aleatorio == 1 
  let g:startify_custom_header = startify#pad( startify#fortune#boxed())
elseif aleatorio == 2
  let g:startify_custom_header =
        \startify#pad(split(system('figlet -w 80 Cesar-Lau'), '\n') )
elseif aleatorio == 3
  let g:startify_custom_header = startify#pad(g:tardis)
endif

"autocmd WinEnter,FocusGained * :setlocal number relativenumber
"autocmd WinLeave,FocusLost   * :setlocal norelativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
"autocmd InsertEnter * :setlocal number
"autocmd InsertLeave * :setlocal relativenumber
let g:indentLine_char_list = ['│','|', '¦', '┆', '┊']

let g:indentLine_color_term = 139
let g:indentLine_defaultGroup = 'SpecialKey'


