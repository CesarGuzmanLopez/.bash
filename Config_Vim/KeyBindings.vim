" Globao configuration keybindings
"
let mapleader = "f"

noremap  <leader>n :tabnew <CR>

" Don't pass messages to |ins-completion-menu|.
inoremap <silent><script><expr> <C-a> copilot#Accept("\<CR>")
inoremap <silent><C-s> <Plug>(copilot-next) 
inoremap <silent><C-d> <Plug>(copilot-previous)

inoremap <silent><script><expr> <c-a> copilot#Accept("\<CR>")
inoremap <silent><c-s> <Plug>(copilot-next) 
inoremap <silent><c-d> <Plug>(copilot-previous)

"Use Ctrl-S for save 
noremap  <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> :update<CR>

"se Ctrl-z for undo
noremap <silent> <C-z> :<CR>
vnoremap <silent> <C-z> :<CR>

"map cF to close all folds
noremap <silent> <C-F> :set foldlevel=99<CR>

"map cf to open all folds
noremap <silent> <C-f> :set foldlevel=0<CR>

" Map NerdTree
nnoremap <C-E> :NERDTreeToggle<CR>

nnoremap gfz :FZF <CR>
nnoremap gfh :History<CR>
nnoremap gff :Files<CR>
nnoremap gfb :Buffers<CR>
nnoremap gft :Tags<CR>
nnoremap gfc :Commands<CR>
nnoremap gfm :Marks<CR>
nnoremap gfl :Lines<CR>
nnoremap gfg :Grep<CR>
nnoremap gfM :Maps<CR>

nnoremap <leader>s :SSave 
nnoremap <leader>l :SLoad
nnoremap <leader>h :SDelete

nnoremap <c-z>o :Goyo <CR>


"map para que la tecla C-down dezplace 7 lineas hacia abajo
map <C-Down> 7j
imap <C-Down> <Esc> 7j i
map <C-Up> 7k
imap <C-Up> <Esc>7k i
nnoremap f+ :vertical resize +5<CR>
nnoremap f- :vertical resize -5<CR>

"  nmap <F5>         <Plug>VimspectorContinue
"  nmap <S-F5>       <Plug>VimspectorStop
"  nmap <C-S-F5>     <Plug>VimspectorRestart
"  nmap <F6>         <Plug>VimspectorPause
"  nmap <F8>         <Plug>VimspectorJumpToNextBreakpoint
"  nmap <S-F8>       <Plug>VimspectorJumpToPreviousBreakpoint
"  nmap <F9>         <Plug>VimspectorToggleBreakpoint
"  nmap <S-F9>       <Plug>VimspectorAddFunctionBreakpoint
"  nmap <F10>        <Plug>VimspectorStepOver
"  nmap <F11>        <Plug>VimspectorStepInto
"  nmap <S-F11>      <Plug>VimspectorStepOut
"  nmap <M-8>        <Plug>VimspectorDisassemble

nnoremap <leader><F3> :VimspectorReset<CR>
nnoremap <leader><F2> :call CompileDebug()<CR>
nnoremap <F2>         :call Run()<CR>
nnoremap <F7>         :call RunCode()<CR>
nnoremap <leader>t    :call RunTest()<CR>
