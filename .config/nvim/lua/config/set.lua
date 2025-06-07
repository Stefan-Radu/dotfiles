-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.infercase = true

-- Indentation
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftround = true -- Use multiples of shiftwidth when << >>
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Wrapping
vim.opt.wrap = true
vim.opt.linebreak = true -- break at 80 chars or something like that

-- Spell Check
vim.opt.spelllang = 'en_gb'

-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.listchars = "eol:¬,tab:» "
vim.opt.cursorline = true
vim.opt.winborder = 'rounded'
-- vim.opt.termguicolors = true

-- backup & undo
vim.opt.swapfile = false
vim.opt.undofile = true

-- Folding
vim.opt.foldlevelstart = 0
vim.opt.foldmethod = 'marker'
vim.opt.foldtext = 'v:lua.require("config.folding").MyFoldText()'

require('config.knap')
