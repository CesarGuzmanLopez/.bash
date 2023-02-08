local M = {}
M.__index = M

setmetatable(M, {
	__call = function(cls, ...)
		return cls.new(...)
	end,
})

function M.new(...)
	local args = { ... }
	local self = setmetatable({}, M)
	self.NameFileFunction = "functions_" .. vim.bo.filetype
	self.Leader = args[2]
	self.KF = {}
	vim.api.nvim_create_autocmd("BufRead,BufEnter", {
		callback = function()
			self.NameFileFunction = "functions_" .. vim.bo.filetype
		local status = pcall(require, self.NameFileFunction)
			if status then
				self.KF = require(self.NameFileFunction)
				self.name = "+Functions_" .. vim.bo.filetype
			else
				self.name = "+Functions_General"
				self.KF = require("functionsKeyBindings")
			end
			M.register(self)
		end,
	})
	return self
end

function M.register(self)
	local opts = {
		mode = { "n", "v", "i", "x"}, -- NORMAL mode
		-- prefix: use "<leader>f" for example for mapping everything related to finding files
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = false, -- use `nowait` when creating keymaps
   }
	local temp = {
		[self.Leader] = {
			name = self.name,
			["0"] = { self.KF.A0, self.KF.NamesOfStudio.A0 },
			["1"] = { self.KF.A1, self.KF.NamesOfStudio.A1 },
			["2"] = { self.KF.A2, self.KF.NamesOfStudio.A2 },
			["3"] = { self.KF.A3, self.KF.NamesOfStudio.A3 },
			["4"] = { self.KF.A4, self.KF.NamesOfStudio.A4 },
			["5"] = { self.KF.A5, self.KF.NamesOfStudio.A5 },
			["6"] = { self.KF.A6, self.KF.NamesOfStudio.A6 },
			["7"] = { self.KF.A7, self.KF.NamesOfStudio.A7 },
			["8"] = { self.KF.A8, self.KF.NamesOfStudio.A8 },
			["9"] = { self.KF.A9, self.KF.NamesOfStudio.A9 }
		}
	}
	vim.g.wk.register(temp, opts)
    --Compile
    --CompileDebug
    --CompileOnlyCode
    --CompileToTest
    --CopyFormatted
    --DebugAddFunctionBreakpoint
    --DebugBalloonEval0
    --DebugBalloonEval1
    --DebugBreakPoints
    --DebugContinue
    --DebugDissassemble
    --DebugDownFrame
    --DebugGoToCurrentLine
    --DebugJumpToNextBreakpoint
    --DebugJumpToPreviousBreakpoint
    --DebugJumpToProgramCounter
    --DebugPause
    --DebugRestart
    --DebugRunToCursor
    --DebugStepInto
    --DebugStepOut
    --DebugStepOver
    --DebugStop
    --DebugToggleBreakpoint
    --DebugToggleConditionalBreakpoint
    --DebugUpFrame

	--RunDebug
   local temp = {
		["<F2>"] = { self.KF.Compile,"Compile" },

		["<F4>"] = {
			name = "+Run",
			["r"] = { self.KF.Run, "Run Project" },
			["t"] = { self.KF.RunTest, "RunToTest" },
			["c"] = { self.KF.RunOnlyCode, "RunOnlyCode" },
			["d"] = { self.KF.RunDebug, "RunDebug"}
		},

		["<F5>"] = { self.KF.Run, "Run Project" },
		["<F6>"] = { self.KF.RunToTest, "Run RunToTest" },
 		["<F7>"] = {
			name = "+Debug",
			["r"] = { self.KF.RunDebug, "Run" },
		},
	}
	vim.g.wk.register(temp, opts)
end

return M
