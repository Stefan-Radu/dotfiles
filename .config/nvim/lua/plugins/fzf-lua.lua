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
            vim.keymap.set("n", "<leader>fF", fzflua.git_files)
            vim.keymap.set("n", "<leader>fw", fzflua.grep_cword)
            vim.keymap.set("n", "<leader>fb", fzflua.buffers)
            vim.keymap.set("n", "<leader>fl", fzflua.lines)
            vim.keymap.set("n", "<leader>fr", fzflua.live_grep)
            vim.keymap.set("n", "<leader>flr", fzflua.lsp_references)
            vim.keymap.set("n", "<leader>fld", fzflua.diagnostics_document)
            vim.keymap.set("n", "<leader>fs", fzflua.lsp_workspace_symbols)
            vim.keymap.set("i", "<C-f>", fzflua.complete_path)
        end
    }
}
