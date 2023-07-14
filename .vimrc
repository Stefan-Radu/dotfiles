" CRITICAL SETTINGS =================================================={{{

filetype plugin on 
syntax on

" Disable strange Vi bindings
set nocompatible

" Remap leader key
let mapleader=';'
let maplocalleader="<leader>"

"}}}
 
" PLUGINS SETTINGS===================================================={{{

" Airline {{{

let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1

"}}}

" Blamer {{{

let g:blamer_enabled = 0
let g:blamer_delay = 3000
let g:blamer_prefix = ' >_ '
let g:blamer_date_format = '%d/%m/%y'
let g:blamer_template = '<author> <author-time> [<commit-short>]'

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
    \'coc-css',
    \'coc-go',
    \'coc-html',
    \'coc-json',
    \'coc-pyright',
    \'coc-sh',
    \'coc-texlab',
    \'coc-tsserver',
    \'coc-java',
    \]
"}}}

" Fzf {{{

nnoremap <leader>ff :Files<Cr>
nnoremap <leader>fg :GitFiles<Cr>
nnoremap <leader>fr :Rg<Cr>
nnoremap <leader>fb :Buffers<Cr>
nnoremap <leader>fh :History<Cr>

"}}}

" Goyo {{{

" Get keep transparent background when using goyo
function! s:goyo_leave()
         hi Normal guibg=NONE ctermbg=NONE
endfunction
autocmd! User GoyoLeave nested call <SID>goyo_leave()

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

" LaTeX {{{

let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 0
let g:livepreview_engine = 'lualatex'
let g:livepreview_use_biber = 1
let g:tex_flavor='latex'

"}}}

" Lean {{{

" needed for lean shortcuts
let maplocalleader = ";" 

" Disable CoC Diagnostics for lean as it's taken care of from Julian/lean
augroup lean_stuff
    au FileType lean let b:coc_diagnostic_disable=1
    au FileType lean nnoremap <silent> <localleader>i :LeanInfoviewToggle<CR>
    au FileType lean nnoremap <silent> <localleader>s :LeanSorryFill<CR>
    "au FileType lean nnoremap <silent> <localleader>x :LeanInfoviewAddPin<CR>
    "au FileType lean nnoremap <silent> <localleader>c :LeanInfoviewClearPins<CR>
augroup END

"}}}

" Markdown {{{

" List mark function {{{

function! ListMarkToggle()
    let l:line = getline('.')

    let l:no_mark_expr = '\v^\s*[-*]\s+\w.*'
    let l:empty_mark_expr = '\v^\s*[-*] \[ \]\s+\w.*'
    let l:x_mark_expr = '\v^\s*[-*] \[X\]\s+\w.*'

    if l:line =~ l:no_mark_expr
        " check if line is list item with no mark
        " insert empty mark
        silent execute 's/\v[-*]/& [ ]/|norm!``'
    elseif l:line =~ l:empty_mark_expr
        " check if line is list item with no mark
        " replace with full mark
        silent execute 's/\[ \]/[X]/|norm!``'
    elseif l:line =~ l:x_mark_expr
        " check if line is list item full mark
        " replace with empty mark
        silent execute 's/\[X\]/[ ]/|norm!``'
    endif
endfunction

function! ListMarkRemove()
    let l:line = getline('.')
    let l:mark_expr = '\v^\s*[-*] \[[X ]\]\s+\w.*'

    if l:line =~ l:mark_expr
        " check if line is list item any mark
        " remove mark
        silent execute 's/ \[[X ]\]//|norm!``'
    endif
endfunction

" }}}

set conceallevel=2
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_no_default_key_mappings = 1

" more settings in <SETTINGS> as we need loaded plugins

"}}}

" Polyglot {{{

let g:polyglot_disabled = ['haskell', 'markdown']
let g:polyglot_disabled = ['autoindent']

" }}}

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

" Wiki {{{

let g:wiki_root = '~/Documents/notes'
let g:wiki_filetypes = ['md']
let g:wiki_link_extension = '.md'
let g:wiki_completion_case_sensitive = 0
let g:wiki_link_target_type = 'md'

" }}}

"}}}

" PLUGINS============================================================={{{

call plug#begin('~/.vim/plugged')

"Comment functions so powerful—no comment necessary.
Plug 'scrooloose/nerdcommenter'

" Syntax for everything
Plug 'sheerun/vim-polyglot'
" Syntax for Haskell
Plug 'neovimhaskell/haskell-vim'
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

" Markdown syntax
Plug 'preservim/vim-markdown'
" Markdown live preview in browser
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" For writing
Plug 'junegunn/goyo.vim'
" Wiki plugin
Plug 'lervag/wiki.vim'

" LaTeX live preview
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" A modern Vim and neovim filetype plugin for LaTeX files.
Plug 'lervag/vimtex', {'for': ['tex', 'context', 'bib', 'latex', 'plaintex']}

" Lean Theorem Prover thingies
Plug 'Julian/lean.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'

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

" Smooth navigation with kitty terminal splits
Plug 'knubie/vim-kitty-navigator', {'do': 'cp ./*.py ~/.config/kitty/'}
" Make clipboard usable in wayland
Plug 'jasonccox/vim-wayland-clipboard'

" Current chosen theme 
Plug 'morhetz/gruvbox'
" Airline - cool looking status bar
Plug 'vim-airline/vim-airline'

call plug#end ()

"}}}

" SETTINGS============================================================{{{

" Theme
colorscheme gruvbox
"set background=light   " Setting light mode
hi Normal guibg=NONE ctermbg=NONE

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

" Formatting settings
au FileType * setlocal fo-=cro
au FileType c,cpp setlocal fo=croq

" Don't backup
set nobackup
set noswapfile

" Persistend undo
if has('persistent_undo')
    silent !mkdir -p ~/.vim/undodir > /dev/null 2>&1
    set undodir=~/.vim/undodir
    set undofile
endif

" NETRW
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'

" Views
set viewdir=~/.vim/views/

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

augroup markdown_stuff
    au!
    " autosave
    au FileType markdown au TextChanged <buffer> silent write
    " fold lists
    au Filetype markdown setlocal foldmethod=indent | setlocal foldenable 
    " Save and restore manual folds when we exit a file 
    au BufWinLeave *.md mkview
    au BufWinEnter *.md silent! loadview
    " List marks
    au FileType markdown noremap <silent> <Plug>ListMarkToggleMap :call ListMarkToggle()<CR>
                \:call repeat#set("\<Plug>ListMarkToggleMap")<CR>
    au FileType markdown noremap <silent> <Plug>ListMarkRemoveMap :call ListMarkRemove()<CR>
                \:call repeat#set("\<Plug>ListMarkRemoveMap")<CR>
    au FileType markdown noremap <leader>lt <Plug>ListMarkToggleMap
    au FileType markdown noremap <leader>ld <Plug>ListMarkRemoveMap
augroup END

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
" Not necessary due to vim-kitty plugin
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

" Next buffer
nnoremap <Tab> :bn<CR>

" Previous buffer
nnoremap <S-Tab> :bp<CR>

" Shortcut for search visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Default cpp algo template
autocmd filetype cpp map <F5> :0r ~/.vim/templates/cpp_algo.cpp<CR>Gddk

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
