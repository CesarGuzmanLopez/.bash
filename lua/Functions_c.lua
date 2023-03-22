﻿local a = require("functionsKeyBindings")

local M = {}

setmetatable(M, {
	__call = function(cls, ...)
		return cls.new(...)
	end,
})

function M:new()
	self = setmetatable({}, M)
	M.__index = M
	self.__index = M
	self.NamesOfStudio = {}
	return self
end

M.NamesOfStudio = {
	A1 = "Function c 1",
	A2 = "Function c 2",
	A3 = "Function c 3",
	A4 = "Function c 4",
	A5 = "Function c 5",
	A6 = "Function c 6",
	A7 = "Function c 7",
	A8 = "Function c 8",
	A9 = "Function c 9",
	A0 = "Function c 0",
}

M.A0 = function()
	a.A0()
end
M.A1 = function()
  a.A1()
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
	a.A3()
end
M.A4 = function()
	a.A4()
end
M.A5 = function()
	a.A5()
end
M.A6 = function()
	a.A6()
end
M.A7 = function()
	a.A7()
end
M.A8 = function()
	a.A8()
end
M.A9 = function()
	a.A9()
end

M.CompileOnlyCode = function()
	a.CompileOnlyCode()
end

M.Compile = function()
  a.Compile()
end

M.CompileDebug = function()
  a.CompileDebug()
end

M.CompileToTest = function()
  a.CompileToTest()
end

M.DebugAddFunctionBreakpoint = function()
	a.DebugAddFunctionBreakpoint()
end

M.DebugBalloonEval0 = function()
	a.DebugBalloonEval0()
end

M.DebugBalloonEval1 = function()
	a.DebugBalloonEval1()
end

M.DebugBreakPoints = function()
	a.DebugBreakPoints()
end

M.DebugContinue = function()
	a.DebugContinue()
end

M.DebugDissassemble = function()
	a.DebugDissassemble()
end

M.DebugDownFrame = function()
	a.DebugDownFrame()
end

M.DebugGoToCurrentLine = function()
	a.DebugGoToCurrentLine()
end

M.DebugJumpToNextBreakpoint = function()
	a.DebugJumpToNextBreakpoint()
end

M.DebugJumpToPreviousBreakpoint = function()
	a.DebugJumpToPreviousBreakpoint()
end

M.DebugJumpToProgramCounter = function()
	a.DebugJumpToProgramCounter()
end

M.DebugPause = function()
	a.DebugPause()
end

M.DebugRestart = function()
	a.DebugRestart()
end

M.DebugRunToCursor = function()
	a.DebugRunToCursor()
end

M.DebugStepInto = function()
	a.DebugStepInto()
end

M.DebugStepOut = function()
	a.DebugStepOut()
end

M.DebugStepOver = function()
	a.DebugStepOver()
end

M.DebugStop = function()
	a.DebugStop()
end

M.DebugToggleBreakpoint = function()
	a.DebugToggleBreakpoint()
end

M.DebugToggleConditionalBreakpoint = function()
	a.DebugToggleConditionalBreakpoint()
end

M.DebugUpFrame = function()
	a.DebugUpFrame()
end

M.Run = function()
	a.Run()
end

M.RunDebug = function()
	a.RunDebug()
end

M.RunOnlyCode = function()
	a.RunOnlyCode()
end

M.RunTest = function()
	a.RunTest()
end

return M
