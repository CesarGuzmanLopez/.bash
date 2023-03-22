require("auto-save").setup({})
require("nvim-lastplace").setup({})
vim.g.wk = require("which-key")
vim.g.wk.setup({})
require("gitsigns").setup()
require("toggleterm").setup()
require("Comment").setup()
require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
vim.notify = require("notify").setup({
	background_colour = "#1e222a",
})
-- examples for your init.lua
vim.g.copilot_node_command = "~/.nvm/versions/node/v17.9.1/bin/node"
vim.g.copilot_no_tab_map = 1
vim.g.lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
vim.g.lastplace_ignore_buftype = "quickfix,nofile,help"
vim.g.lastplace_open_folds = 0
vim.g.CheatSheetDoNotMap = 1
vim.g.ale_linters_ignore = { "lacheck" }

--require("noice").setup({
--	lsp = {
--		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
--		override = {
--			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--			["vim.lsp.util.stylize_markdown"] = true,
--			["cmp.entry.get_documentation"] = true,
--		},
--	},
--	-- you can enable a preset for easier configuration
--	presets = {
--		bottom_search = true, -- use a classic bottom cmdline for search
--		command_palette = true, -- position the cmdline and popupmenu together
--		long_message_to_split = true, -- long messages will be sent to a split
--		inc_rename = false, -- enables an input dialog for inc-rename.nvim
--		lsp_doc_border = false, -- add a border to hover docs and signature help
--	},
--})

--vim.g.CheatSheetDoNotMap=1
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
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
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
require("gitsigns").setup({
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Actions
		map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
		map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
		map("n", "<leader>hS", gs.stage_buffer)
		map("n", "<leader>hu", gs.undo_stage_hunk)
		map("n", "<leader>hR", gs.reset_buffer)
		map("n", "<leader>hp", gs.preview_hunk)
		map("n", "<leader>hb", function()
			gs.blame_line({ full = true })
		end)
		map("n", "<leader>tb", gs.toggle_current_line_blame)
		map("n", "<leader>hd", gs.diffthis)
		map("n", "<leader>hD", function()
			gs.diffthis("~")
		end)
		map("n", "<leader>td", gs.toggle_deleted)

		vim.api.nvim_set_keymap("n", "<c-x>n", ":silent! TZNarrow<CR>", {})
		vim.api.nvim_set_keymap("v", "<c-x>n", ":'<,'>TZNarrow<CR>", {})
		vim.api.nvim_set_keymap("n", "<c-x>f", ":silent! TZFocus<CR>", {})
		vim.api.nvim_set_keymap("n", "<c-x>o", ":silent! TZAtaraxis<CR>", {})
		-- Text object
		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
})

require("lspconfig").clangd.setup({
	on_attach = on_attach,
})


--vim.api.nvim_create_autocmd('FileType', {
--  pattern = 'sh',
--  callback = function()
--    vim.lsp.start({
--      name = 'bash-language-server',
--      cmd = { 'bash-language-server', 'start' },
--    })
--  end,
--})


vim.g.nrrw_rgn_nomap_nr = 1
vim.g.nrrw_rgn_nomap_Nr = 1

vim.o.timeout = true
vim.o.timeoutlen = 300

vim.g.translator_window_type = "popup"
vim.g.translator_target_lang = 'es'
