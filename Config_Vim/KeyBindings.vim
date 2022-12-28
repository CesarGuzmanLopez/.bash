" Globao configuration keybindings
let mapleader = "f"

noremap  <leader>n :tabnew <CR>

" Don't pass messages to |ins-completion-menu|.
imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")
imap <silent><C-d> <Plug>(copilot-next) 
imap <silent><C-S> <Plug>(copilot-previous)

"Use Ctrl-S for save 
noremap  <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> :update<CR>
"se Ctrl-z for undo
noremap <silent> <C-z> :undo<CR>
vnoremap <silent> <C-z> :undo<CR>

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
imap <C-Down> <Esc>7j i
map <C-Up> 7k 
imap <C-Up> <Esc>7k i
nnoremap f+ :vertical resize +5<CR>
nnoremap f- :vertical resize -5<CR>


"Map of fucntions developed by me

"<Key	Mapping                         Function
"<F5	<Plug>VimspectorContinue	    When debugging, continue. Otherwise start debugging.
"<F3	<Plug>VimspectorStop	            Stop debugging.
"<F4	<Plug>VimspectorRestart	            Restart debugging with the same configuration.
"<F6	<Plug>VimspectorPause	            Pause debuggee.
"<F9	<Plug>VimspectorToggleBreakpoint	                Toggle line breakpoint on the current line.
"<leader><F9	<Plug>VimspectorToggleConditionalBreakpoint	
"               Toggle conditional line breakpoint or logpoint on the current line.
"<F8	<Plug>VimspectorAddFunctionBreakpoint	Add a function breakpoint for the expression under cursor
"<<leader>F8	<Plug>VimspectorRunToCursor	Run to Cursor
"<F10	<Plug>VimspectorStepOver	Step Over
"<F11	<Plug>VimspectorStepInto	Step Into
"<F12	<Plug>VimspectorStepOut	Step out of current function scope

nnoremap <leader><F3> :VimspectorReset<CR>
nnoremap <leader><F2> :call CompileDebug()<CR>
nnoremap <F2>         :call Run()<CR>
nnoremap <F7>         :call RunCode()<CR>
nnoremap <leader>t    :call RunTest()<CR>
