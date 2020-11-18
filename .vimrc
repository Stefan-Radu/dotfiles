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

" Polyglot{{{

let g:polyglot_disabled = ['markdown', 'css']

"}}}

" Markdown{{{

set conceallevel=2
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_new_list_item_indent = 0

" VimWiki like
autocmd filetype markdown map <CR> ge
autocmd filetype markdown nnoremap <Backspace> <C-O>

" Markdown preview

let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 1

"}}}

" COC{{{

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:coc_node_path = substitute(system('which node'), '\n', '', '')

"}}}

" NETRW {{{

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'

"}}}

" Fzf {{{

nnoremap <C-p> :GFiles<Cr>
nnoremap <C-f> :FZF<Cr>

"}}}

" Ale {{{

let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}

"}}}

" Haskell {{{

let g:haskell_classic_highlighting = 1
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 1
let g:cabal_indent_section = 2

"}}}

" Tex {{{

let g:vimtex_fold_enabled = 1
let g:tex_flavor = 'latex'

"}}}

"}}}

" PLUGINS======================================================================={{{

call plug#begin('~/.vim/plugged')

" UTILITIES=====================================================================

Plug 'sheerun/vim-polyglot' " Sintax highlighting for everyhting
Plug 'neovimhaskell/haskell-vim' " Haskell stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocompleter
Plug 'w0rp/ale' " linting
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'reisub0/hot-reload.vim' " Autoreloads flutter when saving
Plug 'plasticboy/vim-markdown' "Markdown mode
Plug 'lervag/vimtex'

" FUNCTIONALITY=================================================================

Plug 'tpope/vim-repeat' " Repeate actions
Plug 'tomtom/tcomment_vim' " For comments
Plug 'kana/vim-textobj-user' " TxtObj utility
Plug 'kana/vim-textobj-entire' " Entire textojb -> ie / ae
Plug 'kana/vim-textobj-line' " Line TextObj -> il / al
Plug 'iamcco/markdown-preview.vim' " Markdown preview
Plug 'alvan/vim-closetag' " Close tags auto
Plug 'christoomey/vim-tmux-navigator' " Smooth navigation with tmux

" CUSTOMIZTION=================================================================

Plug 'vim-airline/vim-airline' " Airline status

Plug 'nanotech/jellybeans.vim' " The theme
Plug 'morhetz/gruvbox' " The other theme

call plug#end ()

"}}}

" THEME SETTINGS================================================================{{{

syntax on
" colorscheme jellybeans 
colorscheme gruvbox 
hi Normal guibg=NONE ctermbg=NONE

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

" Indentation
set tabstop=2
set softtabstop=2
set expandtab " Use spaces insted of tabs
set shiftround " Use multiples of shiftwidth when << >> 
set shiftwidth=2
set cinoptions+=g0
set cpoptions+=x

" don't let python override indentations settings
let g:python_recommended_style=0

" 80 char line
autocmd filetype python match OverLength /\%>80v.\+/
highlight OverLength ctermbg=darkyellow ctermfg=grey

" Find file
set wildmenu
set path+=**
set wildignore+=**/node_modules/**
set hidden

" LineBreaking
set wrap
set linebreak

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
set encoding=utf-8
set updatetime=300
set cmdheight=2
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Don't backup
set nobackup
set noswapfile

" Persistend undo
set undodir=~/.vim/undodir
set undofile

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
nnoremap <Leader>rd :vertical resize 150 <CR> 
nnoremap <Leader>rs :vertical resize 59 <CR> 
map <F8> <C-w>v<C-l><C-w>s<C-h><Leader>rd

" Save and quit 
nnoremap <Leader>d :bd!<CR>
nnoremap <Leader>w :w<CR>
map Q <Nop>

" Search
nnoremap * *``
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

"}}} 

" RESET TO DEFAULT C++ FILE ==================================================={{{

autocmd filetype cpp map <F5> diei// By Stefan Radu<CR><CR>#include <bits/stdc++.h><CR><CR>using namespace std;<CR><CR>#define sz(x) (int)(x).size()<CR><CR>typedef pair < int, int > pii;<CR>typedef long long ll;<CR>typedef long double ld;<CR>typedef unsigned int ui;<CR>typedef unsigned long long ull;<CR><CR>int main() {<CR><CR>#ifdef STEF<CR>freopen("input", "r", stdin);<CR>freopen("output", "w", stdout);<CR>#endif<CR><CR>ios::sync_with_stdio(false);<CR>cin.tie(0);cout.tie(0);<CR><CR>}<ESC><ESC>k 
"}}}

" COMPILE======================================================================{{{

set shell=/bin/bash

autocmd filetype cpp nnoremap <F9> :wall <CR>:! g++ -std=c++17 -DSTEF -O2 -pedantic -Wall -Wfatal-errors main.cpp -o main && TIMEFORMAT='\%3R' && time ./main <CR>

autocmd filetype cpp nnoremap <F10> :wall <CR>:! g++ -std=c++17 -DSTEF -O2 -pedantic -Wall -Wfatal-errors % -o %:r && TIMEFORMAT='\%3R' && time ./%:r <CR>

autocmd filetype c nnoremap <F9> :wall <CR>:! gcc -std=c11 -O2 -pedantic -Wall -Wfatal-errors main.c -o main && TIMEFORMAT='\%3R' && time ./main <CR>

autocmd filetype c nnoremap <F10> :wall <CR>:! gcc -std=c11 -O2 -pedantic -Wall -Wfatal-errors % -o %:r && TIMEFORMAT='\%3R' && time ./%:r <CR>

autocmd filetype rust nnoremap <F9> :wall <CR>:! cargo run<CR>

autocmd filetype python nnoremap <F9> :wall <CR>:! TIMEFORMAT='\%3R' && time python %<CR>

autocmd filetype sh nnoremap <F9> :wall <CR>:! ./% <CR>

autocmd filetype haskell nnoremap <F9> :wall <CR>:! ghc % -o %:r && TIMEFORMAT='\%3R' && time ./%:r <CR>

"}}}
