

function! C_CompileCode(cpp_compile_input, extraArgs)
    execute "Compiling ..."
    let args = "-std=c++11 -Wall -Wextra -Werror -pedantic -O2  ". a:extraArgs ."-o " . a:cpp_compile_output . " " . a:cpp_compile_input
    if (&filetype == "cpp")
        let args = "-std=c++11 -Wall -Wextra -Werror -pedantic -O2 -o " . a:cpp_compile_output . " " . a:cpp_compile_input
    elseif (&filetype == "c")
        let args = "-Wall -Wextra -Werror -pedantic -O2 -o " . a:cpp_compile_output . " " . a:cpp_compile_input
    endif
    :!g++ $args
    execute "Compiled!"
endfunction

function! C_RunCode(Cpp_Run_program, cpp_run_args)
    execute "Running .."
endfunction

