vim.g.OSH   = os.getenv('OSH')
vim.g.HOME  = os.getenv('HOME')
if(vim.g.OSH == nil or vim.g.OSH == "") then
	vim.g.OSH = vim.g.HOME.."/.bash_vim"
end

package.path =  package.path .. ";"..vim.g.OSH.."/lua/?.lua"
require('plugins')
require('default')
--require('latex')
require('appearance')
vim.cmd('source '..vim.g.OSH..'/vim/appearance.vim')
require('principal')
require('CocConfig')
require('keybindings')
vim.cmd('source '..vim.g.OSH..'/vim/FZF.vim')
--vim.cmd('source '..vim.g.OSH..'/vim/latex.vim')
vim.cmd('source '..vim.g.OSH..'/vim/Functions_Java.vim')
vim.cmd('source '..vim.g.OSH..'/vim/Functions_C.vim')
vim.cmd('source '..vim.g.OSH..'/vim/KeyBindingsFunctions.vim')
vim.cmd('source '..vim.g.OSH..'/vim/KeyBindings.vim')

