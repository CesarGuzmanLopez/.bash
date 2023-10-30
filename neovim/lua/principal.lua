require("auto-save").setup({})
require("nvim-lastplace").setup({})
vim.g.wk = require("which-key")
vim.g.wk.setup({})
require("toggleterm").setup()
require("Comment").setup()
require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
--vim.notify = require("notify").setup({
---	background_colour = "#1e222a",
--})
-- examples for your init.lua
vim.g.copilot_node_command = "~/.nvm/versions/node/v17.9.1/bin/node"
vim.g.copilot_no_tab_map = 1
vim.g.lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
vim.g.lastplace_ignore_buftype = "quickfix,nofile,help"
vim.g.lastplace_open_folds = 0
vim.g.CheatSheetDoNotMap = 1
vim.g.ale_linters_ignore = { "lacheck" }
local api = vim.api


-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
	command = "silent! silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }",
	group = yankGrp,
})

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
	},
	renderer = {
		group_empty = true,
		highlight_opened_files = "all",
		highlight_modified = "all",
	},
	filters = {
		dotfiles = false,
	},
})
require("incline").setup({
	debounce_threshold = {
		falling = 50,
		rising = 10,
	},
	hide = {
		cursorline = true,
		focused_win = true,
		only_win = true,
	},
	highlight = {
		groups = {
			InclineNormal = {
				default = true,
				group = "NormalFloat",
			},
			InclineNormalNC = {
				default = true,
				group = "NormalFloat",
			},
		},
	},
	ignore = {
		buftypes = "special",
		filetypes = {},
		floating_wins = true,
		unlisted_buffers = true,
		wintypes = "special",
	},
	render = "basic",
	window = {

		margin = {
			horizontal = 0,
			vertical = 0,
		},
		options = {
			signcolumn = "no",
			wrap = false,
		},
		padding = 1,
		padding_char = " ",
		placement = {
			horizontal = "right",
			vertical = "top",
		},
		width = "fit",
		winhighlight = {
			active = {
				EndOfBuffer = "None",
				Normal = "InclineNormal",
				Search = "None",
			},
			inactive = {
				EndOfBuffer = "None",
				Normal = "InclineNormalNC",
				Search = "None",
			},
		},
		zindex = 50,
	},
})

require("lspconfig").clangd.setup({
	on_attach = on_attach,
})

require("mason").setup()
require("mason-lspconfig").setup()

vim.g.nrrw_rgn_nomap_nr = 1
vim.g.nrrw_rgn_nomap_Nr = 1

vim.o.timeout = true
vim.o.timeoutlen = 300

vim.g.translator_window_type = "popup"
vim.g.translator_target_lang = 'es'

vim.cmd[[
	au BufNewFile,BufRead *.cu set ft=cuda
	au BufNewFile,BufRead *.cuh set ft=cuda
]]
