function! RunCode()
    if !exists("g:loaded_run_code") || !g:loaded_run_code
        let g:loaded_run_code = 1
    else
        let g:loaded_run_code = 0
    endif
    if(&filetype == "java")
        call RunJavaCode()
    endif
endfunction

function! Run()
    if !exists("g:loaded_run_project") || !g:loaded_run_project
        let g:loaded_run_project = 1
    else
        let g:loaded_run_project = 0
    endif
    if(&filetype == "java")
        call RunJavaProject()
    endif
endfunction

function! CompileCode()
    if !exists("g:loaded_compile_code") || !g:loaded_compile_code
        let g:loaded_compile_code = 1
    else
        let g:loaded_compile_code = 0
    endif
    if(&filetype == "java")
        call CompileJavaCode()
    endif
endfunction

function CompileDebug()
    if !exists("g:loaded_compile_debug") || !g:loaded_compile_debug
        let g:loaded_compile_debug = 1
    else
        let g:loaded_compile_debug = 0
    endif
    if(&filetype == "java")
        call CompileJavaDebug()
    endif
endfunction
function RunTest()
    if !exists("g:loaded_run_test") || !g:loaded_run_test
        let g:loaded_run_test = 1
    else
        let g:loaded_run_test = 0
    endif
    if(&filetype == "java")
        call JavaTest()
    endif
endfunction

if(&filetype == "java")
    nmap <F5>:call JavaStartDebug()<CR>
endif
