
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})
-- Setup formatexpr specified filetype(s)
vim.api.nvim_create_autocmd("FileType", {
    group = "CocGroup",
    pattern = "typescript,json",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr specified filetype(s)."
})

-- Update signature help on jump placeholder
vim.api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})

-- Use CTRL-S for selections ranges
-- Add `:Format` command to format current buffer
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

-- Add `:OR` command for organize imports of the current buffer
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- provide custom statusline: lightline.vim, vim-airline
vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

vim.g.coc_global_extensions = {
   'coc-markdownlint',
   'coc-bibtex',
   'coc-calc',
   'coc-clangd',
   'coc-explorer',
   'coc-flutter',
   'coc-flutter',
   'coc-git',
   'coc-git',
   'coc-go',
   'coc-go',
   'coc-highlight',
   'coc-highlight',
   'coc-java',
   'coc-java-debug',
   'coc-java-dependency',
   'coc-java-intellicode',
   'coc-java-lombok',
   'coc-java-vimspector',
   'coc-json',
   'coc-json',
   'coc-julia',
   'coc-lightbulb',
   'coc-lists',
   'coc-ltex',
   'coc-markdownlint',
   'coc-npm-version',
   'coc-pyright',
   'coc-python',
   'coc-restclient',
   'coc-rust-analyzer',
   'coc-snippets',
   'coc-texlab',
   'coc-translate',
   'coc-translator',
   'coc-vetur',
   'coc-vimlsp',
   'coc-vimtex',
   'coc-lua',
   'coc-stylua'           ,
   '@statiolake/coc-stylua',
   'coc-sumneko-lua'     ,
   'coc-nelua',
   'coc-marketplace',
   'coc-tabnine',
   'coc-sh',
   'coc-rls',

}

vim.g.coc_config_home = vim.g.OSH 
