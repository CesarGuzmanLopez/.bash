local api = vim.api

vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_transparent_background = 1
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_enable_italic = 1

local ok, _ = pcall(vim.cmd, 'colorscheme gruvbox-material')
vim.cmd [[
  hi LineNr guifg=#bdbfbd      
  hi CursorLineNr guifg=#ffffff
  hi CursorLine guibg=#3c3836  
  hi SignColumn guibg=#3c3836  
  hi CursorLineNr guibg=#3c3836
  autocmd VimEnter hi foldcolumn guibg=bg
  autocmd VimEnter * hi Normal ctermbg=none
  autocmd VimEnter * hi Normal guibg=none
  autocmd ColorScheme gruvbox-material   hi LineNr guifg=#bdbfbd
  autocmd ColorScheme gruvbox-material   hi CursorLineNr guifg=#ffffff
  autocmd ColorScheme gruvbox-material   hi CursorLine guibg=#3c3836
  autocmd ColorScheme gruvbox-material   hi SignColumn guibg=#3c3836
  autocmd ColorScheme gruvbox-material   hi CursorLineNr guibg=#3c3836
  autocmd ColorScheme zellner   hi LineNr guifg=#010001
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
  augroup END
  autocmd ColorScheme zellner   hi LineNr guifg=#010001
]]

if not ok then
  vim.cmd 'colorscheme default' -- if the above fails, then use default
end

