
local M = {}
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
			print(self.NameFileFunction)
	end,
	})
	return self
end

M.CompileOnlyCode = function() end

M.Compile = function() end

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
