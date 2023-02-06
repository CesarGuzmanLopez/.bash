function! CompileOnlyCode()
    if !exists("g:loaded_compile_code") || !g:loaded_compile_code
        let g:loaded_compile_code = 1
    else
        let g:loaded_compile_code = 0
    endif
    if(&filetype == "java")
        call CompileJavaCode()
    elseif(&filetype == "c" || &filetype == "cpp")
        :CompileCOnly  
    else
        echo "Not implemented yet for this filetype"
    endif
endfunction

"waht is <SNR> ?

function! RunOnlyCode()
    if !exists("g:loaded_run_code") || !g:loaded_run_code
        let g:loaded_run_code = 1
    else
        let g:loaded_run_code = 0
    endif
    if(&filetype == "java")
        call RunJavaCode()
    elseif(&filetype == "c" || &filetype == "cpp")
        :RunCOnly
    else
        echo "Not implemented yet for this filetype"
    endif
endfunction

function! Compile()
    if !exists("g:loaded_compile") || !g:loaded_compile
        let g:loaded_compile = 1
    else
        let g:loaded_compile = 0
    endif
    if(&filetype == "java")
        call CompileJava()
    else
        echo "Not implemented yet for this filetype"
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
    else
        echo "Not implemented yet for this filetype"
    endif
endfunction

function! CompileToTest()
    if !exists("g:loaded_compile_test") || !g:loaded_compile_test
        let g:loaded_compile_test = 1
    else
        let g:loaded_compile_test = 0
    endif
    if(&filetype == "java")
        call CompileJavaTest()
    else
        echo "Not implemented yet for this filetype"
    endif
endfunction

function! RunTest()
    if !exists("g:loaded_run_test") || !g:loaded_run_test
        let g:loaded_run_test = 1
    else
        let g:loaded_run_test = 0
    endif
    if(&filetype == "java")
        call JavaTest()
    else
        echo "Not implemented yet for this filetype"
    endif
endfunction

function! CompileDebug()
    if !exists("g:loaded_compile_debug") || !g:loaded_compile_debug
        let g:loaded_compile_debug = 1
    else
        let g:loaded_compile_debug = 0
    endif
    if(&filetype == "java")
        call CompileJavaDebug()
    else
        echo "Not implemented yet for this filetype"
    endif
endfunction

function! RunDebug()
    if !exists("g:loaded_run_debug") || !g:loaded_run_debug
        let g:loaded_run_debug = 1
    else
        let g:loaded_run_debug = 0
    endif
    if(&filetype == "java")
        call RunJavaDebug()
    else
        call vimspector#Launch( v:true )
    endif
endfunction

function! DebugContinue()
    if !exists("g:loaded_debug_continue") || !g:loaded_debug_continue
        let g:loaded_debug_continue = 1
    else
        let g:loaded_debug_continue = 0
    endif
    if(&filetype == "log")
        echo "Not implemented yet for this filetype"
    else
        call vimspector#Continue()
    endif
endfunction

function! DebugStop()
    if !exists("g:loaded_debug_stop") || !g:loaded_debug_stop
        let g:loaded_debug_stop = 1
    else
        let g:loaded_debug_stop = 0
    endif
    if(&filetype == "log")
        echo "Not implemented yet for this filetype"
    else
        call vimspector#Stop()
    endif
endfunction

function! DebugRestart()
    if !exists("g:loaded_debug_restart") || !g:loaded_debug_restart
        let g:loaded_debug_restart = 1
    else
        let g:loaded_debug_restart = 0
    endif
    if(&filetype == "log")
        echo "Not implemented yet for this filetype"
    else
        call vimspector#Restart()
    endif
endfunction


function! DebugPause()
    if !exists("g:loaded_debug_pause") || !g:loaded_debug_pause
        let g:loaded_debug_pause = 1
    else
        let g:loaded_debug_pause = 0
    endif
    if(&filetype == "log")
        echo "Not implemented yet for this filetype"
    else
        call vimspector#Pause()
    endif
endfunction

function! DebugToggleBreakpoint()
    if !exists("g:loaded_debug_toggle_breakpoint") || !g:loaded_debug_toggle_breakpoint
        let g:loaded_debug_toggle_breakpoint = 1
    else
        let g:loaded_debug_toggle_breakpoint = 0
        call vimspector#ToggleBreakpoint()
    endif
endfunction

function! DebugToggleConditionalBreakpoint()
    if !exists("g:loaded_debug_toggle_conditional_breakpoint") || !g:loaded_debug_toggle_conditional_breakpoint
        let g:loaded_debug_toggle_conditional_breakpoint = 1
    else
        let g:loaded_debug_toggle_conditional_breakpoint = 0
    endif
    if(&filetype == "log")
        echo "Not implemented yet for this filetype"
    else
        call vimspector#ToggleConditionalBreakpoint()
    endif
endfunction

function! DebugAddFunctionBreakpoint()
    if !exists("g:loaded_debug_add_function_breakpoint") || !g:loaded_debug_add_function_breakpoint
        let g:loaded_debug_add_function_breakpoint = 1
    else
        let g:loaded_debug_add_function_breakpoint = 0
    endif
    if(&filetype == "log")
        echo "Not implemented yet for this filetype"
    else
        call vimspector#AddFunctionBreakpoint()
    endif
endfunction

function! DebugStepOver()
    if !exists("g:loaded_debug_step_over") || !g:loaded_debug_step_over
        let g:loaded_debug_step_over = 1
    else
        let g:loaded_debug_step_over = 0
    endif
    if(&filetype == "log")
        echo "Not implemented yet for this filetype"
    else
        call vimspector#StepOver()
    endif
endfunction

function! DebugStepInto()
    if !exists("g:loaded_debug_step_into") || !g:loaded_debug_step_into
        let g:loaded_debug_step_into = 1
    else
        let g:loaded_debug_step_into = 0
    endif
    if(&filetype == "log")
        echo "Not implemented yet for this filetype"
    else
        call vimspector#StepInto()
    endif
endfunction

function! DebugStepOut()
    if !exists("g:loaded_debug_step_out") || !g:loaded_debug_step_out
        let g:loaded_debug_step_out = 1
    else
        let g:loaded_debug_step_out = 0
    endif
    if(&filetype == "log")
        echo "Not implemented yet for this filetype"
    else
        call vimspector#StepOut()
    endif
endfunction

function! DebugRunToCursor()
    if !exists("g:loaded_debug_run_to_cursor") || !g:loaded_debug_run_to_cursor
        let g:loaded_debug_run_to_cursor = 1
    else
        let g:loaded_debug_run_to_cursor = 0
    endif
    if(&filetype == "log")
        echo "Not implemented yet for this filetype"
    else
        call vimspector#RunToCursor()
    endif
endfunction

function! DebugGoToCurrentLine()
    if !exists("g:loaded_debug_go_to_current_line") || !g:loaded_debug_go_to_current_line
        let g:loaded_debug_go_to_current_line = 1
    else
        let g:loaded_debug_go_to_current_line = 0
    endif
    if(&filetype == "log")
        echo "Not implemented yet for this filetype"
    
        call vimspector#GoToCurrentLine()
    endif
endfunction

function! DebugBalloonEval0()
    if !exists("g:loaded_debug_balloon_eval") || !g:loaded_debug_balloon_eval
        let g:loaded_debug_balloon_eval = 1
    else
        let g:loaded_debug_balloon_eval = 0
    endif
    if(&filetype == "log")
        echo "Not implemented yet for this filetype"
    else
        call vimspector#BalloonEval(0)
    endif
endfunction

function! DebugBalloonEval1()
    if !exists("g:loaded_debug_balloon_eval") || !g:loaded_debug_balloon_eval
        let g:loaded_debug_balloon_eval = 1
    else
        let g:loaded_debug_balloon_eval = 0
    endif
    if(&filetype == "log")
        echo "Not implemented yet for this filetype"
    else
        call vimspector#BalloonEval(1)
    endif
endfunction

function! DebugUpFrame()
    if !exists("g:loaded_debug_up_frame") || !g:loaded_debug_up_frame
        let g:loaded_debug_up_frame = 1
    else
        let g:loaded_debug_up_frame = 0
    endif
    if(&filetype == "log")
        echo "Not implemented yet for this filetype"
    else
        call vimspector#UpFrame()
    endif
endfunction

function! DebugDownFrame()
    if !exists("g:loaded_debug_down_frame") || !g:loaded_debug_down_frame
        let g:loaded_debug_down_frame = 1
    else
        let g:loaded_debug_down_frame = 0
    endif
    if(&filetype == "log")
        echo "Not implemented yet for this filetype"
    else
        call vimspector#DownFrame()
    endif
endfunction

function! DebugJumpToNextBreakpoint()
    if !exists("g:loaded_debug_jump_to_next_breakpoint") || !g:loaded_debug_jump_to_next_breakpoint
        let g:loaded_debug_jump_to_next_breakpoint = 1
    else
        let g:loaded_debug_jump_to_next_breakpoint = 0
    endif
    if(&filetype == "log")
        echo "Not implemented yet for this filetype"
    else
        call vimspector#JumpToNextBreakpoint()
    endif
endfunction

function! DebugJumpToPreviousBreakpoint()
    if !exists("g:loaded_debug_jump_to_previous_breakpoint") || !g:loaded_debug_jump_to_previous_breakpoint
        let g:loaded_debug_jump_to_previous_breakpoint = 1
    else
        let g:loaded_debug_jump_to_previous_breakpoint = 0
    endif
    if(&filetype == "log")
        echo "Not implemented yet for this filetype"
    else
        call vimspector#JumpToPreviousBreakpoint()
    endif
endfunction

function! DebugJumpToPreviousBreakpoint()
    if !exists("g:loaded_debug_jump_to_previous_breakpoint") || !g:loaded_debug_jump_to_previous_breakpoint
        let g:loaded_debug_jump_to_previous_breakpoint = 1
    else
        let g:loaded_debug_jump_to_previous_breakpoint = 0
    endif
    if(&filetype == "log")
        echo "Not implemented yet for this filetype"
    else
        call vimspector#JumpToPreviousBreakpoint()
    endif
endfunction

function! DebugJumpToProgramCounter()
    if !exists("g:loaded_debug_jump_to_program_counter") || !g:loaded_debug_jump_to_program_counter
        let g:loaded_debug_jump_to_program_counter = 1
    else
        let g:loaded_debug_jump_to_program_counter = 0
    endif
    if(&filetype == "log")
        echo "Not implemented yet for this filetype"
    else
        call vimspector#JumpToProgramCounter()
    endif
endfunction

function! DebugBreakPoints()
    if !exists("g:loaded_debug_break_points") || !g:loaded_debug_break_points
        let g:loaded_debug_break_points = 1
    else
        let g:loaded_debug_break_points = 0
    endif
    if(&filetype == "log")
        echo "Not implemented yet for this filetype"
    else
        call vimspector#Breakpoints()
    endif
endfunction

function! DebugDissassemble()
    if !exists("g:loaded_debug_dissassemble") || !g:loaded_debug_dissassemble
        let g:loaded_debug_dissassemble = 1
   else
        let g:loaded_debug_dissassemble = 0
    endif
    if(&filetype == "log")
        echo "Not implemented yet for this filetype"
    else
        call vimspector#Dissassemble()
    endif
endfunction


function! CopyFormatted(line1, line2)
    execute a:line1 . "," . a:line2 . "TOhtml"
    %yank *
    !start /min powershell -noprofile "gcb | scb -as"
    bwipeout!
endfunction

command! -range=% HtmlClip silent call CopyFormatted(<line1>,<line2>)

