return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    -- Configuración para mostrar archivos ocultos
    view_options = {
      -- Mostrar archivos y directorios que empiezan con "."
      show_hidden = false,
    },
    -- Keymaps para alternar la visualización
    keymaps = {
      -- Usa g. para alternar archivos ocultos (viene por defecto)
      ["g."] = { "actions.toggle_hidden", mode = "n" },
    },
  },
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
