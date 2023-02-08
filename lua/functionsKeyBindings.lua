--function! CompileOnlyCode()
--    if !exists("g:loaded_compile_code") || !g:loaded_compile_code
--        let g:loaded_compile_code = 1
--    else
--        let g:loaded_compile_code = 0
--    endif
--    if(&filetype == "java")
--        call CompileJavaCode()
--    elseif(&filetype == "c" || &filetype == "cpp")
--        :CompileCOnly  
--    else
--        echo "Not implemented yet for this filetype"
--    endif
--endfunction
--
--"waht is <SNR> ?
--
--function! RunOnlyCode()
--    if !exists("g:loaded_run_code") || !g:loaded_run_code
--        let g:loaded_run_code = 1
--    else
--        let g:loaded_run_code = 0
--    endif
--    if(&filetype == "java")
--        call RunJavaCode()
--    elseif(&filetype == "c" || &filetype == "cpp")
--        :RunCOnly
--    else
--        echo "Not implemented yet for this filetype"
--    endif
--endfunction
--
--function! Compile()
--    if !exists("g:loaded_compile") || !g:loaded_compile
--        let g:loaded_compile = 1
--    else
--        let g:loaded_compile = 0
--    endif
--    if(&filetype == "java")
--        call CompileJava()
--    else
--        echo "Not implemented yet for this filetype"
--    endif
--endfunction
--
--function! Run()
--    if !exists("g:loaded_run_project") || !g:loaded_run_project
--        let g:loaded_run_project = 1
--    else
--        let g:loaded_run_project = 0
--    endif
--    if(&filetype == "java")
--        call RunJavaProject()
--    else
--        echo "Not implemented yet for this filetype"
--    endif
--endfunction
--
--function! CompileToTest()
--    if !exists("g:loaded_compile_test") || !g:loaded_compile_test
--        let g:loaded_compile_test = 1
--    else
--        let g:loaded_compile_test = 0
--    endif
--    if(&filetype == "java")
--        call CompileJavaTest()
--    else
--        echo "Not implemented yet for this filetype"
--    endif
--endfunction
--
--function! RunTest()
--    if !exists("g:loaded_run_test") || !g:loaded_run_test
--        let g:loaded_run_test = 1
--    else
--        let g:loaded_run_test = 0
--    endif
--    if(&filetype == "java")
--        call JavaTest()
--    else
--        echo "Not implemented yet for this filetype"
--    endif
--endfunction
--
--function! CompileDebug()
--    if !exists("g:loaded_compile_debug") || !g:loaded_compile_debug
--        let g:loaded_compile_debug = 1
--    else
--        let g:loaded_compile_debug = 0
--    endif
--    if(&filetype == "java")
--        call CompileJavaDebug()
--    else
--        echo "Not implemented yet for this filetype"
--    endif
--endfunction
--
--function! RunDebug()
--    if !exists("g:loaded_run_debug") || !g:loaded_run_debug
--        let g:loaded_run_debug = 1
--    else
--        let g:loaded_run_debug = 0
--    endif
--    if(&filetype == "java")
--        call RunJavaDebug()
--    else
--        call vimspector#Launch( v:true )
--    endif
--endfunction
--
--function! DebugContinue()
--    if !exists("g:loaded_debug_continue") || !g:loaded_debug_continue
--        let g:loaded_debug_continue = 1
--    else
--        let g:loaded_debug_continue = 0
--    endif
--    if(&filetype == "log")
--        echo "Not implemented yet for this filetype"
--    else
--        call vimspector#Continue()
--    endif
--endfunction
--
--function! DebugStop()
--    if !exists("g:loaded_debug_stop") || !g:loaded_debug_stop
--        let g:loaded_debug_stop = 1
--    else
--        let g:loaded_debug_stop = 0
--    endif
--    if(&filetype == "log")
--        echo "Not implemented yet for this filetype"
--    else
--        call vimspector#Stop()
--    endif
--endfunction
--
--function! DebugRestart()
--    if !exists("g:loaded_debug_restart") || !g:loaded_debug_restart
--        let g:loaded_debug_restart = 1
--    else
--        let g:loaded_debug_restart = 0
--    endif
--    if(&filetype == "log")
--        echo "Not implemented yet for this filetype"
--    else
--        call vimspector#Restart()
--    endif
--endfunction
--
--
--function! DebugPause()
--    if !exists("g:loaded_debug_pause") || !g:loaded_debug_pause
--        let g:loaded_debug_pause = 1
--    else
--        let g:loaded_debug_pause = 0
--    endif
--    if(&filetype == "log")
--        echo "Not implemented yet for this filetype"
--    else
--        call vimspector#Pause()
--    endif
--endfunction
--
--function! DebugToggleBreakpoint()
--    if !exists("g:loaded_debug_toggle_breakpoint") || !g:loaded_debug_toggle_breakpoint
--        let g:loaded_debug_toggle_breakpoint = 1
--    else
--        let g:loaded_debug_toggle_breakpoint = 0
--        call vimspector#ToggleBreakpoint()
--    endif
--endfunction
--
--function! DebugToggleConditionalBreakpoint()
--    if !exists("g:loaded_debug_toggle_conditional_breakpoint") || !g:loaded_debug_toggle_conditional_breakpoint
--        let g:loaded_debug_toggle_conditional_breakpoint = 1
--    else
--        let g:loaded_debug_toggle_conditional_breakpoint = 0
--    endif
--    if(&filetype == "log")
--        echo "Not implemented yet for this filetype"
--    else
--        call vimspector#ToggleConditionalBreakpoint()
--    endif
--endfunction
--
--function! DebugAddFunctionBreakpoint()
--    if !exists("g:loaded_debug_add_function_breakpoint") || !g:loaded_debug_add_function_breakpoint
--        let g:loaded_debug_add_function_breakpoint = 1
--    else
--        let g:loaded_debug_add_function_breakpoint = 0
--    endif
--    if(&filetype == "log")
--        echo "Not implemented yet for this filetype"
--    else
--        call vimspector#AddFunctionBreakpoint()
--    endif
--endfunction
--
--function! DebugStepOver()
--    if !exists("g:loaded_debug_step_over") || !g:loaded_debug_step_over
--        let g:loaded_debug_step_over = 1
--    else
--        let g:loaded_debug_step_over = 0
--    endif
--    if(&filetype == "log")
--        echo "Not implemented yet for this filetype"
--    else
--        call vimspector#StepOver()
--    endif
--endfunction
--
--function! DebugStepInto()
--    if !exists("g:loaded_debug_step_into") || !g:loaded_debug_step_into
--        let g:loaded_debug_step_into = 1
--    else
--        let g:loaded_debug_step_into = 0
--    endif
--    if(&filetype == "log")
--        echo "Not implemented yet for this filetype"
--    else
--        call vimspector#StepInto()
--    endif
--endfunction
--
--function! DebugStepOut()
--    if !exists("g:loaded_debug_step_out") || !g:loaded_debug_step_out
--        let g:loaded_debug_step_out = 1
--    else
--        let g:loaded_debug_step_out = 0
--    endif
--    if(&filetype == "log")
--        echo "Not implemented yet for this filetype"
--    else
--        call vimspector#StepOut()
--    endif
--endfunction
--
--function! DebugRunToCursor()
--    if !exists("g:loaded_debug_run_to_cursor") || !g:loaded_debug_run_to_cursor
--        let g:loaded_debug_run_to_cursor = 1
--    else
--        let g:loaded_debug_run_to_cursor = 0
--    endif
--    if(&filetype == "log")
--        echo "Not implemented yet for this filetype"
--    else
--        call vimspector#RunToCursor()
--    endif
--endfunction
--
--function! DebugGoToCurrentLine()
--    if !exists("g:loaded_debug_go_to_current_line") || !g:loaded_debug_go_to_current_line
--        let g:loaded_debug_go_to_current_line = 1
--    else
--        let g:loaded_debug_go_to_current_line = 0
--    endif
--    if(&filetype == "log")
--        echo "Not implemented yet for this filetype"
--    
--        call vimspector#GoToCurrentLine()
--    endif
--endfunction
--
--function! DebugBalloonEval0()
--    if !exists("g:loaded_debug_balloon_eval") || !g:loaded_debug_balloon_eval
--        let g:loaded_debug_balloon_eval = 1
--    else
--        let g:loaded_debug_balloon_eval = 0
--    endif
--    if(&filetype == "log")
--        echo "Not implemented yet for this filetype"
--    else
--        call vimspector#BalloonEval(0)
--    endif
--endfunction
--
--function! DebugBalloonEval1()
--    if !exists("g:loaded_debug_balloon_eval") || !g:loaded_debug_balloon_eval
--        let g:loaded_debug_balloon_eval = 1
--    else
--        let g:loaded_debug_balloon_eval = 0
--    endif
--    if(&filetype == "log")
--        echo "Not implemented yet for this filetype"
--    else
--        call vimspector#BalloonEval(1)
--    endif
--endfunction
--
--function! DebugUpFrame()
--    if !exists("g:loaded_debug_up_frame") || !g:loaded_debug_up_frame
--        let g:loaded_debug_up_frame = 1
--    else
--        let g:loaded_debug_up_frame = 0
--    endif
--    if(&filetype == "log")
--        echo "Not implemented yet for this filetype"
--    else
--        call vimspector#UpFrame()
--    endif
--endfunction
--
--function! DebugDownFrame()
--    if !exists("g:loaded_debug_down_frame") || !g:loaded_debug_down_frame
--        let g:loaded_debug_down_frame = 1
--    else
--        let g:loaded_debug_down_frame = 0
--    endif
--    if(&filetype == "log")
--        echo "Not implemented yet for this filetype"
--    else
--        call vimspector#DownFrame()
--    endif
--endfunction
--
--function! DebugJumpToNextBreakpoint()
--    if !exists("g:loaded_debug_jump_to_next_breakpoint") || !g:loaded_debug_jump_to_next_breakpoint
--        let g:loaded_debug_jump_to_next_breakpoint = 1
--    else
--        let g:loaded_debug_jump_to_next_breakpoint = 0
--    endif
--    if(&filetype == "log")
--        echo "Not implemented yet for this filetype"
--    else
--        call vimspector#JumpToNextBreakpoint()
--    endif
--endfunction
--
--function! DebugJumpToPreviousBreakpoint()
--    if !exists("g:loaded_debug_jump_to_previous_breakpoint") || !g:loaded_debug_jump_to_previous_breakpoint
--        let g:loaded_debug_jump_to_previous_breakpoint = 1
--    else
--        let g:loaded_debug_jump_to_previous_breakpoint = 0
--    endif
--    if(&filetype == "log")
--        echo "Not implemented yet for this filetype"
--    else
--        call vimspector#JumpToPreviousBreakpoint()
--    endif
--endfunction
--
--function! DebugJumpToPreviousBreakpoint()
--    if !exists("g:loaded_debug_jump_to_previous_breakpoint") || !g:loaded_debug_jump_to_previous_breakpoint
--        let g:loaded_debug_jump_to_previous_breakpoint = 1
--    else
--        let g:loaded_debug_jump_to_previous_breakpoint = 0
--    endif
--    if(&filetype == "log")
--        echo "Not implemented yet for this filetype"
--    else
--        call vimspector#JumpToPreviousBreakpoint()
--    endif
--endfunction
--
--function! DebugJumpToProgramCounter()
--    if !exists("g:loaded_debug_jump_to_program_counter") || !g:loaded_debug_jump_to_program_counter
--        let g:loaded_debug_jump_to_program_counter = 1
--    else
--        let g:loaded_debug_jump_to_program_counter = 0
--    endif
--    if(&filetype == "log")
--        echo "Not implemented yet for this filetype"
--    else
--        call vimspector#JumpToProgramCounter()
--    endif
--endfunction
--
--function! DebugBreakPoints()
--    if !exists("g:loaded_debug_break_points") || !g:loaded_debug_break_points
--        let g:loaded_debug_break_points = 1
--    else
--        let g:loaded_debug_break_points = 0
--    endif
--    if(&filetype == "log")
--        echo "Not implemented yet for this filetype"
--    else
--        call vimspector#Breakpoints()
--    endif
--endfunction
--
--function! DebugDissassemble()
--    if !exists("g:loaded_debug_dissassemble") || !g:loaded_debug_dissassemble
--        let g:loaded_debug_dissassemble = 1
--   else
--        let g:loaded_debug_dissassemble = 0
--    endif
--    if(&filetype == "log")
--        echo "Not implemented yet for this filetype"
--    else
--        call vimspector#Dissassemble()
--    endif
--endfunction




local M = {}
M.__index = M
setmetatable(M, {
	__call = function(cls, ...)
		return cls.new(...)
	end,
})

function M.new()
	local self = setmetatable({}, M)

	return self
end

M.NamesOfStudio = {
	A1 = "Function 1",
	A2 = "Function 2",
	A3 = "Function 3",
	A4 = "Function 4",
	A5 = "Function 5",
	A6 = "Function 6",
	A7 = "Function 7",
	A8 = "Function 8",
	A9 = "Function 9",
	A0 = "Function 0",
}

M.A0 = function()
	print("Not implemented yet")
end
M.A1 = function()
	print("Not implemented yet")
end
M.GetMode = function()
	return vim.api.nvim_get_mode()["mode"]
end

M.A2 = function()
	-- local mode = M.GetMode()
	-- if(mode == "i") then
	-- 	vim.api.nvim_input("<Esc>i 'Hello World' ")
	-- elseif(mode == "n") then
	-- 	vim.api.nvim_input("i nomrmal mode")
	-- elseif(mode == "v") then
	-- 	vim.api.nvim_input("<Esc>i visual mode")
	-- elseif(mode == "V") then
	-- 	vim.api.nvim_input("<Esc>i visual line mode")
	-- elseif(mode == "") then
	-- 	vim.api.nvim_input("<Esc>i visual block mode")
	-- elseif(mode == "t") then
	-- 	vim.api.nvim_input("<Esc>i terminal mode")
	-- elseif(mode == "c") then
	-- 	vim.api.nvim_input("i<Esc> command mode")
	-- elseif(mode == "s") then
	-- 	vim.api.nvim_input("i<Esc> select mode")
	-- elseif(mode == "S") then
	-- 	vim.api.nvim_input("<Esc>i select line mode")
	-- elseif(mode == "") then
	-- 	vim.api.nvim_input("<Esc>i select block mode")
	-- ent d
end
M.A3 = function()
	print("Not implemented yet")
end
M.A4 = function()
	print("Not implemented yet")
end
M.A5 = function()
	print("Not implemented yet")
end
M.A6 = function()
	print("Not implemented yet")
end
M.A7 = function()
	print("Not implemented yet")
end
M.A8 = function()
	print("Not implemented yet")
end
M.A9 = function()
	print("Not implemented yet")
end

M.CompileOnlyCode = function()
	print("Not implemented yet")
end

M.Compile = function()
	print("Not implemented yet")
end

M.CompileDebug = function()
	print("Not implemented yet")
end

M.CompileToTest = function()
	print("Not implemented yet")
end


M.DebugAddFunctionBreakpoint = function()
	vim.cmd[[ call vimspector#AddFunctionBreakpoint()]]
end

M.DebugBalloonEval0 = function()
	print("Not implemented yet")
end

M.DebugBalloonEval1 = function()
	print("Not implemented yet")
end

M.DebugBreakPoints = function()
	print("Not implemented yet")
end

M.DebugContinue = function()
	print("Not implemented yet")
end

M.DebugDissassemble = function()
	print("Not implemented yet")
end

M.DebugDownFrame = function()
	print("Not implemented yet")
end

M.DebugGoToCurrentLine = function()
	print("Not implemented yet")
end

M.DebugJumpToNextBreakpoint = function() end

M.DebugJumpToPreviousBreakpoint = function() 
	print("Not implemented yet")
end

M.DebugJumpToProgramCounter = function() end

M.DebugPause = function() 
	print("Not implemented yet")
end

M.DebugRestart = function()
	print("Not implemented yet")
end

M.DebugRunToCursor = function()
	print("Not implemented yet")
end

M.DebugStepInto = function()
	print("Not implemented yet")
end

M.DebugStepOut = function()
	print("Not implemented yet")
end

M.DebugStepOver = function()
	print("Not implemented yet")
end
--lua Class
M.DebugStop = function()
	vim.cmd[[call vimspector#Stop()]]
end

M.DebugToggleBreakpoint = function()
	print("Not implemented yet")
end

M.DebugToggleConditionalBreakpoint = function() 
	print("Not implemented yet")
end

M.DebugUpFrame = function()
	print("Not implemented yet")
end

M.Run = function()
	print("Not implemented yet")
end

M.RunDebug = function()
	vim.cmd[[call vimspector#Launch()]]
end

M.RunOnlyCode = function()
	vim.cmd[[call vimspector#Continue()]]
end

M.RunTest = function()
	print("Not implemented yet")
end

return M
