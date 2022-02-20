vim.api.nvim_create_user_command('Format', "call CocActionAsync('format')", { nargs = 0 })
vim.api.nvim_create_user_command('Prettier', "CocCommand prettier.forceFormatDocument", { nargs = 0 })
vim.api.nvim_create_user_command('OR', "call CocActionAsync('runCommand', 'editor.action.organizeImport')", { nargs = 0 })

-- autocmd
--  Highlight the symbol and its references when holding the cursor.
vim.api.nvim_create_autocmd('CursorHold', {
    pattern = { '*' },
    command = "silent call CocActionAsync('highlight')",
})
