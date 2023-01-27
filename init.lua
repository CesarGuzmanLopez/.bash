vim.g.OSH   = os.getenv('OSH')
vim.g.HOME  = os.getenv('HOME')
package.path =  package.path .. ";"..vim.g.OSH.."/lua/?.lua"
require('plugins')
require('default')
require('principal')
require('latex')

vim.cmd('source '..vim.g.OSH..'/vim/FZF.vim')
vim.cmd('source '..vim.g.OSH..'/vim/Coc.vim')
vim.cmd('source '..vim.g.OSH..'/vim/latex.vim')
vim.cmd('source '..vim.g.OSH..'/vim/Functions_Java.vim')
vim.cmd('source '..vim.g.OSH..'/vim/Functions_C.vim')
vim.cmd('source '..vim.g.OSH..'/vim/KeyBindingsFunctions.vim')
vim.cmd('source '..vim.g.OSH..'/vim/keybindingsCoc.vim')
vim.cmd('source '..vim.g.OSH..'/vim/KeyBindings.vim')
vim.cmd('source '..vim.g.OSH..'/vim/appearance.vim')

