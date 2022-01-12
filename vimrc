" # Basic Options
set autoindent
set backspace=eol,indent,start
set backupskip=/tmp/*,/private/tmp/*"
set expandtab
set foldcolumn=0
set hidden
set hlsearch
set laststatus=2
set modeline
set modelines=2
set nocompatible
set nofoldenable
set nosmartindent
set nosmarttab
set nospell
set number
set pastetoggle=<F6>
set scrolloff=3
set shiftwidth=4
set shortmess=a
set showmatch
set softtabstop=4
set splitbelow
set splitright
set tabstop=4
set viminfo+=%
set wildmenu
set wildmode=longest:full,list:full
set wrap
set incsearch
set cursorline
syntax enable
filetype plugin indent on
set background=dark
colorscheme solarized

" # Shortcuts
" Remove all trailing whitespace with CTRL+G
nmap <C-g> :%s/\s\+$//g<CR>

" Pressing space after a search will clear all highlighting
nmap <SPACE> <SPACE>:noh<CR>

" # Syntastic Config
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_always_populate_loc_list = 1

" Tagbar config
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>
