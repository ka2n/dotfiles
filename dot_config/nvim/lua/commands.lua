vim.api.nvim_create_user_command('Format', "call CocActionAsync('format')", { nargs = 0 })
vim.api.nvim_create_user_command('Prettier', "CocCommand prettier.forceFormatDocument", { nargs = 0 })
vim.api.nvim_create_user_command('OR', "call CocActionAsync('runCommand', 'editor.action.organizeImport')", { nargs = 0 })

-- autocmd
vim.cmd("autocmd CursorHold * silent call CocActionAsync('highlight')")
vim.cmd("autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')")

-- make readonly
vim.cmd('autocmd BufRead,BufNewFile *.gen.* setlocal readonly')

function checkDoNotEdit()
    local first = vim.fn.getline(1)
    if first and string.find(first, "DO NOT EDIT") then
        vim.cmd('setlocal readonly')
    end
end
vim.cmd('autocmd BufReadPost * lua checkDoNotEdit()')
