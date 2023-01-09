function! C_CompileCode(...)
    let b:args =""
    let b:compile = ""
    if (&filetype == "cpp")
        let b:args = "-std=c++11 -Wall -Wextra -pedantic -O2"
        let b:compile = "g++"
    elseif (&filetype == "c")
        let b:args = "-Wall -Wextra -pedantic -O2 "
        let b:compile = "gcc"
    endif
    let b:command = b:compile . " " . b:args . " " . expand("%") . " -o " . expand("%:r")
    if a:0 > 0
        for i in a:000
            let b:command = b:command . " " . i
        endfor
    endif
    call asyncrun#run('', {'mode':'terminal', 'pos':'tab'}, b:command)
endfunction


command! -nargs=* CompileCOnly call C_CompileCode(<f-args>)

function! C_RunCode(...)
    let b:Comand ="./". expand('%:r')
    if a:0 > 0
        for i in a:000
            let b:Comand = b:Comand . " " . i
        endfor
    endif
    echo b:Comand
    call asyncrun#run('', {'mode':'terminal', 'cwd': "$(VIM_ROOT)", 'pos':'tab', 'reuse':'1'}, b:Comand)
endfunction

command! -nargs=* RunCOnly call C_RunCode(<f-args>)

function! C_Complie_Make()
    :!make
endfunction

function! C_Run_Make( args)
    :!make run ARGS=$a:args
endfunction
function! C_Debug_Make()
    :!make debug
endfunction

