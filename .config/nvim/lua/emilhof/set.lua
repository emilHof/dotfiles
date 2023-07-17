vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.wrap = true

vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.signcolumn = "yes"

vim.opt.colorcolumn = "100"

vim.rustfmt_autosave = 1

vim.opt.conceallevel = 2

vim.cmd("set spell")
