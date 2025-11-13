-- editor
vim.keymap.set({ 'n', 'v' }, 'j', 'gj')
vim.keymap.set({ 'x' }, 'p', '"_xP')

-- move
vim.keymap.set({ 'n' }, '<<', '<cmd>tabprevious<CR>')
vim.keymap.set({ 'n' }, '>>', '<cmd>tabnext<CR>')

-- buffer
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        if vim.bo.modifiable then
            vim.keymap.set('n', '<CR><CR>', '<C-^>', { buffer = true })
        else
            vim.keymap.set('n', '<CR><CR>', '<CR>', { buffer = true })
        end
    end
})


-- qucikfix
vim.keymap.set('n', '<Leader>q', '<cmd>botright copen<CR>')
vim.keymap.set('n', '<Leader>Q', '<cmd>cclose<CR>')

-- easymotion
vim.keymap.set({ 'n', 'x' }, 's', '<Plug>(easymotion-s2)')
vim.keymap.set({ 'o' }, 'z', '<Plug>(easymotion-s2)')

vim.keymap.set('', ';j', '<Plug>(easymotion-j)')
vim.keymap.set('', ';k', '<Plug>(easymotion-k)')

vim.keymap.set({ 'n', 'x' }, 'g/', '<Plug>(easymotion-sn)')
vim.keymap.set({ 'o' }, 'g/', '<Plug>(easymotion-tn)')

-- neo-tree
vim.keymap.set({ 'n' }, '<C-e>', '<cmd>Neotree<cr>')
vim.keymap.set({ 'n' }, '<C-n>', '<cmd>Neotree reveal<cr>')

-- telescope
vim.keymap.set({ 'n' }, '<C-b>', '<cmd>Telescope buffers<cr>')
vim.keymap.set({ 'n' }, '<C-p>', '<cmd>Telescope fd hidden=true<cr>')

-- quickrun
vim.keymap.set("n", "\\r", "<cmd>QuickRun<CR>")
vim.keymap.set("n", "\\x", "<cmd>QuickRun >>message<CR>")


-- copilot
--vim.keymap.set('i', "<C-j>", "<Plug>(copilot-next)")
--vim.keymap.set('i', "<C-k>", "<Plug>(copilot-previous)")
--vim.keymap.set('i', "<C-o>", "<Plug>(copilot-dismiss)")
--vim.keymap.set('i', "<C-s>", "<Plug>(copilot-suggest)")
--vim.keymap.set('i', "<C-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true, script = true, replace_keycodes = false })
vim.keymap.set('n', '<Leader>ip',
    function()
        return vim.bo.filetype == "AvanteInput" and require("avante.clipboard").paste_image()
            or require("img-clip").paste_image()
    end, { desc = "clip: paste image" })

if pcall(require, "telescope") then
    local telescope_bindings = {
        { desc = "telescope keymaps",   key = ";;", f = function() require('telescope.builtin').keymaps() end },
        --    { desc = "telescope coc-commands", key = ";c", f = function() vim.cmd(':Telescope coc commands') end },
        { desc = "telescope resume",    key = ";r", f = function() require('telescope.builtin').resume() end },
        { desc = "telescope frecency",  key = ";f", f = function() require('telescope').extensions.frecency.frecency() end },
        { desc = "telescope live_grep", key = ";/", f = function() require('telescope.builtin').live_grep() end },
    }
    for i, s in pairs(telescope_bindings) do
        vim.keymap.set('n', s.key, s.f, { desc = s.desc, noremap = true, silent = true })
    end

    -- keymap にtelescopeの機能を追加して ;; で呼び出せるようにする
    for k, v in pairs(require("telescope.builtin")) do
        if type(v) == "function" then
            vim.keymap.set('n', '<Plug>(telescope.' .. k .. ')', v)
        end
    end
end

---- Most used functions
vim.keymap.set('', ';o', '<cmd>ObsidianQuickSwitch<CR>')
