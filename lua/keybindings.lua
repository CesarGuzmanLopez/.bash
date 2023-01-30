local keyset = vim.keymap.set
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
local opts_silent = { noremap = true, silent = true }

local temp = {}
--local directions = require('hop.hint').HintDirection
--local hop = require('hop')
--Go  To

keyset({ "n", "v", "x", "i" }, "<RightMouse>", "", opts_silent)
keyset({ "n", "v", "x", "i" }, "<RightMouse>", "", opts_silent)

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
			d = { "<cmd>bdelete<CR>", "Delete Buffer" },
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


keyset("n", "/d", "<cmd><C-u>CocList diagnostics<cr>", opts_silent)
keyset("n", "/e", "<cmd><C-u>CocList extensions<cr>", opts_silent)
keyset("n", "/c", "<cmd><C-u>CocList commands<cr>", opts_silent)
keyset("n", "/o", "<cmd><C-u>CocList outline<cr>", opts_silent)
keyset("n", "/s", "<cmd><C-u>CocList -I symbols<cr>", opts_silent)
keyset("n", "/n", "<cmd><C-u>CocNext<cr>", opts_silent)
keyset("n", "/p", "<cmd><C-u>CocPrev<cr>", opts_silent)
keyset("n", "/r", "<cmd><C-u>CocListResume<cr>", opts_silent)

temp = {
	["/"] = {
		name = "+Coc",
		d = { "<cmd><C-u>CocList diagnostics<cr>", "Diagnostics" },
		e = { "<cmd><C-u>CocList extensions<cr>", "Extensions" },
		c = { "<cmd><C-u>CocList commands<cr>", "Commands" },
		o = { "<cmd><C-u>CocList outline<cr>", "Outline" },
		s = { "<cmd><C-u>CocList -I symbols<cr>", "Symbols" },
		n = { "<cmd><C-u>CocNext<cr>", "Next" },
		p = { "<cmd><C-u>CocPrev<cr>", "Prev" },
		r = { "<cmd><C-u>CocListResume<cr>", "Resume" },
	},
}

--personalice tareas
keyset(
	"n",
	"<C-f>i",
	"<cmd>exec '!inkscape-figures edit \"'.b:vimtex.root.'/figures/\" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>",
	opts_silent
)

keyset(
	"i",
	"<C-f>i",
	"<Esc>: silent exec '.!inkscape-figures create \"'.getline('.').'\" \"'.b:vimtex.root.'/figures/\"'<CR><CR>:w<CR>",
	opts_silent
)

temp = {
	["<C-f>"] = {
		name = "+Functions_Languages",
	},
}
vim.g.wk.register(temp,{})

--navigation of the code
keyset({ "o", "x" }, "<C-x>s", "<cmd>lua require('tsht').nodes()<CR>", opts_silent)
keyset({ "n", "i" }, "<C-x>a", "<cmd>lua require('tsht').move({ side = 'start' })<CR>", opts_silent)

keyset({ "n", "i", "x" }, "<C-x>w", "<cmd>HopWord<CR>", opts_silent)
keyset({ "n", "i", "x" }, "<C-x>v", "<cmd>HopVertical<CR>", opts_silent)
keyset({ "n", "i", "x" }, "<C-x>c", "<cmd>HopChar1<CR>", opts_silent)
keyset({ "n", "i", "x" }, "<C-x>b", "<cmd>HopChar2<CR>", opts_silent)
keyset({ "n", "i", "x" }, "<C-x>A", "<cmd>HopAnywhere<CR>", opts_silent)
keyset({ "n", "i", "x" }, "<C-x>h", "<cmd>HopCurrentLine<CR>", opts_silent)
keyset({ "n", "i", "x" }, "<C-x>p", "<cmd>HopPattern<CR>", opts_silent)
keyset("n", "<C-x>n", ":silent! TZNarrow<CR>", opts_silent)
keyset("v", "<C-x>n", ":'<,'>TZNarrow<CR>", opts_silent)
keyset("n", "<C-x>f", ":silent! TZFocus<CR>", opts_silent)
keyset("n", "<C-x>o", ":silent! TZAtaraxis<CR>", opts_silent)

temp = {
	["<C-x>"] = {
		name = "navigation of the code and Show",
		a = { "<cmd>lua require('tsht').nodes()<CR>", "move index function" },
		w = { "<cmd>lua require('tsht').move({ side = 'start' })<CR>", "Move word" },
		v = { "<cmd>HopVertical<CR>", "Hop Vertical" },
		c = { "<cmd>HopChar1<CR>", "Hop Char1" },
		b = { "<cmd>HopChar2<CR>", "Hop Char2" },
		A = { "<cmd>HopAnywhere<CR>", "Hop Anywhere" },
		h = { "<cmd>HopCurrentLine<CR>", "Hop Current Line" },
		p = { "<cmd>HopPattern<CR>", "Hop Pattern" },
		n = { ":silent! TZNarrow<CR>", "Zen Mode" },
		f = { ":silent! TZFocus<CR>", "Zen focus Mode" },
		o = { ":silent! TZAtaraxis<CR>", "Zen Ataraxis Mode" },
	},
}
vim.g.wk.register(temp,{})
--control of the functions language
keyset("n", "<leader>1", "CompileDebug()", opts)
keyset("n", "<leader>2", "Run()", opts)
keyset("n", "<leader>&", "CompileOnlyCode()", opts)
keyset("n", "<leader>7", "RunOnlyCode()", opts)
keyset("n", "<leader>t", "RunTest()", opts)

--window control
keyset({ "n", "v", "x" }, "<C-s>", "<cmd>update<CR>", opts_silent)
keyset({ "n", "x" }, "<C-o>", "<cmd>NvimTreeToggle<CR>", opts_silent)
keyset({ "v", "n", "i", "x" }, "<C-z>", "<Esc>:", opts_silent)
keyset({ "n", "v", "x", "i" }, "<C-c>", "<cmd>yank<CR>", opts_silent)

keyset({"n","t"}, "<C-w>m", "<Cmd>WinShift<CR>", opts_silent)
keyset({"n","t"}, "<C-w><C-Left>", "<Cmd>vertical resize -5<CR>", opts_silent)
keyset({"n","t"}, "<C-w><C-Right>", "<Cmd>vertical resize +5<CR>", opts_silent)
keyset({"n","t"}, "<C-w><C-Up>", "<Cmd>resize -5<CR>", opts_silent)
keyset({"n","t"}, "<C-w><C-Down>", "<Cmd>resize +5<CR>", opts_silent)

keyset({ "n", "v", "i" }, "<C-q>q", "<cmd>q<CR>", opts_silent)
keyset({ "n", "v", "i" }, "<C-q>a", "<cmd>qa<CR>", opts_silent)
keyset({ "n", "v", "i" }, "<C-q>v", "<cmd>VimspectorReset<CR>", opts_silent)
temp = {
	["<C-q>"] = {
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
keyset("i", "<C-s>s", "copilot#Next()", opts)
keyset("i", "<C-s>c", "copilot#Previous() ", opts)
keyset(
	"i",
	"<C-Space>",
	"coc#pum#visible() ? coc#r_select_confirm() : coc#expandableOrJumpable() ? \"<C-r> = coc#rpc#request('doKeymap',\
  ['snippets-expand-jump',''])<CR>\" : v:lua.check_back_space() ? \"<c-\\>\" : coc#refresh()",
	opts
)
keyset({"n","o","i","v"}, "<C-t>", "<Cmd>ToggleTerm<CR>", opts_silent)
keyset({"t"}, "<C-t>", "<C-\\><C-n><Cmd>ToggleTerm<CR>", opts_silent)

