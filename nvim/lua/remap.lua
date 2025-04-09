vim.g.mapleader = " "
vim.keymap.set("n", "<leader>lv", vim.cmd.Ex)

-- deletion
vim.keymap.set("n", "dd", "_dd", { noremap=true }) 
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d",        { desc = "deletes without saving to register"})
-- indentation
vim.keymap.set("v", "<", "<gv",                        { desc = "right shifts line" })
vim.keymap.set("v", ">", ">gv",                        { desc = "left shifts line" })
vim.keymap.set("n", "<leader>=", FormatBuffer,         { desc = "retab entire file" })

-- window managment
vim.keymap.set("n", "<leader>sv", "<C-w>v",            { desc = "split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s",            { desc = "split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=",            { desc = "make split window equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>",    { desc = "closes current split window" }) 

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>",   { desc = "new tab" })   
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "close tab" }) 
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>",     { desc = "next tab" })  
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>",     { desc = "prev tab" })  
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "opens current buffer in new tab" }) 

-- preferences
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })





