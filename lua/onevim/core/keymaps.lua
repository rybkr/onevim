local keymap = vim.keymap

-- I don't want to press shift to enter COMMAND mode.
keymap.set('n', ';', ':')

-- `<leader>hn` enables highlights, feels right to make `<leader>nh` disable them.
keymap.set('n', '<leader>nh', ':nohl<CR>')

-- Rarely do I want to delete a few characters and have them overwrite my clipboard.
-- Hence, I don't yank characters with `x`.
keymap.set('n', 'x', '"_x')

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'c', 'cpp' },
    callback = function()
        local ext = vim.fn.expand('%:e')
        if ext == 'h' or ext == 'hpp' then
            vim.keymap.set('n', '<leader>g', ':InsertHeaderGuard<CR>', { buffer = true, desc = 'Insert header guard' })
        end
    end
})
