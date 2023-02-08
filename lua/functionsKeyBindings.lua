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

M.CopyFormatted = function(line1, line2) end

M.DebugAddFunctionBreakpoint = function()
	print("Not implemented yet")
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
	print("Not implemented yet")
end

M.DebugToggleBreakpoint = function()
	print("Not implemented yet")
end

M.DebugToggleConditionalBreakpoint = function() end

M.DebugUpFrame = function()
	print("Not implemented yet")
end

M.Run = function()
	print("Not implemented yet")
end

M.RunDebug = function()
	print("Not implemented yet")
end

M.RunOnlyCode = function()
	print("Not implemented yet")
end

M.RunTest = function()
	print("Not implemented yet")
end

return M
