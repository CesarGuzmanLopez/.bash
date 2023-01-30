g = vim.g
api = vim.api

g.vimtex_view_general_viewer = 'okular'
g.vimtex_view_general_options = '--unique file:@pdf#src:@line@tex'
g.vimtex_quickfix_mode=0
g.tex_conceal='abdmg'
g.tex_flavor='latex'
g.vimtex_quickfix_mode=0
vim.cmd [[
  silent !inkscape-figures watch
]]
vim.cmd [[
  hi clear Conceal              
]]

