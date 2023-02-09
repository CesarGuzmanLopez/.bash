local M = {}

M.__index = M
setmetatable(M, {
	__call = function(cls, ...)
		return cls.new(...)
	end,
})

function M:new()
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
	vim.cmd([[ call vimspector#AddFunctionBreakpoint()]])
end

M.DebugBalloonEval0 = function()
	vim.cmd([[ call vimspector#BalloonEval(0)]])
end

M.DebugBalloonEval1 = function()
	vim.cmd([[ call vimspector#BalloonEval(1)]])
end

M.DebugBreakPoints = function()
	vim.cmd([[ call vimspector#Breakpoints()]])
end

M.DebugContinue = function()
	vim.cmd([[ call vimspector#Continue()]])
end

M.DebugDissassemble = function()
	vim.cmd([[ call vimspector#Dissassemble()]])
end

M.DebugDownFrame = function()
	vim.cmd([[ call vimspector#DownFrame()]])
end

M.DebugGoToCurrentLine = function()
	vim.cmd([[ call vimspector#GoToCurrentLine()]])
end

M.DebugJumpToNextBreakpoint = function()
	vim.cmd([[ call vimspector#JumpToNextBreakpoint()]])
end

M.DebugJumpToPreviousBreakpoint = function()
	vim.cmd([[ call vimspector#JumpToPreviousBreakpoint()]])
end

M.DebugJumpToProgramCounter = function()
	vim.cmd([[ call vimspector#JumpToProgramCounter()]])
end

M.DebugPause = function()
	vim.cmd([[ call vimspector#Pause()]])
end

M.DebugRestart = function()
	vim.cmd([[ call vimspector#Restart()]])
end

M.DebugRunToCursor = function()
	vim.cmd([[ call vimspector#RunToCursor()]])
end

M.DebugStepInto = function()
	vim.cmd([[ call vimspector#StepInto()]])
end

M.DebugStepOut = function()
	vim.cmd([[ call vimspector#StepOut()]])
end

M.DebugStepOver = function()
	vim.cmd([[ call vimspector#StepOver()]])
end

M.DebugStop = function()
	vim.cmd([[ call vimspector#Stop()]])
end

M.DebugToggleBreakpoint = function()
	vim.cmd([[ call vimspector#ToggleBreakpoint()]])
end

M.DebugToggleConditionalBreakpoint = function()
	vim.cmd([[ call vimspector#ToggleConditionalBreakpoint()]])
end

M.DebugUpFrame = function()
	vim.cmd([[ call vimspector#UpFrame()]])
end

M.Run = function()
	print("Not implemented yet")
end

M.RunDebug = function()
	vim.cmd([[call vimspector#Launch()]])
end

M.RunOnlyCode = function()
	vim.cmd([[call vimspector#Continue()]])
end

M.RunTest = function()
	print("Not implemented yet")
end

return M
