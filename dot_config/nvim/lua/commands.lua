-- make readonly
vim.cmd('autocmd BufRead,BufNewFile *.gen.* setlocal readonly')

function checkDoNotEdit()
    local first = vim.fn.getline(1)
    if first and string.find(first, "DO NOT EDIT") then
        vim.cmd('setlocal readonly')
    end
end
vim.cmd('autocmd BufReadPost * lua checkDoNotEdit()')

-- change color scheme if buffer is readonly
-- function updateColorScheme()
--     if vim.bo.readonly and vim.bo.buftype == "" then
--         vim.cmd('colorscheme pablo')
--     else
--         vim.cmd('colorscheme nord')
--     end
-- end
-- vim.cmd('autocmd BufReadPost,BufEnter * lua updateColorScheme()')
