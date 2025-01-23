require("bearn.remap")
require("bearn.core.options")

 -- ensures that ts highlighting is active for colorscheme
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "c", "h", "hpp", "js", "html", "css", "rs" },
  callback = function()
    vim.treesitter.start();
  end,
})

vim.diagnostic.config({
  virtual_text = {
    severity = { min = vim.diagnostic.severity.ERROR } -- Show only errors
  },
  signs = {
    severity = { min = vim.diagnostic.severity.WARN } -- Ignore hints and show only warnings/errors
  },          -- Keep signs visible
  underline = true,      -- Underline errors
  update_in_insert = false, -- Don't show messages while typing
})
