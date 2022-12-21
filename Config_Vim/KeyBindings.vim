" Globao configuration keybindings
let mapleader = "f"

noremap  <leader>n :tabnew <CR>

" Don't pass messages to |ins-completion-menu|.
imap <C-f> <Plug>(copilot-next)
imap <C-d> <Plug>(copilot-previous)
imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")

"Use Ctrl-S for save 
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

"Use Ctrl-z for undo
noremap <silent> <C-z> :undo<CR>
vnoremap <silent> <C-z> :undo<CR>

"map cF to close all folds

noremap <silent> <C-F> :set foldlevel=99<CR>

"map cf to open all folds
noremap <silent> <C-f> :set foldlevel=0<CR>

" Map NerdTree
nnoremap <C-E> :NERDTreeToggle<CR>

" map of FZF
nnoremap <leader>e :FZF <CR>
