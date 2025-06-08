-- search
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.infercase = true

-- Indentation
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.shiftround = true -- Use multiples of shiftwidth when << >>
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- Wrapping
vim.o.wrap = true
vim.o.linebreak = true -- break at 80 chars or something like that

-- Spell Check
vim.o.spelllang = 'en_gb'

-- UI
vim.o.number = true
vim.o.relativenumber = true
vim.o.list = true
vim.o.listchars = "eol:¬,tab:» "
vim.o.cursorline = true
vim.o.winborder = 'rounded'
-- vim.o.termguicolors = true

-- backup & undo
vim.o.swapfile = false
vim.o.undofile = true

-- Folding
vim.o.foldlevelstart = 0
vim.o.foldmethod = 'marker'
vim.o.foldtext = 'v:lua.require("config.folding").MyFoldText()'

require('config.knap')
