return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  dependencies = { "echasnovski/mini.icons" },
  opts = {},
  keys = {
    { 
      "<leader>ff",
      function() require('fzf-lua').files() end,
      desc = "[F]ind [F]iles in current working directory"
    },
    { 
      "<leader>fg",
      function() require('fzf-lua').live_grep() end,
      desc = "[F]ind [G]rep"
    },
    {
      "<leader>fh",
      function() require("fzf-lua").helptags() end,
      desc = "[F]ind [H]elp",
    },
    {
      "<leader>fk",
      function() require("fzf-lua").keymaps() end,
      desc = "[F]ind [K]eymaps",
    }
  }
}
