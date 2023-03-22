local keyset = vim.keymap.set
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
local opts_silent = { noremap = true, silent = true }

local temp = {}
local KF = require("keyBidingLang")

--local directions = require('hop.hint').HintDirection
--local hop = require('hop')
--Go  To
keyset({ "v", "x" }, "<RightMouse>", "y", opts_silent)
keyset({ "v", "x", "i" }, "<MiddleMouse>", "p", opts_silent)

KF = KF:new("<C-s>")

--git mappings
keyset("n", "<C-G>c", "<cmd>LazyGitCurrentFile<cr>", opts_silent)
keyset("n", "<C-G>l", "<cmd>LazyGit<cr>", opts_silent)
keyset("n", "<C-G>g", ":Git", opts_silent)
keyset("n", "<C-G>d", ":Gdiffsplit<CR>", opts_silent)
keyset("n", "<C-G>h", ":Gdiffsplit", opts_silent)



temp = {
	["<C-G>"] = {
		name = "+Git",
		c = { "<cmd>LazyGitCurrentFile<cr>", "Git Current File" },
		l = { "<cmd>LazyGit<cr>", "Git" },
		g = { ":Git", "Git" },
		d = { ":Gdiffsplit<CR>", "Git Diff" },
		h = { ":Gdiffsplit", "Git Diff hilo" },
	},
}
keyset("n", "gd", "<Plug>(coc-definition)", opts_silent)
keyset("n", "gt", "<Plug>(coc-type-definition)", opts_silent)
keyset("n", "gi", "<Plug>(coc-implementation)", opts_silent)
keyset("n", "gr", "<Plug>(coc-references)", opts_silent)
keyset("n", "gD", "<CMD>lua _G.show_docs()<CR>", opts_silent)
keyset("n", "gm", "<cmd>Man<cr>", opts_silent)
temp = {
	g = {
		name = "+Go To",
		d = { "<Plug>(coc-definition)", "Definition" },
		t = { "<Plug>(coc-type-definition)", "Type Definition" },
		i = { "<Plug>(coc-implementation)", "Implementation" },
		r = { "<Plug>(coc-references)", "References" },
		D = { "<CMD>lua _G.show_docs()<CR>", "Show Docs" },
		m = { "<cmd>Man<cr>", "Show Manual"}
	}
}

vim.g.wk.register(temp,{})

keyset({ "x", "o" }, "cfi", "<Plug>(coc-funcobj-i)", opts_silent)
keyset({ "x", "o" }, "cfa", "<Plug>(coc-funcobj-a)", opts_silent)
keyset({ "x", "o" }, "cci", "<Plug>(coc-classobj-i)", opts_silent)
keyset({ "x", "o" }, "cca", "<Plug>(coc-classobj-a)", opts_silent)

keyset({ "n", "v", "x" }, "<leader>\\", "<cmd>WhichKey<cr>", opts_silent)
keyset({ "n", "v", "x", "i" }, "<C-\\>", "<cmd>WhichKey<cr>", opts_silent)

keyset("n", "<leader>rn", "<Plug>(coc-rename)", opts_silent)
keyset("n", "<leader>rf", "<Plug>(coc-codeaction-refactor)", opts_silent)
keyset({ "x", "n" }, "<leader>f", "<Plug>(coc-format-selected)", opts_silent)
temp = {
	["<leader>"] = {
		r = {
			name = "+Refactor",
			n = { "<Plug>(coc-rename)", "Rename" },
			f = { "<Plug>(coc-codeaction-refactor)", "Refactor" },
		},
		f = { "<Plug>(coc-format-selected)", "Format" },
	},
}
vim.g.wk.register(temp,{})

keyset("n", "<leader>[", "<Plug>(coc-diagnostic-prev)", opts_silent)
keyset("n", "<leader>]", "<Plug>(coc-diagnostic-next)", opts_silent)
keyset("x", "<leader>aa", "<Plug>(coc-codeaction-selected)", opts_silent)
keyset("n", "<leader>aa", "<Plug>(coc-codeaction)", opts_silent)
keyset("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", opts_silent)
keyset("n", "<leader>as", "<Plug>(coc-codeaction-source)", opts_silent)
keyset("n", "<leader>af", "<Plug>(coc-fix-current)", opts_silent)
keyset("n", "<leader>ar", "<Plug>(coc-codeaction-refactor)", opts_silent)
keyset("x", "<leader>ar", "<Plug>(coc-codeaction-refactor-selected)", opts_silent)
keyset("n", "<leader>al", "<Plug>(coc-codelens-action)", opts_silent)

temp = {
	["<leader>"] = {
		a = {
			name = "+Code Action",
			a = { "<Plug>(coc-codeaction)", "Code Action" },
			c = { "<Plug>(coc-codeaction-cursor)", "Code Action Cursor" },
			s = { "<Plug>(coc-codeaction-source)", "Code Action Source" },
			f = { "<Plug>(coc-fix-current)", "Fix Current" },
			r = { "<Plug>(coc-codeaction-refactor)", "Refactor" },
			l = { "<Plug>(coc-codelens-action)", "Code Lens Action" },
		},
	},
}
vim.g.wk.register(temp,{})

keyset("n", "<leader>bb", "<cmd>Buffers<CR>", opts_silent)
keyset("n", "<leader>bn", "<cmd>bnext<CR>", opts_silent)
keyset("n", "<leader>bp", "<cmd>bprevious<CR>", opts_silent)
keyset("n", "<leader>bd", "<cmd>bdelete<CR>", opts_silent)
temp = {
	["<leader>"] = {
		b = {
			name = "+Buffer",
			b = { "<cmd>Buffers<CR>", "Buffers" },
			n = { "<cmd>bnext<CR>", "Next Buffer" },
			p = { "<cmd>bprevious<CR>", "Previous Buffer" },
		},
	},
}
vim.g.wk.register(temp,{})
keyset("n", "\\z", "<cmd>FZF<CR>", opts_silent)
keyset("n", "\\h", "<cmd>History<CR>", opts_silent)
keyset("n", "\\f", "<cmd>Files<CR>", opts_silent)
keyset("n", "\\t", "<cmd>Tags<CR>", opts_silent)
keyset("n", "\\c", "<cmd>Commands<CR>", opts_silent)
keyset("n", "\\m", "<cmd>Marks<CR>", opts_silent)
keyset("n", "\\l", "<cmd>Lines<CR>", opts_silent)
keyset("n", "\\g", "<cmd>Grep<CR>", opts_silent)
keyset({ "n", "x" }, "\\e", "<cmd>NvimTreeToggle<CR>", opts_silent)
keyset("n", "\\r", "<cmd>Rg<CR>", opts_silent)
keyset("n", "\\B", "<cmd>BLines<CR>", opts_silent)
keyset("n", "\\M", "<cmd>Maps<CR>", opts_silent)
keyset("n", "\\C", "<cmd>Colors<CR>", opts_silent)
keyset("n", "\\H", "<cmd>History:<CR>", opts_silent)
temp = {
	["\\"] = {
		name = "+Search",
		z = { "<cmd>FZF<CR>", "FZF" },
		h = { "<cmd>History<CR>", "History" },
		f = { "<cmd>Files<CR>", "Files" },
		t = { "<cmd>Tags<CR>", "Tags" },
		c = { "<cmd>Commands<CR>", "Commands" },
		b = { "<cmd>Buffers<CR>", "Buffers" },
		m = { "<cmd>Marks<CR>", "Marks" },
		l = { "<cmd>Lines<CR>", "Lines" },
		g = { "<cmd>Grep<CR>", "Grep names files" },
		e = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
		r = { "<cmd>Rg<CR>", "Rg into docyment" },
		B = { "<cmd>BLines<CR>", "BLines" },
		M = { "<cmd>Maps<CR>", "Maps" },
		C = { "<cmd>Colors<CR>", "Colors" },
		H = { "<cmd>History:<CR>", "History comands" },
	},
}
vim.g.wk.register(temp,{})

keyset("n", "/d", "<cmd>CocList diagnostics<cr>", opts_silent)
keyset("n", "/e", "<cmd>CocList extensions<cr>", opts_silent)
keyset("n", "/c", "<cmd>CocList commands<cr>", opts_silent)
keyset("n", "/o", "<cmd>CocList outline<cr>", opts_silent)
keyset("n", "/s", "<cmd>CocList -I symbols<cr>", opts_silent)
keyset("n", "/n", "<cmd>CocNext<cr>", opts_silent)
keyset("n", "/p", "<cmd>CocPrev<cr>", opts_silent)
keyset("n", "/r", "<cmd>CocListResume<cr>", opts_silent)

keyset("n", "/i", ":ASToggle<CR>", {})
temp = {
	["/"] = {
		name = "+Coc",
		d = { "<cmd>CocList diagnostics<cr>", "Diagnostics" },
		e = { "<cmd>CocList extensions<cr>", "Extensions" },
		c = { "<cmd>CocList commands<cr>", "Commands" },
		o = { "<cmd>CocList outline<cr>", "Outline" },
		s = { "<cmd>CocList -I symbols<cr>", "Symbols" },
		n = { "<cmd>CocNext<cr>", "Next" },
		p = { "<cmd>CocPrev<cr>", "Prev" },
		r = { "<cmd>CocListResume<cr>", "Resume" },
		i = { ":ASToggle<CR>", "Toggle autosave" },
	},
}
vim.g.wk.register(temp,{})

--navigation of the code
keyset({ "o", "x" }, "<C-X>s", "<cmd>lua require('tsht').nodes()<CR>", opts_silent)
keyset({ "n", "i" }, "<C-X>a", "<cmd>lua require('tsht').move({ side = 'start' })<CR>", opts_silent)

keyset({ "n", "i", "x" }, "<C-X>w", "<cmd>HopWord<CR>", opts_silent)
keyset({ "n", "i", "x" }, "<C-X>v", "<cmd>HopVertical<CR>", opts_silent)
keyset({ "n", "i", "x" }, "<C-X>c", "<cmd>HopChar1<CR>", opts_silent)
keyset({ "n", "i", "x" }, "<C-X>b", "<cmd>HopChar2<CR>", opts_silent)
keyset({ "n", "i", "x" }, "<C-X>A", "<cmd>HopAnywhere<CR>", opts_silent)
keyset({ "n", "i", "x" }, "<C-X>h", "<cmd>HopCurrentLine<CR>", opts_silent)
keyset({ "n", "i", "x" }, "<C-X>p", "<cmd>HopPattern<CR>", opts_silent)

--:NR  - Open the selected region in a new narrowed window
--:NW  - Open the current visual window in a new narrowed window
--:WR  - (In the narrowed window) write the changes back to the original buffer.
--:NRV - Open the narrowed window for the region that was last visually selected.
--:NUD - (In a unified diff) open the selected diff in 2 Narrowed windows
--:NRP - Mark a region for a Multi narrowed window
--:NRM - Create a new Multi narrowed window (after :NRP) - experimental!
--:NRS - Enable Syncing the buffer content back (default on)
--:NRN - Disable Syncing the buffer content back
--:NRL - Reselect the last selected region and open it again in a narrowed window



keyset("n", "<C-X>n", "<cmd>silent! TZNarrow<CR>", opts_silent)
keyset("v", "<C-X>n", "<cmd>'<,'>TZNarrow<CR>", opts_silent)
keyset("n", "<C-X>f", "<cmd>silent! TZFocus<CR>", opts_silent)
keyset("n", "<C-X>o", "<cmd>silent! TZAtaraxis<CR>", opts_silent)

keyset({"n","x","v"}, "<C-X>R", "<cmd>'<,'>NR<CR>", opts_silent)
keyset({"n","x","v"}, "<C-X>V", "<cmd>NRV<CR>", opts_silent)
keyset({"n","x","v"}, "<C-X>D", "<cmd>NUD<CR>", opts_silent)
keyset({"n","x","v"}, "<C-X>P", "<cmd>'<,'>NRP<CR>", opts_silent)
keyset({"n","x","v"}, "<C-X>M", "<cmd>NRM<CR>", opts_silent)
keyset({"n","x","v"}, "<C-X>L", "<cmd>NRL<CR>", opts_silent)

temp = {
	["<C-X>"] = {
		name = "navigation of the code and Show",
		n = { "<cmd>silent! TZNarrow<CR>", "Zen Mode" },
		f = { "<cmd>silent! TZFocus<CR>", "Zen focus Mode" },
		o = { "<cmd>silent! TZAtaraxis<CR>", "Zen Ataraxis Mode" },
		R = { "<cmd>'<,'>NR<CR>", "Region in a new narrowed window" },
		V = { "<cmd>NRV<CR>", "Open the narrowed window for the region that was last visually selected" },
		D = { "<cmd>NUD<CR>", "Open the selected diff in 2 Narrowed windows" },
		P = { "<cmd>'<,'>NRP<CR>", "Mark a region" },
		M = { "<cmd>NRM<CR>", "Multi narrowed window (after :NRP)" },
		L = { "<cmd>NRL<CR>", "Reselect the last selected region" },
		s = { "<cmd>lua require('tsht').nodes()<CR>", "Select content function" },
		a = { "<cmd>lua require('tsht').move({ side = 'start' })<CR>", "Select all function" },
		w = { "<cmd>HopWord<CR>", "HopWord" },
		v = { "<cmd>HopVertical<CR>", "HopVertical" },
		c = { "<cmd>HopChar1<CR>", "HopChar1" },
		b = { "<cmd>HopChar2<CR>", "HopChar2" },
		A = { "<cmd>HopAnywhere<CR>", "HopAnywhere" },
		h = { "<cmd>HopCurrentLine<CR>", "HopCurrentLine" },
		p = { "<cmd>HopPattern<CR>", "HopPattern" },
	},
}
vim.g.wk.register(temp,{})
--window control
keyset({ "n", "x" }, "<C-F>", "<cmd>NvimTreeToggle<CR>", opts_silent)
keyset({ "v", "n", "i", "x" }, "<C-z>", "<Esc>:", opts_silent)
keyset({ "n", "v", "x", "i" }, "<C-c>", "<cmd>yank<CR>", opts_silent)

keyset({"n","t"}, "<C-W>m", "<Cmd>WinShift<CR>", opts_silent)
keyset({"n","t"}, "<C-W><C-Left>", "<Cmd>vertical resize -5<CR>", opts_silent)
keyset({"n","t"}, "<C-W><C-Right>", "<Cmd>vertical resize +5<CR>", opts_silent)
keyset({"n","t"}, "<C-W><C-Up>", "<Cmd>resize -3<CR>", opts_silent)
keyset({"n","t"}, "<C-W><C-Down>", "<Cmd>resize +3<CR>", opts_silent)

keyset({ "n", "v", "i" }, "<C-Q>q", "<cmd>q<CR>", opts_silent)
keyset({ "n", "v", "i" }, "<C-Q>a", "<cmd>qa<CR>", opts_silent)
keyset({ "n", "v", "i" }, "<C-Q>v", "<cmd>VimspectorReset<CR>", opts_silent)

temp = {
	["<C-Q>"] = {
		name = "Close windows",
		q = { "<cmd>q<CR>", "close the window" },
		a = { "<cmd>qa<CR>", "close all the windows" },
		v = { "<cmd>VimspectorReset<CR>", "close Vimspector Reset" },
	}  ,
}

vim.g.wk.register(temp, {})

keyset({ "n", "v" }, "<C-Down>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-Down>"', opts)
keyset({ "n", "v" }, "<C-Up>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-Up>"', opts)
keyset("i", "<C-Right>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<C-Right>"', opts)

keyset("i", "<C-Left>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<C-Left>"', opts)

--autocomplete comands
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
keyset("i", "<C-j>", "<Plug>(coc-snippets-expand-jump)")

keyset("i", "<C-a>", 'copilot#Accept("<CR>")', opts)
keyset("i", "<C-S>s", "copilot#Next()", opts)
keyset("i", "<C-S>c", "copilot#Previous() ", opts)

keyset("v", "<C-S>B", ": call cheat#cheat(\"\", -1, -1, 2, 0, '!')<CR>", opts_silent)
keyset("n", "<C-S>S", ": call cheat#frameworks#autodetect(0) <CR>", opts_silent)

temp = {
	["<C-S>"] = {
		name = "copilot cheat",
		s = { "copilot#Next()", "Copilot Next" },
		c = { "copilot#Previous()", "Copilot previous" },
		a = { "copilot#Accept('<CR>')", "Copilot Accept" },
		M = { ":Cheat ", "get Manual : " },
	},
}


vim.g.wk.register(temp, {})
keyset(
	"i",
	"<C-Space>",
	"coc#pum#visible() ? coc#_select_confirm(): coc#expandableOrJumpable()?"..
	" \"<C-r>= coc#rpc#request('doKeymap',['snippets-expand-jump',''])<CR>\" "..
	": v:lua.check_back_space() ? \"<c-\\>\" : coc#refresh()", opts
)

keyset({"n","o","i","v"}, "<C-T>", "<Cmd>ToggleTerm<CR>", opts_silent)
keyset({"t"}, "<C-T>", "<C-\\><C-n><Cmd>ToggleTerm<CR>", opts_silent)
keyset({"n","o","i","v"}, "<C-O>", "<cmd>Tagbar<CR>", opts_silent)

--vim.keymap.set('', 'f', function()
--  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
--end, {remap=true})
--vim.keymap.set('', 'F', function()
--  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
--end, {remap=true})
--vim.keymap.set('', 't', function()
--  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
--end, {remap=true})
--vim.keymap.set('', 'T', function()
--  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
--end, {remap=true})
