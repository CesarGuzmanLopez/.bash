" Globao configuration keybindings
"
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


" Map NvimTree
nnoremap <C-E> :NvimTreeToggle<CR>

nnoremap <silent><leader>fz <cmd>FZF <CR>
nnoremap <silent><leader>fh <cmd>History<CR>
nnoremap <silent><leader>ff <cmd>Files<CR>
nnoremap <silent><leader>fb <cmd>Buffers<CR>
nnoremap <silent><leader>ft <cmd>Tags<CR>
nnoremap <silent><leader>fc <cmd>Commands<CR>
nnoremap <silent><leader>fm <cmd>Marks<CR>
nnoremap <silent><leader>fl <cmd>Lines<CR>
nnoremap <silent><leader>fg <cmd>Grep<CR>
nnoremap <silent><leader>fM <cmd>Maps<CR>

nnoremap <leader>s :SSave 
nnoremap <leader>l :SLoad
"nnoremap <leader>h :SDelete

"nnoremap <c-z>o :Goyo <CR>

"map para que la tecla C-down dezplace 7 lineas hacia abajo
"map <C-Down> 7j
"imap <C-Down> <Esc> 7j i
"map <C-Up> 7k
"imap <C-Up> <Esc>7k i
"nnoremap f+ :vertical resize +5<CR>
"nnoremap f- :vertical resize -5<CR>

inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

nnoremap <S-w> :qa<CR>
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

nnoremap <leader>qi :VimspectorReset<CR>
nnoremap <leader>1 :call CompileDebug()<CR>
nnoremap <leader>2 :call Run()<CR>
nnoremap <leader>& :call CompileOnlyCode()<CR>
nnoremap <leader>7 :call RunOnlyCode()<CR>
nnoremap <leader>t :call RunTest()<CR>

nnoremap <C-W>m <Cmd>WinShift<CR>

" set
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>

map         <silent><c-z> <Esc>:
imap        <silent><c-z> <Esc>:

omap        <silent><c-x>s :<C-U>lua require('tsht').nodes()<CR>
xnoremap    <silent><c-x>s :lua require('tsht').nodes()<CR>
imap        <silent><c-x>s <Esc>:lua require('tsht').nodes()<CR>
nnoremap    <silent><c-x>s :lua require('tsht').nodes()<CR>

nnoremap    <silent><c-x>a :lua require('tsht').move({ side = "start" })<CR>
imap        <silent><c-x>a <Esc>:lua require('tsht').move({ side = "start" })<CR>


nnoremap    <silent><c-x>w <cmd>HopWord<CR>
imap        <silent><c-x>w <Esc><cmd>HopWord<CR>i
map         <silent><c-x>w  <cmd>HopWord<CR>

nnoremap    <silent><c-x>v <cmd>HopVertical<CR>
imap        <silent><c-x>v <Esc><cmd>HopVertical<CR>i
map         <silent><c-x>v  <cmd>HopVertical<CR>


nnoremap    <silent><c-x>c <cmd>HopChar1<CR>
imap        <silent><c-x>c <Esc><cmd>HopChar1<CR>i
map         <silent><c-x>c  <cmd>HopChar1<CR>

nnoremap    <silent><c-x>b <cmd>HopChar2<CR>
imap        <silent><c-x>b <Esc><cmd>HopChar2<CR>i
map         <silent><c-x>b <cmd>HopChar2<CR>

nnoremap    <silent><c-x>A <cmd>HopAnywhere<CR>
imap        <silent><c-x>A <Esc><cmd>HopAnywhere<CR>i
map         <silent><c-x>A <cmd>HopAnywhere<CR>

nnoremap    <silent><c-x>h <cmd>HopChar1CurrentLine<CR>
imap        <silent><c-x>h <Esc><cmd>HopCurrentLine<CR>i
map         <silent><c-x>h <cmd>HopCurrentLine<CR>

nnoremap    <silent><c-x>p <cmd>HopPattern<CR>
imap        <silent><c-x>p <Esc><cmd>HopPattern<CR>i
map         <silent><c-x>p <cmd>HopPattern<CR>

