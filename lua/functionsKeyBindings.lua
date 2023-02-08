local M = {}
M.A0 = function()
	vim.api.nvim_input("echo not implemented yet")
end
M.A1 = function()
	vim.api.nvim_input("echo not implemented yet")
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
	-- end
end
M.A3 = function()
	vim.api.nvim_input("echo not implemented yet")
end
M.A4 = function()
	vim.api.nvim_input("echo not implemented yet")
end
M.A5 = function()
	vim.api.nvim_input("echo not implemented yet")
end
M.A6 = function()
	vim.api.nvim_input("echo not implemented yet")
end
M.A7 = function()
	vim.api.nvim_input("echo not implemented yet")
end
M.A8 = function()
	vim.api.nvim_input("echo not implemented yet")
end
M.A9 = function()
	vim.api.nvim_input("echo not implemented yet")
end

M.CompileOnlyCode = function()
	vim.api.nvim_input("echo not implemented yet")
end

M.Compile = function()
	vim.api.nvim_input("echo not implemented yet")
end

M.CompileDebug = function()
	vim.api.nvim_input("echo not implemented yet")
end

M.CompileToTest = function()
	vim.api.nvim_input("echo not implemented yet")
end

M.CopyFormatted = function(line1, line2) end

M.DebugAddFunctionBreakpoint = function()
	vim.api.nvim_input("echo not implemented yet")
end

M.DebugBalloonEval0 = function()
	vim.api.nvim_input("echo not implemented yet")
end

M.DebugBalloonEval1 = function()
	vim.api.nvim_input("echo not implemented yet")
end

M.DebugBreakPoints = function()
	vim.api.nvim_input("echo not implemented yet")
end

M.DebugContinue = function()
	vim.api.nvim_input("echo not implemented yet")
end

M.DebugDissassemble = function()
	vim.api.nvim_input("echo not implemented yet")
end

M.DebugDownFrame = function()
	vim.api.nvim_input("echo not implemented yet")
end

M.DebugGoToCurrentLine = function()
	vim.api.nvim_input("echo not implemented yet")
end

M.DebugJumpToNextBreakpoint = function() end

Mvim.api.nvim_input("echo not implemented yet").DebugJumpToPreviousBreakpoint = function() end

M.DebugJumpToProgramCounter = function() end

Mvim.api.nvim_input("echo not implemented yet").DebugPause = function() end

M.DebugRestart = function()
	vim.api.nvim_input("echo not implemented yet")
end

M.DebugRunToCursor = function()
	vim.api.nvim_input("echo not implemented yet")
end

M.DebugStepInto = function()
	vim.api.nvim_input("echo not implemented yet")
end

M.DebugStepOut = function()
	vim.api.nvim_input("echo not implemented yet")
end

M.DebugStepOver = function()
	vim.api.nvim_input("echo not implemented yet")
end
--lua Class
M.DebugStop = function()
	vim.api.nvim_input("echo not implemented yet")
end

M.DebugToggleBreakpoint = function()
	vim.api.nvim_input("echo not implemented yet")
end

M.DebugToggleConditionalBreakpoint = function() end

Mvim.api.nvim_input("echo not implemented yet").DebugUpFrame = function() end

M.Run = function()
	vim.api.nvim_input("echo not implemented yet")
end

M.RunDebug = function()
	vim.api.nvim_input("echo not implemented yet")
end

M.RunOnlyCode = function()
	vim.api.nvim_input("echo not implemented yet")
end

M.RunTest = function()
	vim.api.nvim_input("echo not implemented yet")
end

return M
