---@diagnostic disable-next-line: lowercase-global
vim = vim
vim.g.OSH   = os.getenv('OSH')
vim.g.HOME  = os.getenv('HOME')
if(vim.g.OSH == nil or vim.g.OSH == "") then
	vim.g.OSH = vim.g.HOME.."/.bash_vim"
end
local cmd = vim.cmd
package.path =  package.path .. ";"..vim.g.OSH.."/lua/?.lua"
require('plugins')
require('default')
require('latex')
require('appearance')
require('principal')
require('CocConfig')
require('functionsKeyBindings')
--cmd('source '..vim.g.OSH..'/vim/appearance.vim')
cmd('source '..vim.g.OSH..'/vim/FZF.vim')
--cmd('source '..vim.g.OSH..'/vim/Functions_Java.vim')
--cmd('source '..vim.g.OSH..'/vim/Functions_C.vim')

require('keybindings')
