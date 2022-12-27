" source  ~/.config/nvim/init.vim
" echo stdpath('config')
" Directorio de plugins
" echo esto funciona perfect
let $OHS = "/home/cesarguzmanlopez/.bash_vim/"
set runtimepath^=$OHS/Config_Vim

source $OHS/Config_Vim/Default.vim
source $OHS/Config_Vim/Plugins.vim
source $OHS/Config_Vim/Aparience.vim
source $OHS/Config_Vim/NerdTree.vim
source $OHS/Config_Vim/FZF.vim
source $OHS/Config_Vim/Coc.vim
source $OHS/Config_Vim/Goyo.vim

if(&filetype == 'java')
    source $OHS/Config_Vim/Functions_Java.vim
elseif(&filetype == 'c' || &filetype == 'cpp')
    source $OHS/Config_Vim/Functions_C.vim
endif

source $OHS/Config_Vim/KeyBindingsFunctions.vim
source $OHS/Config_Vim/AutoCompletePairs.vim
source $OHS/Config_Vim/KeyBindings.vim
source $OHS/Config_Vim/keybindingsCoc.vim

