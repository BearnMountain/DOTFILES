
-- Disable LSP logging
vim.lsp.set_log_level("OFF") 

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



-- lsp applies to rmlui
vim.filetype.add({
	extension = {
		rcss = 'css',
		rml = 'html'
	}
})

-- turns off warnings
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

-- reformats file
function FormatBuffer()
    local save_cursor = vim.fn.getpos('.')
    local save_view = vim.fn.winsaveview()

    vim.api.nvim_command('normal! ggVG')
    vim.api.nvim_command('normal! ==')

    vim.fn.setpos('.', save_cursor)
    vim.fn.winrestview(save_view)
end
