return {
    {
        "alexghergh/nvim-tmux-navigation",
        opts = {
            disable_when_zoomed = true, -- defaults to false
            keybindings = {
                left = "<C-h>",
                down = "<C-j>",
                up = "<C-k>",
                right = "<C-l>",
            },
        },
    },

    {
        "mbbill/undotree",
        lazy = false,
        config = function()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
        end,
    },

    {
        "kylechui/nvim-surround",
        version = "^3.0.0",
        event = "VeryLazy",
        opts = {},
    },

    { "frabjous/knap", lazy = true },

    {
        'ojroques/nvim-bufdel',
        opts = {
            next = 'alternate',
            quit = false,  -- quit Neovim when last buffer is closed
        },
    },
}
