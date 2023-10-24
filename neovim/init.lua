---@diagnostic disable-next-line: lowercase-global
vim = vim
vim.g.OSH   = os.getenv('OSH')
vim.g.HOME  = os.getenv('HOME')
if(vim.g.OSH == nil) then
	vim.g.OSH = vim.g.HOME.."/.bash_vim/neovim"
else
	vim.g.OSH = vim.g.OSH.."/neovim"
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
cmd('source '..vim.g.OSH..'/vim/appearance.vim')
cmd('source '..vim.g.OSH..'/vim/FZF.vim')
cmd('set laststatus=3')
cmd('let g:loaded_ruby_provider = 0 ')
--cmd('source '..vim.g.OSH..'/vim/Functions_Java.vim')
--cmd('source '..vim.g.OSH..'/vim/Functions_C.vim')

require('keybindings')
vim.opt.laststatus = 3

