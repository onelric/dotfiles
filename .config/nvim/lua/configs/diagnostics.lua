local signs = {
    Hint = "󰌵",
    Warn = "",
    Error = "",
    Info = "",
}

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    float = {
        border = 'rounded',
        focusable = false,
        prefix = ' ', --' * ',
        source = false,
        format = function(diagnostic)
            local sign = ''
            if diagnostic.severity == vim.diagnostic.severity.ERROR then
                sign = signs.Error
            elseif diagnostic.severity == vim.diagnostic.severity.WARN then
                sign = signs.Warn
            elseif diagnostic.severity == vim.diagnostic.severity.HINT then
                sign = signs.Hint
            elseif diagnostic.severity == vim.diagnostic.severity.INFO then
                sign = signs.Info
            end
            return string.format(sign .. ': %s', diagnostic.message)
        end
    },
    update_in_insert = true,
    severity_sort = true,
})

vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focus=false })]]

for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = nil })
end
