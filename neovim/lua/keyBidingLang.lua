local M = {}
M.__index = M

setmetatable(M, {
	__call = function(cls, ...)
		return cls.new(...)
	end,
})

RegisterLanguage = {}
function M.new(...)
	local args = { ... }
	local self = setmetatable({}, M)
	self.Leader = args[2]
	self.KF = {}
	self.NameFileFunction = "Functions_" .. vim.bo.filetype
	vim.api.nvim_create_autocmd(
		{ "WinEnter", "BufWinEnter", "BufEnter", "FileType", "VimEnter", "BufLeave", "BufWinLeave", "InsertEnter" },
		{
			callback = function()
				if vim.bo.filetype == "help" or vim.bo.filetype == "" or vim.bo.filetype == nil then
					return
				end
				self.NameFileFunction = "Functions_" .. vim.bo.filetype
				if RegisterLanguage[vim.bo.filetype] == nil then
					local ok, mod = pcall(require, self.NameFileFunction)
					if ok then
						RegisterLanguage[vim.bo.filetype] = mod
					elseif vim.bo.filetype ~= "" and vim.bo.filetype ~= nil then
						RegisterLanguage[vim.bo.filetype] = nil
					end
				end
				if RegisterLanguage[vim.bo.filetype] ~= nil then
					self.KF = RegisterLanguage[vim.bo.filetype]
				else
					self.KF = require("functionsKeyBindings")
				end
				M.register(self)
			end,
		}
	)
	return self
end

function M.Getlanguage()
   if vim.bo.filetype == "help" or vim.bo.filetype == "" or vim.bo.filetype == nil then
	return
   end
   if(vim.bo.filetype == "cpp" or vim.bo.filetype == "c" or vim.bo.filetype == "c++" or vim.bo.filetype == "c++") then
	return "cpp"
   end
   if(vim.bo.filetype == "python" or vim.bo.filetype == "py") then
	   return "python"
   end
   if(vim.bo.filetype == "lua") then
	   return "lua"
   end
   if(vim.bo.filetype == "java") then
		return "java"
   end
   if(vim.bo.filetype == "javascript") then
	return "javascript"
   end


   if(vim.bo.filetype == "typescript") then
   	return "typescript"
   end


	return vim.bo.filetype
end

function M.register(self)
	local opts = {
		mode = { "n", "v", "i", "x" }, -- NORMAL mode
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
			["9"] = { self.KF.A9, self.KF.NamesOfStudio.A9 },
		},
	}
	vim.g.wk.register(temp, opts)
	temp = {
		["<F2>"] = { self.KF.Compile, "Compile" },
		["<F3>"] = {
			name = "+Compile",
			["c"] = { self.KF.Compile, "Compile" },
			["t"] = { self.KF.CompileToTest, "Compile Test" },
			["o"] = { self.KF.CompileOnlyCode, "Compile Code" },
			["d"] = { self.KF.CompileDebug, "Compile Debug" },
		},
		["<F4>"] = { self.KF.RunTest, "Run Tests" },
		["<F5>"] = { self.KF.Run, "Run Project" },
		["<F6>"] = {
			name = "+Run",
			["r"] = { self.KF.Run, "Run Project" },
			["t"] = { self.KF.RunTest, "Run Test" },
			["c"] = { self.KF.RunOnlyCode, "Run Code" },
			["d"] = { self.KF.RunDebug, "Run Debug" },
		},
		["<F7>"] = {
			name = "+Debug",
			["<F5>"] = { self.KF.RunDebug, "Run Debug" },
			["C"] = { self.KF.CompileDebug, "Compile Debug" },
			["f"] = { self.KF.DebugAddFunctionBreakpoint, "Add function Break point" },
			["z0"] = { self.KF.DebugBalloonEval0, "Add ballon 0" },
			["z1"] = { self.KF.DebugBalloonEval1, "Add ballon 1" },
			["b"] = { self.KF.DebugBreakPoints, "Break Points" },
			["c"] = { self.KF.DebugContinue, "Continue" },
			["d"] = { self.KF.DebugDissassemble, "Dissassemble" },
			["<Down>"] = { self.KF.DebugDownFrame, "Down Frame" },
			["g"] = { self.KF.DebugGoToCurrentLine, "Go To Current Line" },
			["j"] = { self.KF.DebugJumpToNextBreakpoint, "Jump To Next Breakpoint" },
			["k"] = { self.KF.DebugJumpToPreviousBreakpoint, "Jump To Previous Breakpoint" },
			["J"] = { self.KF.DebugJumpToProgramCounter, "Jump To Program Counter" },
			["p"] = { self.KF.DebugPause, "Pause" },
			["r"] = { self.KF.DebugRestart, "Restart" },
			["R"] = { self.KF.DebugRunToCursor, "Run To Cursor" },
			["si"] = { self.KF.DebugStepInto, "Step Into" },
			["so"] = { self.KF.DebugStepOut, "Step Out" },
			["sv"] = { self.KF.DebugStepOver, "Step Over" },
			["st"] = { self.KF.DebugStop, "Stop" },
			["t"] = { self.KF.DebugToggleBreakpoint, "Toggle Breakpoint" },
			["T"] = { self.KF.DebugToggleConditionalBreakpoint, "Toggle Conditional Breakpoint" },
			["<Up>"] = { self.KF.DebugUpFrame, "Up Frame" },
		},
	}
	vim.g.wk.register(temp, opts)
end
return M
