return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern", -- "classic", "modern", or "helix"
    
    -- Document key groups
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
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps",
    },
  },
}
