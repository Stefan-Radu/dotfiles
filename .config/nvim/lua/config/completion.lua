vim.opt.pumheight = 7
vim.cmd[[set completeopt+=menuone,noselect,popup,fuzzy]]

-- diagnostics
vim.diagnostic.config({
    virtual_text = false, -- we can auto-trigger float window
    virtual_lines = false,
    float = {
        focusable = false,
        style = "minimal",
    },
    -- update_in_insert = true,
})

vim.api.nvim_create_autocmd('InsertCharPre', {
  buffer = vim.api.nvim_get_current_buf(),
  callback = function()
    if vim.fn.pumvisible() == 1 or vim.fn.state('m') == 'm' then
      return
    end
    local triggers = {'/'}
    local char = vim.v.char
    if vim.list_contains(triggers, char) then
      local key = vim.keycode('<C-x><C-f>')
      vim.api.nvim_feedkeys(key, 'm', false)
    end
  end
})

vim.api.nvim_create_autocmd('CompleteDonePre', {
  buffer = vim.api.nvim_get_current_buf(),
  callback = function()
    local comp_info = vim.fn.complete_info()
    if comp_info["mode"] == 'files' and comp_info["selected"] ~= -1 then
      local key = vim.keycode('<C-x><C-f>')
      vim.api.nvim_feedkeys(key, 'm', false)
    end
  end
})


vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)

        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        vim.opt.signcolumn = 'yes'

        local opts = { noremap = true, silent = true, buffer = args.buf }

        -- auto completion settings
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })

            -- trigger completion and next
            vim.keymap.set('i', '<C-n>', function()
                return vim.fn.pumvisible() == 1 and '<C-n>' or vim.lsp.completion.get()
            end, { noremap = true, silent = true, expr = true })

            -- use enter to select completion entry
            vim.keymap.set('i', '<CR>', function()
                return vim.fn.pumvisible() == 1 and '<C-y>' or '<CR>'
            end, { noremap = true, silent = true, expr = true })
        end

        if client:supports_method('textDocument/definition') then
            vim.keymap.set('n', '<leader>gd', function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set('n', '<leader>gt', function() vim.lsp.buf.type_definition() end, opts)
            vim.keymap.set('n', '<leader>gi', function() vim.lsp.buf.implementation() end, opts)
            vim.keymap.set('n', '<leader>gr', function() vim.lsp.buf.references() end, opts)
        end

        if client:supports_method('textDocument/rename') then
            vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
        end

        if client:supports_method('textDocument/codeAction') then
            vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
        end

        if client:supports_method('textDocument/publishDiagnostics') then
            vim.keymap.set('n', '<leader>dq', function() vim.diagnostic.setqflist() end, opts)
            vim.keymap.set('n', '<leader>D' , function() vim.diagnostic.open_float() end, opts)
        end

        if client:supports_method('textDocument/hover') then
            vim.keymap.set('n', 'K', function()
                vim.lsp.buf.hover({
                    silent = true,
                    focus = true,
                })
            end, { noremap = true, silent = true, buffer = true })
        end
    end,
})

----------------------
-- LANGUAGE SERVERS --
----------------------

-- lua language server {{{

vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath('config')
        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using (most
        -- likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Tell the language server how to find Lua modules same way as Neovim
        -- (see `:h lua-module-load`)
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
        }
      }
    })
  end,
  settings = {
    Lua = {}
  }
})
-- }}}
