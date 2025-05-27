# Neovim Configuration

This is my personal Neovim configuration, built with Lua and using lazy.nvim as the plugin manager.

## Structure

```
~/.config/nvim/
├── init.lua          # Main entry point
├── lazy-lock.json    # Plugin lock file
└── lua/
    ├── config/       # Core configuration files
    └── plugins/      # Plugin configurations
```

## Features

- Plugin management with [lazy.nvim](https://github.com/folke/lazy.nvim)
- Lua-based configuration
- Modular structure for easy maintenance

## Plugins Details

This configuration includes the following carefully selected plugins:

### Core Plugins
- **[lazy.nvim](https://github.com/folke/lazy.nvim)** - Modern plugin manager for Neovim
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Treesitter configurations and abstraction layer
- **[nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)** - Syntax aware text-objects, select, move, swap, and peek support

### UI & Navigation
- **[fzf-lua](https://github.com/ibhagwan/fzf-lua)** - Improved fzf.vim written in lua
- **[oil.nvim](https://github.com/stevearc/oil.nvim)** - A file explorer that lets you edit your filesystem like a normal Neovim buffer
- **[which-key.nvim](https://github.com/folke/which-key.nvim)** - Displays a popup with possible key bindings
- **[mini.statusline](https://github.com/echasnovski/mini.statusline)** - Fast and flexible statusline
- **[mini.icons](https://github.com/echasnovski/mini.icons)** - Icon provider for Neovim

### Productivity
- **[project.nvim](https://github.com/ahmedkhalf/project.nvim)** - Project management for Neovim
- **[vim-sleuth](https://github.com/tpope/vim-sleuth)** - Heuristically set buffer options

### Theme & Appearance
- **[onedarkpro.nvim](https://github.com/olimorris/onedarkpro.nvim)** - OneDark Pro theme for Neovim

### Utilities
- **[showkeys](https://github.com/nvzone/showkeys)** - Show keys pressed in real-time (useful for demonstrations)

## Installation

1. Clone this repository:
```bash
git clone <git@github.com:joshuaco/neovim-config.git> ~/.config/nvim
```

2. Start Neovim and let lazy.nvim install the plugins:
```bash
nvim
```

## Requirements

- Neovim 0.9.0 or higher
- Git

## License

This configuration is licensed under the MIT License - see the LICENSE file for details. 