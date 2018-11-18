" PLUGINS======================================================================={{{

call plug#begin('~/.vim/plugged')

" UTILITIES=====================================================================

Plug 'tpope/vim-markdown'
Plug 'scrooloose/syntastic'
Plug 'valloric/youcompleteme'
Plug 'pangloss/vim-javascript'
Plug 'octol/vim-cpp-enhanced-highlight'

" FUNCTIONALITY=================================================================

Plug 'tpope/vim-repeat' "Repeate actions
Plug 'tpope/vim-commentary' "For comments -> gc
Plug 'kana/vim-textobj-user' "TxtObj utility
Plug 'kana/vim-textobj-entire' "Entire textojb -> ie / ae
Plug 'kana/vim-textobj-line' "Line TextObj -> il / al
Plug 'suan/vim-instant-markdown' "Preview markdown

" CUSTOMIZTION=================================================================

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'nanotech/jellybeans.vim'

call plug#end ()
"}}}

" PLUGINS SETTINGS=============================================================={{{

" Syntastic{{{

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler_options = ' -std=c++17'

"}}}

" Jellybeans{{{
let g:jellybeans_use_term_italics = 1
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}
"}}}

" Ycm{{{
let g:ycm_auto_trigger = 1
let g:ycm_keep_logfiles = 1
let g:ycm_max_num_candidates = 7 
let g:ycm_show_diagnostics_ui = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_max_num_identifier_candidates = 7 
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_key_list_previous_completion = ['<S-Tab>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_semantic_triggers =  { 'cpp' : [' -> ', '.', '::', 're!gl', 're!GLFW', 're!GL', 're!GLEW'] }
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
set completeopt-=preview
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
" map <C-t> :NERDTreeToggle<CR>
"}}}

"}}}

" THEME SETTINGS================================================================{{{
syntax on
set background=dark
colorscheme jellybeans 
"}}}

" DEFINITIONS==================================================================={{{
autocmd FileType cpp set keywordprg=:!cppman
"}}}

" COMMON SETTINGS==============================================================={{{

set list
set shiftround
set encoding=utf-8
set listchars=tab:\ \ ,eol:¬
set wildmenu
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set number
set relativenumber
set showcmd
set autoread
set autoindent
set cindent
set incsearch
set hlsearch
set ignorecase 
set smartcase
set infercase
set cursorline
set nobackup
set noswapfile
set hidden
let @/ = ""
set cinoptions+=g0
set cpoptions+=x
au FileType * set fo-=c fo-=r fo-=o
hi Search cterm=NONE ctermfg=black ctermbg=darkcyan
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

" for gvim

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guifont=Fantasque\ Sans\ Mono\ 13

"}}}

" FOLDING======================================================================={{{

set foldlevelstart=0
set foldmethod=marker

nnoremap <Leader>z zzzMza

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

inoremap <S-Tab> <C-D> 

map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>

nnoremap <Leader>rr <C-w>=
nnoremap <Leader>rd :vertical resize 150 <CR> 
nnoremap <Leader>rs :vertical resize 59 <CR> 

nnoremap <Leader>d :bn <CR> :bd# <CR> 
nnoremap <Leader>w :wall<CR>
nnoremap <Leader>q :wq<CR>
nnoremap <Leader>Q :wqall<CR>

nnoremap <Leader>s :%s///g<left><left>
cnoremap :: <C-c>

nnoremap * *<c-o>
nnoremap n nzz
nnoremap N Nzz
nnoremap <Space> za

nnoremap <Leader>v "+p
nnoremap <Leader>c "+y

nnoremap H ^
nnoremap L g_

nnoremap <silent> <Leader><Space> :noh<CR>
map <F8> <C-w>v<C-l><C-w>s<C-h><Leader>rd

autocmd filetype cpp map <F5> diei// By Stefan Radu<CR><CR>#include <algorithm><CR>#include <iostream><CR>#include <iomanip><CR>#include <cassert><CR>#include <vector><CR>#include <string><CR>#include <cctype><CR>#include <queue><CR>#include <deque><CR>#include <cmath><CR>#include <map><CR>#include <set><CR><CR>using namespace std;<CR><CR>#define sz(x) (int)(x).size ()<CR><CR>typedef pair < int, int > pii;<CR>typedef long long ll;<CR>typedef long double ld;<CR>typedef unsigned int ui;<CR>typedef unsigned long long ull;<CR><CR>int main () {<CR><CR>ios::sync_with_stdio (false);<CR>cin.tie (0);cout.tie (0);<CR><CR>freopen ("input", "r", stdin);<CR>freopen ("output", "w", stdout);<CR>}<ESC><ESC>k

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

nnoremap Q :qall!<CR>
"}}}

" COMPILE======================================================================{{{

set shell=/bin/bash
autocmd filetype cpp nnoremap <F9> :wall <CR>:! clear && g++ -std=c++14 -O2 -pedantic -Wall -Wfatal-errors main.cpp -o main && TIMEFORMAT='\%3R' && time ./main <CR>

autocmd filetype cpp nnoremap <F10> :wall <CR>:! clear && TIMEFORMAT='\%3R' && time ./main <CR>

autocmd filetype cpp nnoremap <F11> :wall <CR>:! clear && g++ -std=c++14 -O2 -pedantic -Wall -Wfatal-errors % -o %:r && TIMEFORMAT='\%3R' && time ./%:r <CR>

autocmd filetype python nnoremap <F9> :wall <CR>:! clear && TIMEFORMAT='\%3R' && time python %<CR>
"}}}
