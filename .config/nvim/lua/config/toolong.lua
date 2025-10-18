-- Function to toggle the colorcolumn

local M = {}

local colorcolumn_enabled = false
function M.ToggleColorColumn()
    colorcolumn_enabled = not colorcolumn_enabled

    if colorcolumn_enabled then
        -- Set colorcolumn when enabled
        vim.wo.colorcolumn = "80," .. table.concat(vim.tbl_map(tostring, vim.fn.range(120, 999)), ",")
        print("Colorcolumn enabled")
    else
        -- Clear colorcolumn when disabled
        vim.wo.colorcolumn = ""
        print("Colorcolumn disabled")
    end
end

return M
