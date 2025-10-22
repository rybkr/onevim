return {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    event = 'BufReadPost',
    
    config = function()
        require('ufo').setup({
            provider_selector = function()
                return {'treesitter', 'indent'}
            end,
            
            fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
                local newVirtText = {}
                local lineCount = endLnum - lnum
                local prefix = ('[%d lines] '):format(lineCount)
                
                -- Add the line count prefix
                table.insert(newVirtText, {prefix, 'MoreMsg'})
                
                -- Add the folded content
                for _, chunk in ipairs(virtText) do
                    table.insert(newVirtText, chunk)
                end
                
                return newVirtText
            end,
        })
        
        -- Optional: Peek fold content with zK
        vim.keymap.set('n', 'zK', function()
            require('ufo').peekFoldedLinesUnderCursor()
        end, { desc = 'Peek fold' })
    end,
}
