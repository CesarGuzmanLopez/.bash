﻿local keyset = vim.keymap.set
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
local opts_silent = { noremap = true, silent = true }

--local directions = require('hop.hint').HintDirection
--local hop = require('hop')

keyset("n", "gd", "<Plug>(coc-definition)", opts_silent)
keyset("n", "gy", "<Plug>(coc-type-definition)", opts_silent)
keyset("n", "gi", "<Plug>(coc-implementation)", opts_silent)
keyset("n", "gr", "<Plug>(coc-references)", opts_silent)
keyset("n", "gD", "<CMD>lua _G.show_docs()<CR>", opts_silent)

keyset({ "x", "o" }, "cfi", "<Plug>(coc-funcobj-i)", opts_silent)
keyset({ "x", "o" }, "cfa", "<Plug>(coc-funcobj-a)", opts_silent)
keyset({ "x", "o" }, "cci", "<Plug>(coc-classobj-i)", opts_silent)
keyset({ "x", "o" }, "cca", "<Plug>(coc-classobj-a)", opts_silent)

keyset({ "n", "v", "x" }, "<leader>\\", ":WhichKey<cr>", opts_silent)
keyset("n", "<leader>rn", "<Plug>(coc-rename)", opts_silent)
keyset({ "x", "n" }, "<leader>F", "<Plug>(coc-format-selected)", opts_silent)


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

keyset("n", "<leader>bb", "<cmd>Buffers<CR>", opts_silent)

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


keyset("n", "/d", "<cmd><C-u>CocList diagnostics<cr>", opts_silent)
keyset("n", "/e", "<cmd><C-u>CocList extensions<cr>", opts_silent)
keyset("n", "/c", "<cmd><C-u>CocList commands<cr>", opts_silent)
keyset("n", "/o", "<cmd><C-u>CocList outline<cr>", opts_silent)
keyset("n", "/s", "<cmd><C-u>CocList -I symbols<cr>", opts_silent)
keyset("n", "/n", "<cmd><C-u>CocNext<cr>", opts_silent)
keyset("n", "/p", "<cmd><C-u>CocPrev<cr>", opts_silent)
keyset("n", "/r", "<cmd><C-u>CocListResume<cr>", opts_silent)

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
keyset("n", "<C-w>m", "<Cmd>WinShift<CR>", opts_silent)

keyset({ "n", "v", "i" }, "<C-q>q", "<cmd>q<CR>", opts_silent)
keyset({ "n", "v", "i" }, "<C-q>a", "<cmd>qa<CR>", opts_silent)
keyset({ "n", "v", "i" }, "<C-q>v", "<cmd>VimspectorReset<CR>", opts_silent)

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
	"<C-space>",
	"coc#pum#visible() ? coc#_select_confirm() : coc#expandableOrJumpable() ? \"<C-r> = coc#rpc#request('doKeymap',\
  ['snippets-expand-jump',''])<CR>\" : v:lua.check_back_space() ? \"<TAB>\" : coc#refresh()",
	opts
)

vim.g.wk.register(mappings, opts)
