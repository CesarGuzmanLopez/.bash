---@diagnostic disable-next-line: lowercase-global
vim = vim
vim.g.OSH   = os.getenv('OSH')
vim.g.HOME  = os.getenv('HOME')
local cmd = vim.cmd

if(vim.g.OSH == nil) then
	vim.g.OSH = vim.g.HOME.."/.bash_vim/neovim"
else
	vim.g.OSH = vim.g.OSH.."/neovim"
end
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
cmd('let g:loaded_ruby_provider = 0 ')
cmd('set laststatus=3')

require('keybindings')
vim.opt.laststatus = 3
