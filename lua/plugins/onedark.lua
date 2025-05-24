return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function()
      require("onedarkpro").setup({
        -- Elegir el estilo del tema
        style = "onedark_vivid", -- Opciones: 'onedark', 'onelight', 'onedark_vivid', 'onedark_dark'
        
        -- Configuraciones opcionales
        options = {
          transparency = false, -- Habilitar fondo transparente
          terminal_colors = true, -- Usar colores del tema en la terminal
          highlight_inactive_windows = false,
          bold = true,  -- Usar negritas en la sintaxis
          italic = true, -- Usar cursivas en la sintaxis
        },
        
        -- Puedes personalizar colores específicos si lo deseas
        colors = {}, -- Mantener colores por defecto
        
        -- Plugins que soporta el tema
        plugins = {
          nvim_tree = true,
          telescope = true,
          treesitter = true,
        },
      })

      -- Establecer el tema
      vim.cmd("colorscheme onedark_vivid")
    end,
  }
}
