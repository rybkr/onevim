local opt = vim.opt

-- See: https://neovim.io/doc/user/options.html

opt.number = true
opt.relativenumber = true
opt.cursorline = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8

-- nvim-ufo owns folding behavior. Keep folds available without forcing them open.
opt.foldcolumn = "1"
opt.foldenable = false
opt.foldlevel = 99
opt.foldlevelstart = 99

opt.fillchars = {
  fold = " ",
  foldsep = " ",
}

opt.ignorecase = false
opt.smartcase = false
opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.splitright = true
opt.splitbelow = true

opt.backup = false
opt.swapfile = true
opt.undofile = true

opt.backspace = "indent,eol,start"

opt.mouse = "a"

opt.clipboard:append("unnamedplus")
