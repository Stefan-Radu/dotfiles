local M = {}

function M.MyFoldText()
    local curBuff = vim.api.nvim_get_current_buf()
    local line = table.concat(vim.fn.getbufline(curBuff, vim.v.foldstart))
    local nucolwidth = vim.opt.number:get() and vim.opt.numberwidth:get() or 0
    local windowwidth = vim.fn.winwidth(0) - nucolwidth - 1
    local foldedlinecount = vim.v.foldend - vim.v.foldstart

    -- -- Expand tabs into spaces
    local onetab = string.rep(' ', vim.opt.tabstop:get())
    line = line:gsub('\t', onetab)
    --
    line = line:sub(1, windowwidth - 2 - #tostring(foldedlinecount))
    local fillcharcount = windowwidth - #line - #tostring(foldedlinecount)
    return line .. string.rep(' ', fillcharcount) .. foldedlinecount .. ' '
end

return M
