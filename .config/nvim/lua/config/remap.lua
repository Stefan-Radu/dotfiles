local opts = { noremap = true, silent = true }

vim.g.mapleader = ";"
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- cursed
vim.keymap.set('n', 'Q', '<Nop>')

-- buffer deletion without affecting windows etc
vim.keymap.set('n', '<leader>bd', '<cmd>BufDel<Cr>', opts)

-- Search navigation
vim.keymap.set('n', 'n', 'nzz', opts)
vim.keymap.set('n', 'N', 'Nzz', opts)
vim.keymap.set('n', '*', function()
    -- if a count was supplied, execute * normally and exit
    if vim.v.count > 0 then
        vim.cmd('normal! ' .. vim.v.count .. '*<CR>')
        return
    end

    -- save current window view
    local windowView = vim.fn.winsaveview()

    -- execute * normally
    vim.cmd('silent keepjumps normal! *<CR>')

    -- restore the window view
    if windowView ~= nil then
        vim.fn.winrestview(windowView)
    end
end, opts)

-- clear highlights and quickfixlist
vim.keymap.set('n', '<Leader><Space>', ':noh<CR>:ccl<CR>', opts)

-- close folds
vim.keymap.set('n', '<Space>', 'za')

-- tabs navigation
vim.keymap.set('n', '<Tab>', ':bn<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bp<CR>', opts)
vim.keymap.set('n', '<C-i>', '<C-i>')

-- Copy / Paste with system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y',  '\"+y')
vim.keymap.set('v', '<leader>Y',  '\"+Y')
vim.keymap.set({ 'n', 'v' }, '<leader>p',  '\"+p')
vim.keymap.set({ 'n', 'v' }, '<leader>P',  '\"+P')
