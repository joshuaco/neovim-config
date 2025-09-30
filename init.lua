require("config.lazy")

vim.opt.guicursor = "n-v-c:block,i-ci:ver25"
vim.api.nvim_create_autocmd("VimLeave", {
   callback = function()
      vim.opt.guicursor = "a:ver25-blinkon1" -- or 'a:block'
   end,
})
