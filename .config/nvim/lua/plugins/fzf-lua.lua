return {
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            winopts = {
               row = 0.99,
            },
        },
        config = function()
            local fzflua = require('fzf-lua')
            vim.keymap.set("n", "<leader>ff", fzflua.files)
            vim.keymap.set("n", "<leader>fg", fzflua.git_files)
            vim.keymap.set("n", "<leader>fb", fzflua.buffers)
            vim.keymap.set("n", "<leader>fr", fzflua.grep_project)
            vim.keymap.set("n", "<leader>fR", fzflua.live_grep_native)
            vim.keymap.set("n", "<leader>flr", fzflua.lsp_references)
            vim.keymap.set("n", "<leader>fld", fzflua.diagnostics_document)
            vim.keymap.set("i", "<C-f>", fzflua.complete_path)
        end
    }
}
