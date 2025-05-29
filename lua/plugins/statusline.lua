return { 
  'echasnovski/mini.statusline', 
  version = false, 
  opts = {},
  config = function()
    require('mini.statusline').setup()
    
    -- Personalizar solo el modo Insert
    vim.api.nvim_set_hl(0, 'MiniStatuslineModeInsert', { 
      fg = '#1e1e2e',  -- Texto negro/oscuro
      bg = '#a6e3a1',  -- Fondo verde claro
      bold = true 
    })
  end
} 
