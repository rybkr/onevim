local opt = vim.opt

-- Reference: https://neovim.io/doc/user/options.html

opt.number         = true
opt.relativenumber = true
opt.cursorline     = true

opt.tabstop     = 4
opt.shiftwidth  = 4
opt.expandtab   = true
opt.smartindent = true

opt.wrap          = false
opt.scrolloff     = 8
opt.sidescrolloff = 8

opt.ignorecase = false
opt.smartcase  = false
opt.hlsearch   = true
opt.incsearch  = true

opt.termguicolors = true
opt.background    = "dark"
opt.signcolumn    = "yes"

opt.splitright = true
opt.splitbelow = true

opt.backup   = false
opt.swapfile = true
opt.undofile = true

opt.backspace = "indent,eol,start"

opt.mouse = 'a'

opt.clipboard:append("unnamedplus")
