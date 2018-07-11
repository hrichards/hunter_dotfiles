" ===== BASIC OPTIONS =====
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

" Tagbar Options
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>
let g:tagbar_type_tex = {
            \ 'ctagstype' : 'latex',
            \ 'kinds'     : [
            \ 's:sections',
            \ 'g:graphics:0:0',
            \ 'l:labels',
            \ 'r:refs:1:0',
            \ 'p:pagerefs:1:0'
            \ ],
            \ 'sort'    : 0,
            \ }
let g:tagbar_type_markdown = {
            \ 'ctagstype' : 'markdown',
            \ 'kinds' : [
            \ 'h:headings'
            \ ],
            \ 'sort' : 0,
            \ }

" Turn on solarized colorscheme
set background=dark
colorscheme solarized

" Pressing space after a search will clear all highlighting
nmap <SPACE> <SPACE>:noh<CR>

" Set status line format
set statusline=%F%m%r%h%w\ (%Y)\ %=\ r%l,\ c%v\ [%p%%]

function! SetFormatOptions()
    set fo+=1 " don't break lines after 1-letter words
    set fo+=2 " use 2nd paragraph line for indent
    set fo+=l " don't auto-break long lines
    set fo+=q " allow gq for formatting comments
    set fo-=c " don't auto-wrap comments
    set fo-=t " don't auto-wrap text
endfunction
call SetFormatOptions()

" Vim overwrites formatoptions, so we have to tell it to set these after it has
" already loaded everything
autocmd VimEnter * call SetFormatOptions()

" Diff-specific setup
func! DiffSetup()
    " Original version
    set nofoldenable foldcolumn=0 number
    set nocursorline
    set readonly
    set nomodifiable

    " Switch windows
    wincmd b

    " New version
    set nofoldenable foldcolumn=0 number

    wincmd =
    winpos 0 0
endfun
if &diff
    autocmd VimEnter * call DiffSetup()
endif

" jump to last position in a file when it is opened
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" ==== FILETYPE-SPECIFIC =====
let g:tex_flavor='latex'

" Make gq not mangle \item lists in latex
au FileType tex set formatlistpat=^\\s*\\\\\\(begin\\\\|end\\\\|item\\)\\>
au FileType tex set formatoptions+=n

" ==== GENERAL MAPS, ABBREVS, AND SHORTCUTS ====
" Remove all trailing whitespace with CTRL+G
nmap <C-g> :%s/\s\+$//g<CR>

" Turn off line numbering for the error buffer
au BufReadPost quickfix setlocal nonumber


" ====== Coffeescript Ctags support =====

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

let g:syntastic_python_checkers = ['pyflakes', 'pep8', 'flake8']

" Set default indent width to 2 for coffeescript files
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2

let g:syntastic_always_populate_loc_list = 1
