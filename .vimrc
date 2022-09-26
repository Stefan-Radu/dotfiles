" PLUGINS SETTINGS===================================================={{{

filetype plugin on 

" Airline {{{

let g:airline#extensions#tabline#enabled = 1

"}}}

" COC {{{

" Use tab and s-tab for completion
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

let g:coc_node_path = substitute(system('which node'), '\n', '', '')

" Use K to show documentation in preview window.
nnoremap <silent> <leader>gk :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ca  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" extensions
let g:coc_global_extensions = [
      \'coc-html',
      \'coc-pyright',
      \'coc-json',
      \'coc-go',
      \'coc-css',
      \'coc-clangd',
      \]
"}}}

" Markdown {{{

set conceallevel=2
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_autowrite = 1
let g:vim_markdown_auto_insert_bullets = 1

let g:mkdp_refresh_slow = 1

"}}}

" LaTeX {{{

let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 0
let g:livepreview_engine = 'lualatex'
let g:livepreview_use_biber = 1
let g:tex_flavor='latex'

"}}}

" NETRW {{{

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'

"}}}

" Fzf {{{

nnoremap <leader>f :GFiles<Cr>
nnoremap <leader>F :FZF<Cr>

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

" Startify {{{

"if winwidth(0) <= 120
  "let g:startify_padding_left = winwidth(0) / 6
"else
  "let g:startify_padding_left = winwidth(0) / 3
"endif

"let g:startify_ascii = [
      "\ ' ███▄    █ ▓█████  ▒█████      ██▒   █▓ ██▓ ███▄ ▄███▓',
      "\ ' ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒   ▓██░   █▒▓██▒▓██▒▀█▀ ██▒',
      "\ '▓██  ▀█ ██▒▒███   ▒██░  ██▒    ▓██  █▒░▒██▒▓██    ▓██░',
      "\ '▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░     ▒██ █░░░██░▒██    ▒██ ',
      "\ '▒██░   ▓██░░▒████▒░ ████▓▒░      ▒▀█░  ░██░▒██▒   ░██▒',
      "\ '░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░       ░ ▐░  ░▓  ░ ▒░   ░  ░',
      "\ '░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░       ░ ░░   ▒ ░░  ░      ░',
      "\ '   ░   ░ ░    ░   ░ ░ ░ ▒          ░░   ▒ ░░      ░   ',
      "\ '         ░    ░  ░    ░ ░           ░   ░         ░   ',
      "\ '                                   ░                  ',
      "\ ]

"let g:startify_custom_header = 'startify#center(g:startify_ascii)'

"}}}

" Blamer {{{

let g:blamer_enabled = 0
let g:blamer_delay = 3000
let g:blamer_prefix = ' >_ '
let g:blamer_date_format = '%d/%m/%y'
let g:blamer_template = '<author> <author-time> [<commit-short>]'

"}}}

"}}}

" PLUGINS============================================================={{{

call plug#begin('~/.vim/plugged')

"Comment functions so powerful—no comment necessary.
Plug 'scrooloose/nerdcommenter'

" Vim syntax highlighting for c, bison, flex
Plug 'justinmk/vim-syntax-extra'
" Enhanced version of the original Vim 6.1 Python syntax highlighting
Plug 'vim-python/python-syntax'
" Delete buffers and close files in Vim without messing up your layout.
Plug 'moll/vim-bbye', { 'on': 'Bdelete' }
" Show git blame
Plug 'apzelos/blamer.nvim'
" Pasting in Vim with indentation adjusted to destination context.
Plug 'sickill/vim-pasta'

" Intellisense engine for vim8 & neovim
" Full language server protocol support as VSCode
if has('nvim')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

" Markdown mode
Plug 'plasticboy/vim-markdown'
" Markdown live preview
Plug 'iamcco/markdown-preview.vim'

" LaTeX live preview
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" A modern Vim and neovim filetype plugin for LaTeX files.
Plug 'lervag/vimtex', {'for': ['tex', 'context', 'bib', 'latex', 'plaintex']}

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Repeate actions with <.> command
Plug 'tpope/vim-repeat'
" TxtObj utility - allows implementation of addition text objects
Plug 'kana/vim-textobj-user'
" Entire textojb -> ie / ae
Plug 'kana/vim-textobj-entire'
" Line TextObj -> il / al
Plug 'kana/vim-textobj-line'
" Even more text objects
Plug 'wellle/targets.vim'
" Close tags auto (for html/xml)
Plug 'alvan/vim-closetag'
" Surround text objects
Plug 'tpope/vim-surround'

" Smooth navigation with tmux
Plug 'christoomey/vim-tmux-navigator'
" Make clipboard usable in wayland
Plug 'jasonccox/vim-wayland-clipboard'

" Current chosen theme 
Plug 'morhetz/gruvbox'
" Airline - cool looking status bar
Plug 'vim-airline/vim-airline'

call plug#end ()

"}}}

" THEME SETTINGS======================================================{{{

syntax on
colorscheme gruvbox 
hi Normal guibg=NONE ctermbg=NONE

"}}}

" COMMON SETTINGS====================================================={{{

" Disable strange Vi bindings
set nocompatible

" Search
set hlsearch
set incsearch
set smartcase
set ignorecase 
set infercase

" Search hightlight color
hi Search cterm=NONE ctermfg=black ctermbg=blue 

" Indentation
set expandtab " Use spaces insted of tabs
set shiftround " Use multiples of shiftwidth when << >> 
set tabstop=4
set softtabstop=4
set shiftwidth=4

set cinoptions+=g0
set cpoptions+=x

" don't let python override indentations settings
let g:python_recommended_style=0

" highlight long lines (>80 char)
highlight OverLength ctermbg=darkyellow ctermfg=grey

function! HighlightLongLines()
  let file_type = &filetype
  if index(['python'], file_type) >= 0
    match OverLength /\%>80v.\+/
  else
    call clearmatches()
  endif
endfunction

autocmd BufEnter * call HighlightLongLines()

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
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Don't backup
set nobackup
set noswapfile

" Persistend undo
if has('persistent_undo')
    silent !mkdir -p ~/.vim/undodir > /dev/null 2>&1
    set undodir=~/.vim/undodir
    set undofile
endif

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

" MAPINGS============================================================={{{

" No arrows in normal mode
nmap <Up> <Nop>
nmap <Down> <Nop>
nmap <Left> <Nop>
nmap <Right> <Nop>

" Delete buffer
" nnoremap <Leader>d :bd!<CR>
" Use the plugin instead of the custom command
nnoremap <Leader>d :Bdelete<CR>

" Q does nothing instead of whatever annoying thing it did
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

" Treat visually wrapped lines as multiple lines.
noremap j gj
noremap k gk

" Swap functionalities with above.
noremap gj j
noremap gk k

" Navigate windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Next buffer
nnoremap <Tab> :bn<CR>

" Previous buffer
nnoremap <S-Tab> :bp<CR>

" Enter create file link like in vimwiki
function! CreateFileLink()
    let vim_wiki_extension = ".md"

    let current_line = getline('.')
    if stridx(current_line, vim_wiki_extension) >= 0
      return
    endif

    if stridx(current_line, "*") >= 0 ||
          \ stridx(current_line, "-") >= 0 ||
          \ stridx(current_line, " ") >= 0 ||
          \ stridx(current_line, "#") >= 0
      return
    endif

    execute "normal! 0i["
    execute "normal! $a]"
    execute "normal! bbyi[$pF]a("
    execute "normal! $a" . vim_wiki_extension
    execute "normal! $a)"
    execute "normal! 0"

endfunction

autocmd Filetype markdown nnoremap <CR> :call CreateFileLink() <CR>

" Shortcut for search visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

"}}} 

" RESET TO DEFAULT C++ FILE =========================================={{{

autocmd filetype cpp map <F5> diei// By Stefan Radu<CR><CR>#include <bits/stdc++.h><CR><CR>using namespace std;<CR><CR>#define sz(x) (int)(x).size()<CR><CR>typedef pair < int, int > pii;<CR>typedef long long ll;<CR>typedef long double ld;<CR>typedef unsigned int ui;<CR>typedef unsigned long long ull;<CR><CR>int main() {<CR><CR>#ifdef STEF<CR>freopen("input", "r", stdin);<CR>freopen("output", "w", stdout);<CR>#endif<CR><CR>ios::sync_with_stdio(false);<CR>cin.tie(0);cout.tie(0);<CR><CR>}<ESC><ESC>k 
"}}}

" COMPILE============================================================={{{

set shell=/bin/bash

autocmd filetype cpp nnoremap <F9> :wall <CR>:! g++ -std=c++17 -DSTEF -O2 -pedantic -Wall -Wfatal-errors main.cpp -o main && TIMEFORMAT='\%3R' && time ./main <CR>

autocmd filetype cpp nnoremap <F10> :wall <CR>:! g++ -std=c++17 -DSTEF -O2 -pedantic -Wall -Wfatal-errors % -o %:r && TIMEFORMAT='\%3R' && time ./%:r <CR>

autocmd filetype c nnoremap <F9> :wall <CR>:! gcc -std=c11 -O2 -pedantic -Wall -Wfatal-errors main.c -o main && TIMEFORMAT='\%3R' && time ./main <CR>

autocmd filetype c nnoremap <F10> :wall <CR>:! gcc -std=c11 -O2 -pedantic -Wall -Wfatal-errors % -o %:r && TIMEFORMAT='\%3R' && time ./%:r <CR>

autocmd filetype rust nnoremap <F9> :wall <CR>:! cargo run<CR>

autocmd filetype python nnoremap <F9> :wall <CR>:! TIMEFORMAT='\%3R' && time python %<CR>

autocmd filetype sh nnoremap <F9> :wall <CR>:! ./% <CR>

autocmd filetype haskell nnoremap <F9> :wall <CR>:! ghc % -o %:r && TIMEFORMAT='\%3R' && time ./%:r <CR>

autocmd filetype java nnoremap <F9> :wall <CR>:! TIMEFORMAT='\%3R' && time java %<CR>

"}}}
