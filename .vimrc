" PLUGINS======================================================================={{{

call plug#begin('~/.vim/plugged')

" UTILITIES=====================================================================

Plug 'neomake/neomake' " Linting
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'tpope/vim-markdown' " Markdown syntax
Plug 'scrooloose/nerdtree' " File treeview
Plug 'sheerun/vim-polyglot' " Sintax highlighting for everyhting
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocompleter
Plug 'reisub0/hot-reload.vim' " Autoreloads flutter when saving
Plug 'tiagofumo/dart-vim-flutter-layout' " Better indentation for dart code

" FUNCTIONALITY=================================================================

Plug 'tpope/vim-repeat' " Repeate actions
Plug 'tpope/vim-commentary' " For comments -> gc
Plug 'kana/vim-textobj-user' " TxtObj utility
Plug 'kana/vim-textobj-entire' " Entire textojb -> ie / ae
Plug 'kana/vim-textobj-line' " Line TextObj -> il / al
Plug 'iamcco/markdown-preview.vim' " Markdown preview

" CUSTOMIZTION=================================================================

Plug 'vim-airline/vim-airline' " Airline status
Plug 'vim-airline/vim-airline-themes'

Plug 'nanotech/jellybeans.vim' " The theme

call plug#end ()

"}}}

" PLUGINS SETTINGS=============================================================={{{

" Jellybeans{{{

let g:jellybeans_use_term_italics = 1
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}

"}}}

" Airline{{{

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'unicode'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

"}}}

" NerdTree{{{

map <C-t> :NERDTreeToggle<CR>

"}}}

" NeoMake{{{

call neomake#configure#automake('rw')
let g:neomake_python_flake8_maker = {
    \ 'args': ['--ignore=E128,E221,E241,E272,E251,W702,E203,E201,E202',  '--format=default'],
    \ 'errorformat':
        \ '%E%f:%l: could not compile,%-Z%p^,' .
        \ '%A%f:%l:%c: %t%n %m,' .
        \ '%A%f:%l: %t%n %m,' .
        \ '%-G%.%#',
    \ }
let g:neomake_python_enabled_makers = ['flake8']

"}}}

" Polyglot{{{

let g:polyglot_disabled = ['markdown']

"}}}

" Deoplete{{{

let g:deoplete#enable_at_startup = 1
inoremap <expr><Tab>  pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"

""}}}

"}}}

" THEME SETTINGS================================================================{{{

syntax on
colorscheme jellybeans 

"}}}

" COMMON SETTINGS==============================================================={{{

" Search
set hlsearch
set incsearch
set smartcase
set ignorecase 
set infercase

" Search hightlight color
hi Search cterm=NONE ctermfg=black ctermbg=blue 

" Spaces and tabs 
set tabstop=2
set softtabstop=2
set expandtab " Use spaces insted of tabs
set shiftround " Use multiples of shiftwidth when << >> 
set shiftwidth=2

" Find file
set wildmenu
set path+=**
set wildignore+=**/node_modules/**
set hidden

" LineBreaking
set wrap
set linebreak

" Text wrap mark
au BufWinEnter * let w:m1=matchadd('ErrorMsg', '\%81v.', -1)

" Spell Check
set spelllang=en_gb

" UI config
set mouse=a
set number
set relativenumber
set showcmd
set list
set listchars=tab:\ \ ,eol:¬ " End of line character
set cursorline " Highlight current line
" set lazyredraw
set encoding=utf-8
set updatetime=300
set cmdheight=2
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Don't backup
set nobackup
set noswapfile

" Indentation
set cinoptions+=g0
set cpoptions+=x

" Folding
set foldlevelstart=0
set foldmethod=marker

function! MyFoldText() " 
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " 

set foldtext=MyFoldText()

"}}}

" MAPINGS======================================================================={{{

" No arrows in normal mode
nmap <Up> <Nop>
nmap <Down> <Nop>
nmap <Left> <Nop>
nmap <Right> <Nop>

" Resize buffer
nnoremap <Leader>rr <C-w>
nnoremap <Leader>rd :vertical resize 150 <CR> 
nnoremap <Leader>rs :vertical resize 59 <CR> 
map <F8> <C-w>v<C-l><C-w>s<C-h><Leader>rd

" Save and quit 
nnoremap <Leader>d :bd!<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :wall!<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qall!<CR>
map Q <Nop>

" Search
nnoremap * *<c-o>
nnoremap n nzz
nnoremap N Nzz
nnoremap <Leader>s :%s///g<left><left>

" Cancel command
cnoremap :: <C-c>

" Close folds
nnoremap <Space> za

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Go to first character in line
nnoremap H ^

" Go to last character in line
nnoremap L g_

" Clear search highlight
nnoremap <silent> <Leader><Space> :noh<CR>

" Navigate windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Don't jump lines when wrapped
nnoremap j gj
nnoremap k gk

" Next buffer
nnoremap <Tab> :bn<CR> 

" Previous buffer
nnoremap <S-Tab> :bp<CR>

" Propper indentation for flutter
autocmd filetype dart inoremap ) }<Backspace>)
autocmd filetype dart inoremap ] }<Backspace>]

"}}} 

" RESET TO DEFAULT C++ FILE ==================================================={{{

autocmd filetype cpp map <F5> diei// By Stefan Radu<CR><CR>#include <algorithm><CR>#include <iostream><CR>#include <iomanip><CR>#include <cassert><CR>#include <vector><CR>#include <string><CR>#include <cctype><CR>#include <queue><CR>#include <deque><CR>#include <cmath><CR>#include <stack><CR>#include <map><CR>#include <set><CR><CR>using namespace std;<CR><CR>#define sz(x) (int)(x).size()<CR><CR>typedef pair < int, int > pii;<CR>typedef long long ll;<CR>typedef long double ld;<CR>typedef unsigned int ui;<CR>typedef unsigned long long ull;<CR><CR>int main() {<CR><CR>#ifdef STEF<CR>freopen("input", "r", stdin);<CR>freopen("output", "w", stdout);<CR>#endif<CR><CR>ios::sync_with_stdio(false);<CR>cin.tie(0);cout.tie(0);<CR><CR>}<ESC><ESC>k

"}}}

" COMPILE======================================================================{{{

set shell=/bin/bash

autocmd filetype cpp nnoremap <F9> :wall <CR>:! g++ -std=c++17 -DSTEF -O2 -pedantic -Wall -Wfatal-errors main.cpp -o main && TIMEFORMAT='\%3R' && time ./main <CR>

autocmd filetype cpp nnoremap <F10> :wall <CR>:! g++ -std=c++17 -DSTEF -O2 -pedantic -Wall -Wfatal-errors % -o %:r && TIMEFORMAT='\%3R' && time ./%:r <CR>

autocmd filetype c nnoremap <F9> :wall <CR>:! gcc -std=c11 main.c -o main && TIMEFORMAT='\%3R' && time ./main <CR>

autocmd filetype python nnoremap <F9> :wall <CR>:! TIMEFORMAT='\%3R' && time python %<CR>
"}}}
