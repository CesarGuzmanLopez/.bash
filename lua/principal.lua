-- examples for your init.lua
vim.g.copilot_node_command = "~/.nvm/versions/node/v17.9.1/bin/node"
vim.g.copilot_no_tab_map = 1
vim.g.lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
vim.g.lastplace_ignore_buftype = "quickfix,nofile,help"
vim.g.lastplace_open_folds = 0


-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults

-- OR setup with some options
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
    highlight_modified = 'all',
  },
  filters = {
    dotfiles = false,
  },
})
require('incline').setup {
  debounce_threshold = {
    falling = 50,
    rising = 10
  },
  hide = {
    cursorline = true,
    focused_win = true,
    only_win = true
  },
  highlight = {
    groups = {
      InclineNormal = {
        default = true,
        group = "NormalFloat"
      },
      InclineNormalNC = {
        default = true,
        group = "NormalFloat"
      }
    }
  },
  ignore = {
    buftypes = "special",
    filetypes = {},
    floating_wins = true,
    unlisted_buffers = true,
    wintypes = "special"
  },
  render = "basic",
  window = {

    margin = {
      horizontal = 0,
      vertical = 0
    },
    options = {
      signcolumn = "no",
      wrap = false
    },
    padding = 1,
    padding_char = " ",
    placement = {
      horizontal = "right",
      vertical = "top"
    },
    width = "fit",
    winhighlight = {
      active = {
        EndOfBuffer = "None",
        Normal = "InclineNormal",
        Search = "None"
      },
      inactive = {
        EndOfBuffer = "None",
        Normal = "InclineNormalNC",
        Search = "None"
      }
    },
    zindex = 50
  }
}
require("auto-save").setup {
}
require('nvim-lastplace').setup{}
require("winshift").setup{}
--[[require("image_preview").setup({})]]--

require("barbecue").setup({
  create_autocmd = true,
  show_navic = false,
  show_modified = false,
})
require("barbecue.ui").toggle(false)
local entries = require("barbecue.ui.state").get_entries(winnr)
local api = vim.api

require("true-zen").setup{
	modes = { -- configurations per mode
		ataraxis = {
			shade = "dark", -- if `dark` then dim the padding windows, otherwise if it's `light` it'll brighten said windows
			backdrop = 0, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
			minimum_writing_area = { -- minimum size of main window
				width = 160,
				height = 44,
			},
			quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
			padding = { -- padding windows
				left = 52,
				right = 52,
				top = 0,
				bottom = 0,
			},
			callbacks = { -- run functions when opening/closing Ataraxis mode
				open_pre = nil,
				open_pos = nil,
				close_pre = nil,
				close_pos = nil
			},
		},
		minimalist = {
			ignored_buf_types = { "nofile" }, -- save current options from any window except ones displaying these kinds of buffers
			options = { -- options to be disabled when entering Minimalist mode
				number = false,
				relativenumber = false,
				showtabline = 0,
				signcolumn = "no",
				statusline = "",
				cmdheight = 1,
				laststatus = 0,
				showcmd = false,
				showmode = false,
				ruler = false,
				numberwidth = 1
			},
			callbacks = { -- run functions when opening/closing Minimalist mode
				open_pre = nil,
				open_pos = nil,
				close_pre = nil,
				close_pos = nil
			},
		},
		narrow = {
			--- change the style of the fold lines. Set it to:
			--- `informative`: to get nice pre-baked folds
			--- `invisible`: hide them
			--- function() end: pass a custom func with your fold lines. See :h foldtext
			folds_style = "informative",			run_ataraxis = true, -- display narrowed text in a Ataraxis session
			callbacks = { -- run functions when opening/closing Narrow mode
				open_pre = nil,
				open_pos = nil,
				close_pre = nil,
				close_pos = nil
			},
		},
		focus = {
			callbacks = { -- run functions when opening/closing Focus mode
				open_pre = nil,
				open_pos = nil,
				close_pre = nil,
				close_pos = nil
			},
		}
	},
	integrations = {
		tmux = false, -- hide tmux status bar in (minimalist, ataraxis)
		kitty = { -- increment font size in Kitty. Note: you must set `allow_remote_control socket-only` and `listen_on unix:/tmp/kitty` in your personal config (ataraxis)
			enabled = false,
			font = "+3"
		},
		twilight = false, -- enable twilight (ataraxis)
		lualine = false -- hide nvim-lualine (ataraxis)
	},
}
require('gitsigns').setup()

require("toggleterm").setup{}
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require('Comment').setup()

vim.api.nvim_set_keymap("n", "<c-x>n", ":silent! TZNarrow<CR>", {})
vim.api.nvim_set_keymap("v", "<c-x>n", ":'<,'>TZNarrow<CR>", {})
vim.api.nvim_set_keymap("n", "<c-x>f", ":silent! TZFocus<CR>", {})
vim.api.nvim_set_keymap("n", "<c-x>o", ":silent! TZAtaraxis<CR>", {})


vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "space: "

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
require('gitsigns').setup{
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', gs.stage_buffer)
    map('n', '<leader>hu', gs.undo_stage_hunk)
    map('n', '<leader>hR', gs.reset_buffer)
    map('n', '<leader>hp', gs.preview_hunk)
    map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>hd', gs.diffthis)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}


local on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

require("lspconfig").clangd.setup {
    on_attach = on_attach
}
opts = {
  mode = "n", -- NORMAL mode
  -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- the prefix is prepended to every mapping part of `mappings`
  prefix = "",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}
vim.o.timeout = true
vim.o.timeoutlen = 300
local wk = require("which-key")
wk.register(mappings, opts)

require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
require'hop'.setup()

-- place this in one of your configuration file(s)
local hop = require('hop')
local directions = require('hop.hint').HintDirection





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
--
