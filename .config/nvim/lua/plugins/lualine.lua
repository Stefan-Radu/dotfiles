return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                icons_enabled = true,
                theme = 'auto',
                -- component_separators = "│",
                component_separators = "",
                -- section_separators = { left = "", right = "" },
                section_separators = "",
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                always_show_tabline = true,
                globalstatus = false,
                refresh = {
                    statusline = 100,
                    tabline = 100,
                    winbar = 100,
                }
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff'},
                lualine_c = {'lsp_status', 'filename'},
                lualine_x = {'encoding', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            -- tabline = {
            --     lualine_a = {
            --         {
            --             'buffers',
            --             icons_enabled = false,
            --             show_filename_only = false,   -- Shows shortened relative path when set to false.
            --             hide_filename_extension = false,   -- Hide filename extension when set to true.
            --             show_modified_status = true, -- Shows indicator when the buffer is modified.
            --
            --             mode = 0, -- 0: Shows buffer name
            --                         -- 1: Shows buffer index
            --                         -- 2: Shows buffer name + buffer index
            --                         -- 3: Shows buffer number
            --                         -- 4: Shows buffer name + buffer number
            --
            --             max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
            --                                                 -- it can also be a function that returns
            --                                                 -- the value of `max_length` dynamically.
            --             filetype_names = {
            --                 fzf = 'fzf',
            --             }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
            --
            --             symbols = {
            --                 modified = ' ●',      -- Text to show when the buffer is modified
            --                 alternate_file = ' ', -- Text to show to identify the alternate file
            --                 directory =  '',     -- Text to show when the buffer is a directory
            --             },
            --         }
            --     },
            -- },
            extensions = {}
        },
    },
}
