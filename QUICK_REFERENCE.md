# ⚡ Quick Reference - Post Migración

## 🚀 Setup Rápido (Ejecutar Una Vez)

```bash
# 1. Ejecutar script de setup
~/.config/nvim/POST_MIGRATION.sh

# 2. Abrir Neovim
nvim

# 3. Dentro de Neovim:
:MasonInstall vtsls
:checkhealth
```

---

## ⌨️ Nuevos Keymaps

### Diagnósticos
| Keymap | Acción |
|--------|--------|
| `[d` | Diagnostic anterior |
| `]d` | Diagnostic siguiente |
| `<leader>cd` | Mostrar diagnostic en línea (float) |
| `<leader>cD` | Todos los diagnostics del documento (fzf) |
| `<leader>cw` | Todos los diagnostics del workspace (fzf) |

### LSP (TypeScript/JavaScript)
| Keymap | Acción |
|--------|--------|
| `<leader>th` | Toggle inlay hints (tipos, parámetros, etc.) |
| `gd` | Go to definition |
| `gr` | Go to references |
| `<leader>cr` | Rename symbol |
| `<leader>ca` | Code actions |

### Treesitter Textobjects
| Keymap | Acción |
|--------|--------|
| `vif` | Select inner function |
| `vaf` | Select outer function |
| `vic` | Select inner class |
| `vac` | Select outer class |
| `vao` | Select comment |
| `<leader>a` | Swap with next parameter |
| `<leader>A` | Swap with previous parameter |

### Which-Key Groups
| Prefix | Grupo |
|--------|-------|
| `<leader>c` | **C**ode actions |
| `<leader>d` | **D**ocument/Diagnostics |
| `<leader>f` | **F**ind/Files |
| `<leader>t` | **T**oggle |
| `<leader>w` | **W**orkspace |
| `g` | **G**oto operations |
| `[` | **Prev**ious items |
| `]` | **Next** items |

---

## 🛠️ Comandos Mason

```vim
" Ver todos los LSP/Tools instalados
:Mason

" Instalar vtsls (reemplaza ts_ls)
:MasonInstall vtsls

" Opcional: Desinstalar el antiguo TypeScript LSP
:MasonUninstall typescript-language-server

" Instalar otros LSP útiles
:MasonInstall lua_ls
:MasonInstall jsonls
:MasonInstall html
:MasonInstall cssls

" Ver info de Mason
:MasonLog
```

---

## 🌳 Comandos Treesitter

```vim
" Actualizar todos los parsers
:TSUpdate

" Actualizar parser específico
:TSUpdate typescript

" Ver parsers instalados
:TSInstallInfo

" Instalar parser
:TSInstall python
```

---

## 🔍 Health Checks

```vim
" Check general
:checkhealth

" Check específicos
:checkhealth lazy
:checkhealth mason
:checkhealth nvim-treesitter
:checkhealth lsp
```

---

## 🎨 Configuración de Inlay Hints

Los inlay hints están configurados para TypeScript/JavaScript y Lua.

**Para activar/desactivar en un archivo:**
```vim
" Toggle (en archivo TS/JS/Lua con LSP activo)
<leader>th
```

**Qué muestra:**
- Tipos de variables implícitos
- Tipos de parámetros
- Tipos de retorno de funciones
- Valores de enums
- Índices de arrays (Lua)

---

## 🐛 Troubleshooting

### vtsls no funciona
```vim
:MasonInstall vtsls
:LspRestart
```

### Diagnostics no se muestran
```vim
:lua vim.diagnostic.enable()
```

### Treesitter no colorea bien
```vim
:TSUpdate
:checkhealth nvim-treesitter
```

### Lazy.nvim no sincroniza
```vim
:Lazy sync
:Lazy clean
:Lazy update
```

### Which-key no muestra grupos
```vim
:Lazy update which-key.nvim
```

---

## 🔄 Comandos de Mantenimiento

```vim
" Actualizar todos los plugins
:Lazy sync

" Limpiar plugins no usados
:Lazy clean

" Ver estado de plugins
:Lazy

" Actualizar Treesitter
:TSUpdate

" Actualizar Mason tools
:MasonUpdate

" Ver log de Mason
:MasonLog
```

---

## 📊 Comparación Rápida

### LSP TypeScript/JavaScript
| Antes | Después |
|-------|---------|
| `ts_ls` | `vtsls` |
| Sin inlay hints | Con inlay hints completos |
| Configuración básica | Configuración completa |

### Diagnósticos
| Antes | Después |
|-------|---------|
| Sin navegación rápida | `[d` / `]d` |
| Solo `gl` para float | `<leader>cd` / `<leader>cD` / `<leader>cw` |
| Virtual text todo | Solo warnings/errors |

### UI
| Antes | Después |
|-------|---------|
| Borders inconsistentes | Todos redondeados |
| Which-key básico | Organizado en grupos |
| ShowkeysToggle siempre on | Off por defecto |

---

## 📚 Archivos de Documentación

| Archivo | Contenido |
|---------|-----------|
| `MIGRATION_SUMMARY.md` | Resumen ejecutivo de cambios |
| `MIGRATION_NOTES.md` | Documentación técnica completa |
| `QUICK_REFERENCE.md` | Esta guía rápida |
| `POST_MIGRATION.sh` | Script de setup automático |

---

## 🆘 Ayuda Rápida en Neovim

```vim
" Ver todos los keymaps de which-key
<leader>

" Ver keymaps del buffer actual
<leader>?

" Ayuda de LSP
:help lsp

" Ayuda de diagnostics
:help vim.diagnostic

" Ayuda de Mason
:help mason.nvim

" Ayuda de Treesitter
:help treesitter
```

---

## 🔙 Rollback Rápido

Si algo sale mal:

```bash
cd ~/.config
rm -rf nvim
tar -xzf nvim-backup-20250930-131358.tar.gz
nvim
```

---

**Última actualización:** 30 de Septiembre 2025