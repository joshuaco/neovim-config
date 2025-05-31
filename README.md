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
- Full LSP support with Mason integration
- Modern completion engine with blink.cmp
- Automatic code formatting with conform.nvim
- Modern UI components with snacks.nvim
- Fast fuzzy finding with fzf-lua

## Plugins Details

This configuration includes the following carefully selected plugins:

### Core Plugins
- **[lazy.nvim](https://github.com/folke/lazy.nvim)** - Modern plugin manager for Neovim

### LSP & Development
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - Quickstart configs for Nvim LSP
- **[mason.nvim](https://github.com/mason-org/mason.nvim)** - Portable package manager for Neovim that runs everywhere
- **[mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim)** - Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
- **[mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)** - Install or upgrade all of your third-party tools
- **[fidget.nvim](https://github.com/j-hui/fidget.nvim)** - Extensible UI for Neovim notifications and LSP progress messages

### Completion & Formatting
- **[blink.cmp](https://github.com/saghen/blink.cmp)** - Modern completion engine with Rust-powered fuzzy matching
- **[friendly-snippets](https://github.com/rafamadriz/friendly-snippets)** - Collection of snippets for various languages
- **[conform.nvim](https://github.com/stevearc/conform.nvim)** - Lightweight yet powerful formatter plugin with format-on-save

### Syntax & Language Support
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Treesitter configurations and abstraction layer
- **[nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)** - Syntax aware text-objects, select, move, swap, and peek support

### UI & Navigation
- **[snacks.nvim](https://github.com/folke/snacks.nvim)** - Collection of small QoL plugins for Neovim (dashboard, explorer, indent guides, etc.)
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

## Key Features

### LSP Integration
- Full Language Server Protocol support with automatic installation via Mason
- Intelligent code completion and diagnostics with blink.cmp
- Go to definition, references, and implementations using fzf-lua
- Real-time error and warning display with custom diagnostic signs
- Inlay hints support for supported language servers

### Code Completion & Formatting
- High-performance completion engine powered by Rust fuzzy matching
- LSP-based completions with path, buffer, and snippet support
- Automatic code formatting on save with conform.nvim
- Support for multiple formatters per language (stylua, prettier, etc.)
- Signature help integration for function parameters

### Modern UI
- Dashboard with snacks.nvim for a welcoming start screen
- File explorer that works like a buffer with oil.nvim
- Fast fuzzy finding for files, grep, help tags, and keymaps
- Project-aware workflow with automatic project detection
- Visual indicators and progress notifications

### Developer Experience
- Automatic indentation detection with vim-sleuth
- Syntax highlighting and text objects with Tree-sitter
- Which-key integration for discoverable keybindings
- Snippet support for faster code writing
- Format-on-save for consistent code style

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
- FzF
- Node.js (for prettier and other formatters)
- Rust toolchain (optional, for optimal blink.cmp performance)

## License

This configuration is licensed under the MIT License - see the LICENSE file for details. 