# Onevim

> Because typing `neovim` fast is hard

A small Neovim configuration that stays opinionated without turning into a framework.

![](https://img.shields.io/badge/Neovim-0.9+-green.svg)
![](https://img.shields.io/badge/license-MIT-blue.svg)

## Features

- Fuzzy finding with Telescope
- File tree with NvimTree
- Syntax highlighting and indentation with Treesitter
- Fold previews with nvim-ufo
- LSP support with Mason and nvim-lspconfig
- Completion with nvim-cmp
- Formatting with conform.nvim
- Git signs in the gutter
- Comment toggles and autopairs
- Text-case conversion helpers
- Lazy-loaded plugins
- TokyoNight as the default colorscheme

## Installation

```bash
# Backup existing config (optional)
[ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)

# Clone
git clone https://github.com/rybkr/onevim.git ~/.config/nvim

# Launch to auto-install plugins
nvim
```

Plugins install automatically. Restart once after initial install.

### Requirements

- Neovim >= 0.9.4
- git
- Nerd font (optional, for icons)
- ripgrep (optional, for live grep)
- `stylua` and `clang-format` (optional, for external formatting outside Mason)

After the first successful plugin sync, commit the generated `lazy-lock.json` if you want reproducible plugin versions.

## Keybindings

Leader: `Space` (configurable in `init.lua`)

Type `<leader>?` to view all keymaps.

### General
| Key | Action |
|:-|:-|
| `<leader>?` | Show keymaps |
| `<leader>nh` | Clear highlights |
| `zK` | Peek folded text |

### Editing
| Key | Action |
|:-|:-|
| `gcc` | Comment line |
| `gc` (visual) | Comment selection |
| `ga.` | Text-case Telescope picker |
| `<leader>fm` | Format buffer |

### LSP
| Key | Action |
|:-|:-|
| `gd` | Go to definition |
| `gr` | References |
| `gI` | Go to implementation |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |

### Files
| Key | Action |
|:-|:-|
| `<leader>e` | Toggle file tree |
| `<leader>ff` | Find files |
| `<leader>fg` | Grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help |
| `<leader>g` | Insert header guard in `*.h` and `*.hpp` |

## Plugins

- [lazy.nvim](https://github.com/folke/lazy.nvim) - plugin manager
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) - default colorscheme
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - fuzzy finder
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) - file explorer
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - statusline
- [mason.nvim](https://github.com/williamboman/mason.nvim) - external tool installer
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - Mason bridge for LSP servers
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP client setup
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - completion
- [conform.nvim](https://github.com/stevearc/conform.nvim) - formatting
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - syntax highlighting
- [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) - folds and fold previews
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - git gutter
- [Comment.nvim](https://github.com/numToStr/Comment.nvim) - commenting
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - auto-close pairs
- [text-case.nvim](https://github.com/johmsalas/text-case.nvim) - case conversion
- [which-key.nvim](https://github.com/folke/which-key.nvim) - keybinding hints

## Customize

This is the objectively correct config. No customization required.

However, if you'd like an incorrect config:

### Editor Settings
Edit `lua/onevim/core/options.lua`:
```lua
opt.tabstop = 2
opt.relativenumber = false
```

### Keybindings
Edit `lua/onevim/core/keymaps.lua`:
```lua
vim.keymap.set("n", "<leader>w", "<cmd>write<CR>", { desc = "Write buffer" })
```

### Colorscheme
Edit `init.lua` or `lua/onevim/plugins/colorscheme.lua` to switch themes.

### Add Plugins
Create a new file in `lua/onevim/plugins/` or extend an existing spec file.

## Tooling

- `stylua` configuration lives in `.stylua.toml`
- `selene` configuration lives in `selene.toml`
- `lazy-lock.json` should be committed after plugin sync if you want reproducible installs

## Structure

```text
~/.config/nvim/
├── init.lua
├── .stylua.toml
├── selene.toml
└── lua/onevim/
    ├── core/
    │   ├── functions.lua
    │   ├── keymaps.lua
    │   ├── lazy.lua
    │   └── options.lua
    └── plugins/
        ├── colorscheme.lua
        ├── lsp.lua
        ├── lualine.lua
        ├── misc.lua
        ├── nvim-tree.lua
        ├── nvim-ufo.lua
        ├── telescope.lua
        ├── text-case.lua
        └── treesitter.lua
```
