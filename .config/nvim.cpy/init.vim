syntax enable
filetype plugin indent on

autocmd BufNewFile,BufRead *.rs set filetype=rust
autocmd BufWrite *.rs call CocAction('format')

call plug#begin()
" Rust tooling
Plug 'rust-lang/rust.vim'

" General autocomplete
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

" JavaScript
Plug 'prabirshrestha/vim-lsp'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-test/vim-test'
Plug 'sheerun/vim-polyglot'

" C & C++
Plug 'mfussenegger/nvim-dap'
Plug 'Pocco81/dap-buddy.nvim'
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'rhysd/vim-clang-format'
Plug 'jackguo380/vim-lsp-cxx-highlight'

" Navigation
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf.vim'

" IDE shell and look
Plug 'preservim/nerdtree'
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ldelossa/litee.nvim'
Plug 'ldelossa/litee-filetree.nvim'
Plug 'ldelossa/litee-symboltree.nvim'
Plug 'voldikss/vim-floaterm'

" Documentation
Plug 'tyru/open-browser.vim'

" Prose
Plug 'nvim-neorg/neorg', { 'do': ':Neorg sync-parsers' }
Plug 'ron89/thesaurus_query.vim'
Plug 'emilHof/poetry-vim'

" Github
Plug 'APZelos/blamer.nvim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'

" Makrdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Go
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua'
Plug 'neovim/nvim-lspconfig'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Zig
Plug 'ziglang/zig.vim'

" Markdown
Plug 'preservim/vim-markdown'

" Java
Plug '~/.local/share/nvim/eclim'

" AI
Plug 'madox2/vim-ai'
call plug#end()



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important!!
if has('termguicolors')
  set termguicolors
endif
" For dark version.
set background=dark
" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'medium'
" For better performance
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material

:set number
:set spell spelllang=en
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax and linting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\  'rust': ['analyzer'],
\}

let g:ale_fixers = { 'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines'] }

" Optional, configure as-you-type completions
" set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1
set tabstop=4
set shiftwidth=4

nnoremap ,, <Cmd>call CocActionAsync('jumpDefinition', 'drop')<CR>
nmap <silent> .. <Plug>(coc-references)

map <C-a> <esc>ggVG<CR>

" Autocomple key mappings
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"

vnoremap <y> <C-r>"1y
nnoremap <p> <C-r>"1p

nnoremap <leader><leader> <Cmd>bn<CR>
nnoremap == <Cmd>bp<CR>

" Movements
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" Language server stuff
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C++
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufWrite *.h,*.cc,*.cpp ClangFormat
autocmd BufNewFile,BufRead *.h,*.cc,*.cpp set filetype=cpp

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FzF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Preview window is hidden by default. You can toggle it with ctrl-/.
" It will show on the right with 50% width, but if the width is smaller
" than 70 columns, it will show above the candidate list
let g:fzf_preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/']
nnoremap <silent> <Leader>f :Rg<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>a :AI<CR>
xnoremap <leader>a :AI<CR>

nnoremap <leader>e :AIEdit could you please fix mistakes making snippet unsound<CR>
xnoremap <leader>e :AIEdit could you please fix mistakes making snippet unsound<CR>

nnoremap <leader>c :AIChat<CR>
xnoremap <leader>c :AIChat<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options for HTML closetag
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
let g:closetag_enable_react_fragment = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git Blame
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:blamer_enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Telescope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Poetry
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>P <CMD>Poet<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C++ Debugger
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
local dap = require('dap')
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/home/emilhofstetter/Downloads/cpptools-linux/extension/debugAdapters/bin/OpenDebugAD7',
}

local dap = require('dap')
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

vim.keymap.set("n", "<F4>", ":lua require('dapui').toggle()<CR>")
vim.keymap.set( "n", "<F5>", ":lua require('dap').toggle_breakpoint()<CR>" )
vim.keymap.set( "n", "<F9>", ":lua require('dap').continue()<CR>" )

vim.keymap.set( "n", "<F1>", ":lua require('dap').step_over()<CR>" )
vim.keymap.set( "n", "<F2>", ":lua require('dap').step_into()<CR>" )
vim.keymap.set( "n", "<F3>", ":lua require('dap').step_out()<CR>" )

vim.keymap.set( "n", "<F4>", ":lua require('dapui').toggle()<CR>" )

require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Use this to override mappings for specific elements
  element_mappings = {
    -- Example:
    -- stacks = {
    --   open = "<CR>",
    --   expand = "o",
    -- }
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7") == 1,
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  controls = {
    -- Requires Neovim nightly (or 0.8 when released)
    enabled = true,
    -- Display controls in this element
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "↻",
      terminate = "□",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
})

local dap_install = require("dap-buddy")
EOF

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lite Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
-- configure the litee.nvim library 
require('litee.lib').setup({
    tree = {
        icon_set = "codicons"
    },
    panel = {
        orientation = "left",
        panel_size  = 30
    }
})
-- configure litee-filetree.nvim
require('litee.filetree').setup({})
-- configure litee-symboltree.nvim
require('litee.symboltree').setup({})
EOF

nnoremap to <Cmd>LTOpenFiletree<CR>
nnoremap tp <Cmd>LTCloseFiletree<CR>
nnoremap tn <Cmd>LTTouchFiletree<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Floaterm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap   <silent>   <F7>    :FloatermNew<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F8>    :FloatermPrev<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F9>    :FloatermNext<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>

nnoremap <silent> <leader>ft :FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 <CR>

nnoremap <silent> t :FloatermToggle myfloat <CR>
tnoremap <silent> <Esc> <C-\><C-n>:q<CR>

let g:floaterm_width = 140
let g:floaterm_height = 50

nnoremap gi <Cmd>FloatermNew lazygit<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()
autocmd BufWritePre (InsertLeave?) <buffer> lua vim.lsp.buf.formatting_sync(nil,500)
lua << EOF
require 'go'.setup({
   goimport = "gopls",
   gofmt = 'gopls',
   max_line_len = 120,
   tag_transform = false,
   test_dir = '',
})
local protocol = require'vim.lsp.protocol'
EOF


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open Browser Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:openbrowser_search_engines = extend(
\ get(g:, 'openbrowser_search_engines', {}),
\ {
\   'rs': 'https://doc.rust-lang.org/std/?search={query}',
\   'cr': 'https://crates.io/search?q={query}',
\   'lr': 'https://lib.rs/search?q={query}',
\   'qt': 'https://doc.qt.io/qt-5/search-results.html?q={query}',
\ },
\ 'keep'
\)

nnoremap <silent> <leader>rs :call openbrowser#smart_search(expand('<cword>'), "rs")<CR>
nnoremap <silent> <leader>cr :call openbrowser#smart_search(expand('<cword>'), "cr")<CR>
nnoremap <silent> <leader>osq :call openbrowser#smart_search(expand('<cword>'), "qt")<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" turns on wrap for .md files
"

let g:vim_markdown_folding_disabled = 1
set conceallevel=2
let g:vim_markdown_fenced_languages = ['rust=rs', 'zig=zig', 'js=js']

augroup Markdown
  autocmd!
  autocmd FileType markdown set wrap
  autocmd FileType markdown set linebreak
augroup END

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }



" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '${name}'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is define according to the preferences of the system
let g:mkdp_theme = 'light'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neorg and Treesitter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "norg" },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}

require('neorg').setup {
    load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = {
                    main = "~/notes/main",
					todo = "~/notes/todo"
                },
				default_workspace = "main"
            },
        },
    },
}
EOF

