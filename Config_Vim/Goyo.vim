
let g:goyo_width = '99%'
let g:goyo_height = '99%'
function! s:goyo_enter()
    set number
    set relativenumber
endfunction


autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
