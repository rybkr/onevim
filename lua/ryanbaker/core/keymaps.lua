vim.g.mapleader = ' ' -- set the leader key

local keymap = vim.keymap

-- disable highlights
keymap.set('n', '<leader>nh', ':nohl<CR>')

-- don't yank characters deleted with 'x'
keymap.set('n', 'x', '"_x')

-- replace ':' with ';'
keymap.set('n', ';', ':')

keymap.set('n', '<leader>sv', '<C-w>v') -- split window vertically
keymap.set('n', '<leader>sh', '<C-w>s') -- split window horizontally
keymap.set('n', '<leader>se', '<C-w>=') -- make split windows equal width & height
keymap.set('n', '<leader>sx', ':close<CR>') -- close current split window

keymap.set('n', '<leader>to', ':tabnew<CR>') -- open new tab
keymap.set('n', '<leader>tx', ':tabclose<CR>') -- close current tab
keymap.set('n', '<leader>tn', ':tabn<CR>') --  go to next tab
keymap.set('n', '<leader>tp', ':tabp<CR>') --  go to previous tab

keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>') -- toggle file tree viewer

keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>') -- find files within current working directory, respects .gitignore
keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<cr>') -- find string in current working directory as you type
keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>') -- find string under cursor in current working directory
keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>') -- list open buffers in current neovim instance
keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>') -- list available help tags

keymap.set('i', '<C-2>', '²');


function write_cpp_inc_guard()
    math.randomseed(os.time())
    local r = string.format("%08X%08X", math.random(0, 2^32 - 1), math.random(0, 2^32 - 1))
    local filename = vim.fn.expand("%:t"):upper():gsub("[^A-Za-z0-9]", "_")
    local guard = filename .. "_" .. r
    vim.api.nvim_buf_set_lines(0, 0, 0, false, { "#ifndef " .. guard, "#define " .. guard, "", "", "", "", "#endif // " .. guard })
end

vim.api.nvim_create_augroup("cpp-keymaps", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = "cpp-keymaps",
    pattern = { "c", "cpp", "h", "hpp" },
    callback = function()
        keymap.set('n', '<leader>x', ':!clang++ -std=c++23 % && ./a.out; rm a.out<CR>', { noremap = true, buffer = true, desc = "Compile and execute a C++ file" })
        keymap.set('n', '<leader>g', ':lua write_cpp_inc_guard()<CR>dd3ko', { noremap = true, silent = true })
    end,
})


TeX = {}

TeX.live_compile = false

vim.api.nvim_create_augroup("tex-keymaps", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = "tex-keymaps",
    pattern = { "tex" },
    callback = function()
        keymap.set('n', '<leader>x', ':!lualatex --interaction=nonstopmode --output-dir=build %<CR>', { noremap = true, buffer = true, desc = "Compile a LaTeX file" })
        keymap.set('n', '<leader>ll', '[[:lua TeX.live_compile = not TeX.live_compile<CR>]]', { noremap = true, buffer = true, desc = "Toggle LaTeX live compile" })
    end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
    group = "tex-keymaps",
    pattern = "*.tex",
    callback = function()
        if TeX.live_compile then
            vim.cmd('!lualatex --interaction=nonstopmode --output-dir=build %')
        end
    end,
})

vim.cmd [[
    autocmd FileType tex setlocal noexpandtab shiftwidth=4 softtabstop=4
    autocmd FileType tex setlocal smartindent
    autocmd FileType tex setlocal paste
]]
