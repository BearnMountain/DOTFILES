require("bearn.remap")
require("bearn.core.options")

 -- ensures that ts highlighting is active for colorscheme
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "c", "h", "hpp" },
  callback = function()
    vim.cmd [[TSBufEnable highlight]]
  end,
})
