vim.api.nvim_create_user_command('Format', "call CocActionAsync('format')", { nargs = 0 })
vim.api.nvim_create_user_command('Prettier', "CocCommand prettier.forceFormatDocument", { nargs = 0 })
vim.api.nvim_create_user_command('OR', "call CocActionAsync('runCommand', 'editor.action.organizeImport')", { nargs = 0 })

-- autocmd
vim.cmd("autocmd CursorHold * silent call CocActionAsync('highlight')")
vim.cmd("autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')")
