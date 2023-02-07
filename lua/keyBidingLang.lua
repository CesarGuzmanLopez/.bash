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
	local temp = {}
	vim.api.nvim_create_autocmd("BufRead,BufEnter", {
		callback = function()
			self.NameFileFunction = "functions_" .. vim.bo.filetype
			local status = pcall(require, self.NameFileFunction)
			if status then
				self.KF = require(self.NameFileFunction)
				temp = {
					["<C-P>"] = {
						name = "+Functions_" .. vim.bo.filetype
					},
				}
			else
				temp = {
					["<C-P>"] = {
						name = "+Functions_General"
					},
				}
				self.KF = require("functionsKeyBindings")

			end
			vim.g.wk.register(temp, {})
			M.register()
		end,
	})
	return self
end

function M.register()
	local opts = {
		mode = "n", -- NORMAL mode
		-- prefix: use "<leader>f" for example for mapping everything related to finding files
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = false, -- use `nowait` when creating keymaps
	}
end

return M
