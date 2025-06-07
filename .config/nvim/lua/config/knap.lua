local init = false

vim.api.nvim_create_user_command('KnapTogglePreview', function()
    if not init then
        vim.g.knap_settings = {
            htmloutputext = "html",
            htmltohtml = "none",
            htmltohtmlviewerlaunch = "mullvad %outputfile%",
            htmltohtmlviewerrefresh = "none",
            htmltohtmlshorterror = nil,
            ---
            mdoutputext = "pdf",
            mdtopdf = "pandoc --pdf-engine typst %docroot% --output /tmp/%outputfile%",
            mdtopdfviewerlaunch = "zathura /tmp/%outputfile%",
            mdtopdfviewerrefresh = "none",
            mdtopdfbufferasstdin = false,
            mdtopdfshorterror = nil,
            ---
            texoutputext = "pdf",
            textopdf = "lualatex --no-shell-escape --interaction=batchmode --halt-on-error --synctex=1 %docroot%",
            textopdfviewerlaunch = "zathura --synctex-editor-command 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%{input}'\"'\"',%{line},0)\"' %outputfile%",
            textopdfviewerrefresh = "none",
            textopdfforwardjump = "zathura --synctex-forward=%line%:%column%:%srcfile% %outputfile%",
            textopdfshorterror = "none",
            ---
            delay = 1000,
        }

        local knap = require("knap")
        knap.toggle_autopreviewing()

        vim.api.nvim_create_user_command('KnapStopPreview', function() knap.close_viewer() end, {})

        vim.keymap.set({'n', 'v', 'i'}, '<F5>', function() knap.process_once() end)
        vim.keymap.set({ 'n', 'v', 'i' },'<F6>', function() knap.forward_jump() end)

        -- autoclose on buffer unload
        vim.api.nvim_create_autocmd({ "BufUnload", "BufDelete" }, {
            buffer = 0,
            callback = function() knap.close_viewer() end,
        })

        init = true
    else
        local knap = require("knap")
        knap.toggle_autopreviewing()
    end
end, {})
