# 1️⃣ Onevim

> Because typing `neovim` fast is hard

A Neovim configuration that doesn't try to be a JetBrains product.

![](https://img.shields.io/badge/Neovim-0.9+-green.svg)
![](https://img.shields.io/badge/license-MIT-blue.svg)

## ❗️ Features

- Fuzzy finding with Telescope
- File tree with NvimTree
- Syntax highlighting with Treesitter
- Lazy-loaded plugins
- TokyoNight colorscheme

## 📦 Installation

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
- Nerd font (optional, for icons)
- ripgrep (optional, for live grep)

## 🎹 Keybindings

Leader: `Space` (configurable in `init.lua`)

Type `<leader>?` to view all keymaps.

### General
| Key | Action |
|:-|:-|
| `<leader>?` | Show keymaps |
| `<leader>nh` | Clear highlights |

### Editing
| Key | Action |
|:-|:-|
| `gcc` | Comment line |
| `gc` (visual) | Comment selection |

### Files
| Key | Action |
|:-|:-|
| `<leader>e` | Toggle file tree |
| `<leader>ff` | Find files |
| `<leader>fg` | Grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help |

## 🔌 Plugins

- [lazy.nvim](https://github.com/folke/lazy.nvim) - plugin manager
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) - colorscheme
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - fuzzy finder
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) - file explorer
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - statusline
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - syntax highlighting
- [which-key.nvim](https://github.com/folke/which-key.nvim) - keybinding hints

## 🎨 Customize

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
keymap("n", "<leader>w", ":w<CR>", opts)
```

### Colorscheme
Edit `lua/onevim/plugins/colorscheme.lua`:
```lua
return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme catppuccin]])
  end,
}
```

### Add Plugins
Create a new file in `lua/onevim/plugins/` or add to `misc.lua`.

## 📂 Structure

```
~/.config/nvim/
├── init.lua
└── lua/onevim/
    ├── core/
    │   ├── options.lua
    │   ├── keymaps.lua
    │   └── lazy.lua
    └── plugins/
        ├── colorscheme.lua
        ├── telescope.lua
        ├── nvim-tree.lua
        ├── treesitter.lua
        ├── lualine.lua
        └── misc.lua
```
