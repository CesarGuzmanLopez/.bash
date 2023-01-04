" source  ~/.config/nvim/init.vim
" echo stdpath('config')
" Directorio de plugins
" echo esto funciona perfect


let $OHS = "/home/cesarguzman/.bash_vim/"
set runtimepath^=$OHS/Config_Vim
source $OHS/Config_Vim/Default.vim
source $OHS/Config_Vim/Plugins.vim
source $OHS/Config_Vim/Aparience.vim
source $OHS/Config_Vim/NerdTree.vim
source $OHS/Config_Vim/FZF.vim
source $OHS/Config_Vim/Coc.vim
source $OHS/Config_Vim/Goyo.vim
source $OHS/Config_Vim/AutoCompletePairs.vim

source $OHS/Config_Vim/Functions_Java.vim
source $OHS/Config_Vim/Functions_C.vim

source $OHS/Config_Vim/keybindingsCoc.vim
source $OHS/Config_Vim/KeyBindingsFunctions.vim
source $OHS/Config_Vim/KeyBindings.vim

if exists("g:loaded_vimballPlugin") 
    function LoadNVIMAllPlugin()

"        so $MYVIMRC
    endfunction
    let g:loaded_vimballPlugin = 1
    let timerid = timer_start(300, {-> execute("call LoadNVIMAllPlugin()")})
endif
