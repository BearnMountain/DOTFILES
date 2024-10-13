vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true -- highlights the line

-- term colors
opt.termguicolors = true
opt.background = "dark" -- color schemas will also choose dark mode
opt.signcolumn = "yes"

-- backspace 
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus") -- uses system clipboard as default register

-- window splitting
opt.splitright = true -- has the split go to the rightside of my window
