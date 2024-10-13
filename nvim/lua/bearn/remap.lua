vim.g.mapleader = " "
vim.keymap.set("n", "<leader>lv", vim.cmd.Ex)

-- deletion
vim.keymap.set("n", "dd", "_dd", { noremap=true }) -- deletes dont send info to register
vim.keymap.set("n", "dw", "daW") -- deletes entire word

-- increment
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- window managment
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "make split window equal size" }) -- make split window equal size
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "closes current split window" }) -- closes current split window

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "new tab" })   -- new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "close tab" }) -- close tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "next tab" })     -- next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "prev tab" })     -- prev tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "opens current buffer in new tab" }) -- opens current buffer in new tab
