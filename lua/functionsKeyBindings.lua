
local M = {}
M.A0 = function() end
M.A1 = function()
	if(mode == "i") then
		vim.api.nvim_input("")
	end
end


M.GetMode = function ()
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

M.A3 = function() end
M.A4 = function() end
M.A5 = function() end
M.A6 = function() end
M.A7 = function() end
M.A8 = function() end
M.A9 = function() end



M.__index = M
setmetatable(M, {
	__call = function(cls, ...)
	  return cls.new(...)
	end,
})
function M.new()
	local self = setmetatable({}, M)
	
	self.NameFileFunction = "functions_"..vim.bo.filetype
	vim.api.nvim_create_autocmd("WinEnter",{	
		callback = function ()
			self.NameFileFunction = "functions_"..vim.bo.filetype
			self.F = require(self.NameFileFunction)
	end,
	})
	return self
end

M.CompileOnlyCode = function() 
	F.CompileOnlyCode()
end

M.Compile = function() 
	F.Compile()
end

M.CompileDebug = function() end

M.CompileToTest = function() end

M.CopyFormatted = function(line1, line2) end

M.DebugAddFunctionBreakpoint = function() end

M.DebugBalloonEval0 = function() end

M.DebugBalloonEval1 = function() end

M.DebugBreakPoints = function() end

M.DebugContinue = function() end

M.DebugDissassemble = function() end

M.DebugDownFrame = function() end

M.DebugGoToCurrentLine = function() end

M.DebugJumpToNextBreakpoint = function() end

M.DebugJumpToPreviousBreakpoint = function() end

M.DebugJumpToProgramCounter = function() end

M.DebugPause = function() end

M.DebugRestart = function() end

M.DebugRunToCursor = function() end

M.DebugStepInto = function() end

M.DebugStepOut = function() end

M.DebugStepOver = function() end
--lua Class
M.DebugStop = function() end

M.DebugToggleBreakpoint = function() end

M.DebugToggleConditionalBreakpoint = function() end

M.DebugUpFrame = function() end

M.Run = function() end

M.RunDebug = function() end

M.RunOnlyCode = function() end

M.RunTest = function() end

return M
