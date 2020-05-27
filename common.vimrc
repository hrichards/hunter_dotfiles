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

" # Advanced Options
" Turn on solarized colorscheme
set background=dark
colorscheme solarized

" Turn off line numbering for the error buffer
au BufReadPost quickfix setlocal nonumber

" Set status line format
set statusline=%F%m%r%h%w\ (%Y)\ %=\ r%l,\ c%v\ [%p%%]

" jump to last position in a file when it is opened
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" # Shortcuts
" Remove all trailing whitespace with CTRL+G
nmap <C-g> :%s/\s\+$//g<CR>

" Pressing space after a search will clear all highlighting
nmap <SPACE> <SPACE>:noh<CR>

" # Syntastic Config
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_always_populate_loc_list = 1

" # Python Config
au FileType python set textwidth=99

" # Tagbar configs, per filetype
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

" The following config should assume some kind of `ctags` is installed, but
" filetypes relying on other executables should use an `if executable` guard.
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

if executable('rst2ctags')
  let g:tagbar_type_rst = {
      \ 'ctagstype': 'rst',
      \ 'ctagsbin' : 'rst2ctags',
      \ 'ctagsargs' : '-f - --sort=yes',
      \ 'kinds' : [
          \ 's:sections',
          \ 'i:images'
      \ ],
      \ 'sro' : '|',
      \ 'kind2scope' : {
          \ 's' : 'section',
      \ },
      \ 'sort': 0,
  \ }
endif

let g:tagbar_type_yaml = {
    \ 'ctagstype' : 'yaml',
    \ 'kinds' : [
        \ 'a:anchors',
        \ 's:section',
        \ 'e:entry'
    \ ],
  \ 'sro' : '.',
    \ 'scope2kind': {
      \ 'section': 's',
      \ 'entry': 'e'
    \ },
    \ 'kind2scope': {
      \ 's': 'section',
      \ 'e': 'entry'
    \ },
    \ 'sort' : 0
\ }
