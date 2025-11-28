vim.api.nvim_create_user_command('InsertHeaderGuard', function()
    math.randomseed(os.time())

    local filename = vim.fn.expand('%:t')           -- Get filename with extension
    local name_without_ext = vim.fn.expand('%:t:r') -- Filename without extension
    local ext = vim.fn.expand('%:e')                -- Just the extension
    
    local guard_name = name_without_ext:upper():gsub('[^%w]', '_')
    local ext_upper = ext:upper()
    
    local chars = '0123456789ABCDEF'
    local random_str = ''
    for _ = 1, 16 do
        local idx = math.random(1, #chars)
        random_str = random_str .. chars:sub(idx, idx)
    end
    
    local guard = guard_name .. '_' .. ext_upper .. '_' .. random_str
    
    vim.api.nvim_buf_set_lines(0, 0, 0, false, {
        '#ifndef ' .. guard,
        '#define ' .. guard,
        ''
    })
        
    local line_count = vim.api.nvim_buf_line_count(0)
    vim.api.nvim_buf_set_lines(0, line_count, line_count, false, {
        '',
        '#endif // ' .. guard
    })
end, {})
