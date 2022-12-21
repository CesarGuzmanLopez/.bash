function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

function! JavaStartVimDebugCallback(err, port)
  execute "cexpr! 'Java debug started on port: " . a:port . "'"
  call vimspector#LaunchWithSettings({ "configuration": "Java Attach", "AdapterPort": a:port })
endfunction

function JavaStartDebug()
  call CocActionAsync('runCommand', 'vscode.java.startDebugSession', function('JavaStartVimDebugCallback'))
endfunction

function! JavaStopDebugCallback(err, port)
  execute "cexpr! 'Java debug stopped'"
  call vimspector#Reset()
endfunction

function JavaStopDebug()
  call CocActionAsync('runCommand', 'vscode.java.stopDebugSession', function('JavaStopDebugCallback'))
endfunction
function! JavaRunCallback(err, port)
  execute "cexpr! 'Java run maven project'"
  term mvn compile exec:java 
endfunction

function JavaRun()
  call CocActionAsync('runCommand', function('JavaRunCallback'))
endfunction

function! JavaTestCallback(err, port)
  execute "cexpr! 'Java test maven project'"
  term mvn test
endfunction

function JavaTest()
  call CocActionAsync('runCommand', function('JavaTestCallback'))
endfunction

function! JavaDebugCallback(err, port)
  execute "cexpr! 'Java debug maven project'"
  term mvnDebug compile exec:java 
endfunction

function JavaDebug()
  execute "cexpr! 'Java debug maven project'"

  call CocActionAsync('runCommand', function('JavaDebugCallback'))


endfunction

