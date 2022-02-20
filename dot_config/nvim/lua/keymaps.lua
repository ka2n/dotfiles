-- editor
vim.keymap.set({'n','v'}, 'j', 'gj')
vim.keymap.set({'n','v'}, 'k', 'gk')

-- move
vim.keymap.set({'n'}, '<<', '<cmd>tabprevious<CR>')
vim.keymap.set({'n'}, '>>', '<cmd>tabnext<CR>')
vim.keymap.set({'n'}, '<Return><Return>', '<C-^>', { desc = 'switch to last buffer' })

-- easymotion
vim.keymap.set({'n', 'x'}, 's', '<Plug>(easymotion-s2)')
vim.keymap.set({'o'}, 'z', '<Plug>(easymotion-s2)')

vim.keymap.set('', ';j', '<Plug>(easymotion-j)')
vim.keymap.set('', ';k', '<Plug>(easymotion-k)')

vim.keymap.set({'n', 'x'}, 'g/', '<Plug>(easymotion-sn)')
vim.keymap.set({'o'}, 'g/', '<Plug>(easymotion-tn)')

-- telescope
vim.keymap.set({'n'}, '<C-b>', '<cmd>Telescope buffers<cr>')
vim.keymap.set({'n'}, '<C-p>', '<cmd>Telescope fd<cr>')
vim.keymap.set({'n'}, ';;', function()
    require('telescope.builtin').keymaps()
end, { desc = 'telescope keymaps' })
for k, v in pairs(require("telescope.builtin")) do
  if type(v) == "function" then
    vim.keymap.set('n', '<Plug>(telescope.' .. k .. ')', v)
  end
end

do 
    local coc_actions = {
        'mru',
        'links',
        'commands',
        'locations',
        'references',
        'definitions',
        'declarations',
        'implementations',
        'type_definitions',
        'diagnostics',
        'code_actions',
        'line_code_actions',
        'file_code_actions',
        'document_symbols',
        'workspace_symbols',
        'workspace_diagnostics',
    }
    for k, v in pairs(coc_actions) do
        vim.keymap.set('n', '<Plug>(coc.' .. v .. ')', '<cmd>Telescope coc ' .. v .. '<cr>')
    end
end

-- coc
vim.keymap.set({'n'}, '<M-O>', '<cmd>OR<cr>')
vim.keymap.set({'i'}, '<C-Space>', 'coc#refresh()', {expr = true})
-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
vim.keymap.set({'n'}, '[g', '<Plug>(coc-diagnostic-prev)')
vim.keymap.set({'n'}, ']g', '<Plug>(coc-diagnostic-next)')
-- GoTo code navigation.
vim.keymap.set({'n'}, 'gd', '<Plug>(coc-definition)')
vim.keymap.set({'n'}, 'gy', '<Plug>(coc-type-definition)')
vim.keymap.set({'n'}, 'gi', '<Plug>(coc-implementation)')
vim.keymap.set({'n'}, 'gr', '<Plug>(coc-references)')
 
-- Symbol renaming.
vim.keymap.set({'n'}, '<Leader>rn', '<Plug>(coc-rename)')

-- Use gh to show documentation in preview window.
vim.keymap.set({'n'}, 'gh', function()
    if vim.fn['CocAction']('hasProvider', 'hover') then
        vim.fn['CocAction']('doHover')
    end
end, { desc = 'LSP: show documentation'})

-- Applying codeAction to the selected region.
vim.keymap.set({'n', 'x'}, '<Leader>a', '<Plug>(coc-codeaction-selected)')

-- Remap keys for applying codeAction to the current buffer.
vim.keymap.set({'n'}, '<Leader>ac', '<Plug>(coc-codeaction)')
-- Apply AutoFix to problem on the current line.
vim.keymap.set({'n'}, '<Leader>qf', '<Plug>(coc-fix-current)')
-- Run the Code Lens action on the current line.
vim.keymap.set({'n'}, '<Leader>cl', '<Plug>(coc-codelens-action)')

-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
vim.keymap.set({'x', 'o'}, 'if', '<Plug>(coc-funcobj-i)')
vim.keymap.set({'x', 'o'}, 'af', '<Plug>(coc-funcobj-a)')
vim.keymap.set({'x', 'o'}, 'ic', '<Plug>(coc-classobj-i)')
vim.keymap.set({'x', 'o'}, 'ac', '<Plug>(coc-classobj-a)')

-- Use CTRL-S for selections ranges.
-- Requires 'textDocument/selectionRange' support of language server.
vim.keymap.set({'n', 'x'}, '<C-s>', '<Plug>(coc-range-select)')