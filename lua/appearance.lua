local api = vim.api

vim.opt.list = true
vim.opt.listchars:append "space: "
vim.opt.termguicolors = true

require("tokyonight").setup(
  {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    light_style = "day", -- The theme is used when the background is set to light
    transparent = true, -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
      -- Style to be applied to different syntax groups
      -- Value is any valid attr-list value for `:help nvim_set_hl`
      comments = { italic = true },
      keywords = { italic = true },
      functions = { italic = true },
      variables = {},
      -- Background styles. Can be "dark", "transparent" or "normal"
      sidebars = "transparent", -- style for sidebars, see below
      floats = "transparent", -- style for floating windows
    },
    sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
    hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    dim_inactive = false, -- dims inactive windows
    lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

    --- You can override specific color groups to use other groups or a hex color
    --- function will be called with a ColorScheme table
    ---@param colors ColorScheme
    on_colors = function(colors) end,

    --- You can override specific highlights to use other groups or a hex color
    --- function will be called with a Highlights and ColorScheme table
    ---@param highlights Highlights
    ---@param colors ColorScheme
    on_highlights = function(highlights, colors) end,
  })
local ok, _ = pcall(vim.cmd, 'colorscheme tokyonight')


-- char = '▏',
require('lualine').setup {
  options = {
    icons_enabled = true,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'}, 
    lualine_y = { 'g:coc_status', 'location'},
    lualine_z = {'progress'},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
  theme = 'tokyonight'
}
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
        open_pre = function() -- function to run before opening Ataraxis mode
          require("barbecue.ui").toggle(true)
          require("indent_blankline").setup {
            -- for example, context is off by default, use this to turn it on
            show_current_context = true,
            show_current_context_start = true,
            char_list = {' ',  ' ', ' ', ' ', ' ',}
            -- char = '▏',
          }
          vim.cmd("IndentBlanklineRefresh")
        end,
        open_pos = nil,
        close_pre = nil,
        close_pos = function() -- function to run after closing Ataraxis mode
          vim.cmd("IndentBlanklineEnable") -- enable indent-blankline
          require("barbecue.ui").toggle(false)
          require("indent_blankline").setup { 
            space_char_blankline = " ",
            show_current_context = false,
            show_current_context_start = true,
            char_list = {'▏',  '|', '¦', '┆', '┊',}
          }
        end,
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
      folds_style = "informative",      run_ataraxis = true, -- display narrowed text in a Ataraxis session
      callbacks = { -- run functions when opening/closing Narrow mode
        pen_pre = nil,
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
    lualine = true -- hide nvim-lualine (ataraxis)
  },
}
require("barbecue").setup({
    create_autocmd = true,
    show_navic = true,
    show_modified = true,
  })
require("barbecue.ui").toggle(false)

vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("IndentBlanklineBigFile", {}),
    pattern = "*",
    callback = function()
        if vim.api.nvim_buf_line_count(0) > 3000 then
            require("indent_blankline.commands").disable()
        end
    end,
})


require("indent_blankline").setup( { 
  space_char_blankline = " ",
  indent_blankline_filetype_exclude = {"startify","dashboard", "help", "packer"},
  --  show_current_context_start = true,
  char_list = {'', '▏',  '|', '¦', '┆', '┊'},

  indent_blankline_context_patterns = {
        "^for", "^if", "^object", "^table", "^while", "arguments", "block",
        "catch_clause", "class", "else_clause", "function", "if_statement",
        "import_statement", "jsx_element", "jsx_element",
        "jsx_self_closing_element", "method", "operation_type", "return",
        "try_statement", "type", "while_statement", "with_statement",
        "jsx_element", "jsx_self_closing_element", "jsx_fragment", "public"
    }
})

require("mason").setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
})
