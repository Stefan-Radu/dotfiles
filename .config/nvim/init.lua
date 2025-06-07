require('config.remap')
require('config.lazy')
require('config.set')
require('config.completion')

--ColorScheme('rose-pine')
ColorScheme('gruvbox')
-- ColorScheme('everforest')

vim.lsp.enable('lua_ls')
vim.lsp.enable('ccls')
vim.lsp.enable('pyright')
vim.lsp.enable('texlab')

-- TODO: 
--  * steal some more mapping from theprimagen
--  * other plugins from old config
