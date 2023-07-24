vim.g.mapleader = "\\"
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Window controls
vim.keymap.set("n", "<leader>|", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>:", vim.cmd.split)
vim.keymap.set("n", "<leader>C", vim.cmd.close)
