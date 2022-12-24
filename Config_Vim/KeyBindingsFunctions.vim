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

function! RunProject()
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

function! DebugCode()
    if !exists("g:loaded_debug_code") || !g:loaded_debug_code
        let g:loaded_debug_code = 1
    else
        let g:loaded_debug_code = 0
    endif
    if(&filetype == "java")
        call DebugJavaCode()
    endif
endfunction

function! StopDebug()
    if !exists("g:loaded_stop_debug") || !g:loaded_stop_debug
        let g:loaded_stop_debug = 1
    else
        let g:loaded_stop_debug = 0
    endif
    if(&filetype == "java")
        call StopJavaDebug()
    endif
endfunction

