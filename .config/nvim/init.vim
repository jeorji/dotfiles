call plug#begin()
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'preservim/nerdtree'
    Plug 'preservim/nerdcommenter'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'ellisonleao/gruvbox.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'ggandor/leap.nvim'
call plug#end()

lua require('init')

let mapleader = " "
command! FF :lua vim.lsp.buf.format() 

"" PLUGINS
"fzf
map <leader>ff :Files .<CR>
map <leader>fb :Buffers <CR>

"nerdtree
nmap <silent> <C-n> :NERDTreeToggleVCS<CR>
let g:NERDTreeMinimalMenu=1

"" MAPPINGS
"in-buffer navigation
map ; :
noremap ;; ;
map U :redo<CR>
imap fj <esc>
map gs 0
map gl $
nmap <leader>h :noh<CR>

"disable arrows
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

"clipboard
map <leader>y "+y
map <leader>p "+p
map <leader>Y "+Y
map <leader>P "+P

"" OTHER
"colors
set termguicolors
colorscheme gruvbox

"C-n complete options
set completeopt=menu,menuone,noselect,noinsert

"status bar
run statusbar.vim

"Disable code folding
set nofoldenable
"Use vim-specific settings, not vi compatibility mode
set nocompatible
"Ignore case when searching
set ignorecase
"Incremental search, show matching text as you type
set incsearch
"Use smart case when searching, ignore case unless uppercase characters are used
set smartcase
"Break lines at word boundaries when wrapping text
set linebreak
"Set the width of a tab character to 4 spaces
set tabstop=4
"Set the number of spaces to use for each level of indentation
set shiftwidth=4
"Use spaces instead of tabs for indentation
set expandtab
"Use syntax highlighting to determine where to fold code
set foldmethod=syntax
"Enable a menu for wild card completion
set wildmenu
"Set the number of lines to keep visible above/below the cursor when scrolling
set scrolloff=6
"Show line numbers
set number
"Show relative line numbers, with the current line as 0
set relativenumber
"Highlight the current line
set cursorline
"Enable mouse support
set mouse=a
"Disable creation of swap files
set noswapfile
