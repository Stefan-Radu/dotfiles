local function ColorScheme(color)
    color = color or "gruvbox"

    vim.o.background = 'dark'
    vim.opt.termguicolors = true
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "PMenu", { bg = "none" })
end

-- make it global
_G.ColorScheme = ColorScheme

return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        opts = {
            terminal_colors = true, -- add neovim terminal colors
            undercurl = true,
            underline = true,
            bold = true,
            italic = {
                strings = true,
                emphasis = true,
                comments = true,
                operators = false,
                folds = true,
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            contrast = "", -- can be "hard", "soft" or empty string
            palette_overrides = {},
            overrides = {},
            dim_inactive = false,
            transparent_mode = false,
        },
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
        opts = {
            disable_background = false,
            styles = {
                italic = false,
                transparency = true,
            },
        },
    },

    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000,
        config = function()
            require("everforest").setup({
                transparent_background_level = 2,
            })
        end,
    }
}
