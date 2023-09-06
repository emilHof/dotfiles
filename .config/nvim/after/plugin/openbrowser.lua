vim.cmd [[
let g:openbrowser_search_engines = extend(
\ get(g:, 'openbrowser_search_engines', {}),
\ {
\   'rs': 'https://doc.rust-lang.org/std/?search={query}',
\   'cr': 'https://crates.io/search?q={query}',
\   'qt': 'https://doc.qt.io/qt-5/search-results.html?q={query}',
\ },
\ 'keep'
\)
]]

vim.keymap.set(
	"n",
	"<leader>rs",
	":call openbrowser#smart_search(expand('<cword>'), \"rs\")<CR>",
	{ silent = true }
)
vim.keymap.set(
	"n",
	"<leader>cr",
	":call openbrowser#smart_search(expand('<cword>'), \"cr\")<CR>",
	{ silent = true }
)
vim.keymap.set(
	"n",
	"<leader>osq",
	":call openbrowser#smart_search(expand('<cword>'), \"qt\")<CR>",
	{ silent = true }
)
