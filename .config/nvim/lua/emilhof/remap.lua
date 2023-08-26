vim.g.mapleader = "\\"
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Window controls
vim.keymap.set("n", "<leader>|", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>:", vim.cmd.split)
vim.keymap.set("n", "<leader>C", vim.cmd.close)
vim.keymap.set("n", "<leader>T", function()
	vim.cmd.vsplit();
	vim.cmd("term");
	vim.cmd.startinsert();
end)

-- Terminal buffer controls
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>:q<CR>", { silent = true })
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>:q<CR>", { silent = true })
vim.keymap.set("t", "<Esc>", "", { silent = true })
vim.keymap.set("t", "<C-w>h", "<C-\\><C-n><C-w>h", { silent = true })
vim.keymap.set("t", "<C-w>j", "<C-\\><C-n><C-w>j", { silent = true })
vim.keymap.set("t", "<C-w>k", "<C-\\><C-n><C-w>k", { silent = true })
vim.keymap.set("t", "<C-w>l", "<C-\\><C-n><C-w>l", { silent = true })

-- Dir Navigation
vim.keymap.set("n", "<leader>V", ":e $HOME/.config/nvim/.<CR>", { silent = true })
