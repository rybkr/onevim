-- ============================================================================
-- ONEVIM - Because I typed "neovim" too fast
-- ============================================================================

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("onevim.core.options")
require("onevim.core.keymaps")
require("onevim.core.lazy")
require("onevim.core.functions")

vim.cmd([[colorscheme tokyonight]])
