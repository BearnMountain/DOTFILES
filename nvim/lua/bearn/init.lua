require("bearn.remap")
require("bearn.core.options")

vim.lsp.set_log_level("OFF") -- Disable LSP logging

 -- ensures that ts highlighting is active for colorscheme
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    local buf = args.buf
    local filetype = vim.bo[buf].filetype

    -- Skip if the filetype is 'nvimtree' or doesn't have a tree-sitter parser
    if filetype == "nvimtree" then
      return
    end

    -- Check if a tree-sitter parser is available for the filetype
    local has_parser, _ = pcall(vim.treesitter.language.get_lang, filetype)
    if has_parser then
      -- Use pcall to safely execute the command
      pcall(vim.cmd, "TSBufEnable highlight")
    end
  end,
})

-- treats .rcss == .css files and .rml == .html

vim.api.nvim_exec([[
  augroup filetypedetect
    autocmd!
    autocmd BufRead,BufNewFile *.rcss setfiletype css
    autocmd BufRead,BufNewFile *.rml setfiletype html
  augroup END
]], false)



-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
-- 	pattern = { "*.tex" },
-- 	callback = function()
-- 		vim.cmd("!pdflatex *.tex")
-- 	end,
-- })

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

