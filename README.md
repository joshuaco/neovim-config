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

## Installation

1. Clone this repository:
```bash
git clone <your-repo-url> ~/.config/nvim
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