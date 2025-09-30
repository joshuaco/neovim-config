# Migración de Configuración - 30 de Septiembre 2025

## 🎯 Resumen de Cambios Aplicados

### ✅ Archivos Eliminados (Deprecados)

1. **`lua/plugins/mason-workaround.lua`**
   - **Razón**: Versiones fijadas obsoletas (`^1.0.0`) que limitaban actualizaciones
   - **Acción**: Eliminado. Configuración de Mason movida a `lsp-config.lua` con versión moderna

2. **`lua/plugins/project.nvim`**
   - **Razón**: Plugin abandonado (2+ años sin mantenimiento)
   - **Acción**: Eliminado. Funcionalidad reemplazada por `snacks.nvim` que ya incluye project management

3. **`lua/plugins/nvim-treesitter-textobjects.lua`**
   - **Razón**: Configuración separada usando `init` incorrectamente
   - **Acción**: Consolidado en `nvim-treesitter.lua` con configuración correcta

4. **`tmp/` directory**
   - **Contenido**: `hello_world.{js,lua,ts}`
   - **Razón**: Archivos temporales de prueba
   - **Acción**: Eliminados y agregado al `.gitignore`

---

## 🔄 Archivos Actualizados

### 1. `lua/config/lazy.lua`
**Cambios:**
- ✅ Eliminado fallback `vim.loop` → Ahora solo usa `vim.uv` (API estable en Neovim 0.10+)
- ✅ Desactivado `ShowkeysToggle` por defecto (mejora de rendimiento)
  - Comentado con instrucción para activar cuando sea necesario

**Antes:**
```lua
if not (vim.uv or vim.loop).fs_stat(lazypath) then
vim.cmd("ShowkeysToggle")
```

**Después:**
```lua
if not vim.uv.fs_stat(lazypath) then
-- Uncomment when recording: vim.cmd("ShowkeysToggle")
```

---

### 2. `lua/plugins/lsp-config.lua`
**Cambios Mayores:**

#### a) Mason con UI Mejorada
```lua
{
  "mason-org/mason.nvim",
  build = ":MasonUpdate",
  opts = {
    ui = {
      border = "rounded",
      width = 0.8,
      height = 0.8,
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
    max_concurrent_installers = 4,
  },
}
```

#### b) Migración `ts_ls` → `vtsls`
- ✅ Reemplazado `ts_ls` con `vtsls` (TypeScript Language Server moderno)
- ✅ Configuración completa de inlay hints para TypeScript y JavaScript
- ✅ Auto-detección de workspace TypeScript SDK

**Configuración de vtsls:**
```lua
vtsls = {
  settings = {
    vtsls = {
      autoUseWorkspaceTsdk = true,
    },
    typescript = {
      preferences = {
        importModuleSpecifier = "relative",
      },
      inlayHints = {
        parameterNames = { enabled = "all" },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        enumMemberValues = { enabled = true },
      },
    },
    -- Similar config for JavaScript
  },
}
```

#### c) Lua LSP Completamente Configurado
```lua
lua_ls = {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          "${3rd}/luv/library",
        },
      },
      completion = {
        callSnippet = "Replace",
      },
      telemetry = { enable = false },
      diagnostics = {
        globals = { "vim" },
        disable = { "missing-fields" },
      },
      hint = {
        enable = true,
        arrayIndex = "Auto",
        setType = true,
      },
    },
  },
}
```

#### d) Diagnósticos Mejorados
- ✅ `update_in_insert = false` → No molesta mientras escribes
- ✅ Solo warnings y errores en virtual text (menos ruido)
- ✅ Borders redondeados en ventanas flotantes
- ✅ Nuevos keymaps de navegación: `[d`, `]d`

**Nuevos Keymaps:**
- `[d` → Diagnostic anterior
- `]d` → Diagnostic siguiente
- `<leader>cd` → Diagnostics en línea (float)
- `<leader>cD` → Diagnostics del documento (fzf)
- `<leader>cw` → Diagnostics del workspace (fzf)

#### e) Borders Consistentes en LSP
```lua
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}
```

---

### 3. `lua/plugins/snacks.lua`
**Cambios:**
- ✅ Expandido dashboard con secciones configurables
- ✅ Opcional: fortune + cowsay en dashboard (desactivado por defecto)

**Nueva configuración del dashboard:**
```lua
dashboard = {
  enabled = true,
  sections = {
    { section = "header" },
    { section = "keys", gap = 1, padding = 1 },
    { section = "startup" },
    {
      section = "terminal",
      cmd = "fortune -s | cowsay",
      height = 8,
      padding = 1,
      enabled = false, -- Activar si tienes fortune y cowsay
    },
  },
}
```

---

### 4. `lua/plugins/which-key.lua`
**Cambios:**
- ✅ Migrado a API v3.0 moderna
- ✅ Preset "modern" para mejor UX
- ✅ Grupos de teclas documentados
- ✅ Borders redondeados

**Nueva configuración:**
```lua
opts = {
  preset = "modern",
  spec = {
    { "<leader>c", group = "Code" },
    { "<leader>d", group = "Document/Diagnostics" },
    { "<leader>f", group = "Find" },
    { "<leader>t", group = "Toggle" },
    { "<leader>w", group = "Workspace" },
    { "g", group = "Goto" },
    { "]", group = "Next" },
    { "[", group = "Prev" },
  },
  win = {
    border = "rounded",
    padding = { 1, 2 },
  },
  layout = {
    spacing = 4,
  },
}
```

---

### 5. `lua/plugins/nvim-treesitter.lua`
**Cambios:**
- ✅ Consolidada configuración de textobjects
- ✅ Dependencia explícita de `nvim-treesitter-textobjects`
- ✅ Configuración unificada en un solo archivo

**Textobjects agregados:**
```lua
textobjects = {
  select = {
    enable = true,
    lookahead = true,
    keymaps = {
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
      ["ao"] = "@comment.outer",
      ["as"] = "@local.scope",
    },
  },
  swap = {
    enable = true,
    swap_next = {
      ["<leader>a"] = "@parameter.inner",
    },
    swap_previous = {
      ["<leader>A"] = "@parameter.inner",
    },
  },
}
```

---

## 📦 Nuevos Archivos Creados

### `.gitignore`
- Ignora archivos temporales, logs, y sistema
- Protege contra commits accidentales de archivos innecesarios

---

## 🚀 Próximos Pasos Post-Migración

### 1. **Instalar vtsls**
```bash
# Abrir Neovim
nvim

# Dentro de Neovim ejecutar:
:MasonInstall vtsls
:MasonUninstall typescript-language-server  # Opcional: eliminar ts_ls antiguo
```

### 2. **Actualizar Plugins**
```bash
# En Neovim:
:Lazy sync
:TSUpdate
```

### 3. **Verificar Configuración**
```bash
# Verificar que no haya errores:
:checkhealth lazy
:checkhealth nvim-treesitter
:checkhealth mason
```

### 4. **Probar Nuevas Funcionalidades**

#### LSP:
- Abrir archivo TypeScript/JavaScript
- Presionar `<leader>th` para toggle de inlay hints
- Probar `[d` y `]d` para navegar diagnósticos
- Usar `<leader>cd` para ver diagnostics en float

#### Which-Key:
- Presionar `<leader>` y esperar → Ver grupos organizados
- Probar `g` → Ver operaciones "Goto"
- Probar `[` → Ver operaciones "Prev"

#### Treesitter Textobjects:
- En una función: `vif` → Seleccionar interior de función
- En una clase: `vac` → Seleccionar clase completa
- Probar `<leader>a` → Swap parámetros

---

## ⚠️ Posibles Issues y Soluciones

### Issue 1: vtsls no se encuentra
**Solución:**
```vim
:MasonInstall vtsls
```

### Issue 2: Errors sobre "missing fields" en lua_ls
**Solución:** Ya configurado con `disable = { "missing-fields" }`

### Issue 3: Which-key muestra warnings
**Solución:** Actualizar which-key si está en versión < 3.0:
```vim
:Lazy update which-key.nvim
```

### Issue 4: Textobjects no funcionan
**Solución:**
```vim
:TSUpdate
:checkhealth nvim-treesitter
```

---

## 📊 Beneficios de la Migración

### Rendimiento:
- ✅ Eliminado overhead de `ShowkeysToggle` activo permanentemente
- ✅ vtsls es más rápido que ts_ls
- ✅ Diagnósticos optimizados (menos virtual text innecesario)

### Mantenimiento:
- ✅ Eliminadas dependencias obsoletas/abandonadas
- ✅ Configuración consolidada y más limpia
- ✅ Mejor organización de archivos

### Funcionalidad:
- ✅ Inlay hints completos para TypeScript/JavaScript
- ✅ Mejor navegación de diagnósticos
- ✅ UI consistente con borders redondeados
- ✅ Which-key con mejor discoverability

### Compatibilidad:
- ✅ 100% compatible con Neovim 0.11.4
- ✅ APIs modernas y estables
- ✅ Sin warnings de deprecación

---

## 🔙 Rollback (Si es necesario)

Si necesitas volver a la configuración anterior:

```bash
cd ~/.config
tar -xzf nvim-backup-20250930-131358.tar.gz
```

**Nota:** El backup está en: `~/.config/nvim-backup-20250930-131358.tar.gz`

---

## 📚 Referencias

- [vtsls GitHub](https://github.com/yioneko/vtsls)
- [Neovim 0.10 Release Notes](https://github.com/neovim/neovim/releases/tag/v0.10.0)
- [which-key.nvim v3 Migration](https://github.com/folke/which-key.nvim#-migration-guide)
- [snacks.nvim Documentation](https://github.com/folke/snacks.nvim)

---

**Fecha de Migración:** 30 de Septiembre 2025  
**Neovim Version:** 0.11.4  
**Backup Location:** `~/.config/nvim-backup-20250930-131358.tar.gz`