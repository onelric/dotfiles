function CLOSE_TAB()
    vim.api.nvim_command('Neotree close')
    vim.api.nvim_command('bd!')
    vim.api.nvim_command('Neotree left')
    vim.api.nvim_command('wincmd l')
end

function TOGGLE_TERM()
    vim.api.nvim_command('Neotree close')
    vim.api.nvim_command('ToggleTerm')
    vim.api.nvim_command('Neotree left')
end

function TOGGLE_TROUBLE()
    vim.api.nvim_command('Neotree close')
    vim.api.nvim_command('TroubleToggle')
    vim.api.nvim_command('Neotree left')
    vim.api.nvim_command('wincmd l')
end

function FORMAT_DOCUMENT()
    vim.cmd 'lua vim.diagnostic.hide()'
    vim.cmd 'lua vim.lsp.buf.format()'
    vim.cmd 'lua vim.diagnostic.show()'
end

function ALPHA_QUOTES()
    local quotes = {
        '冬後の桜',
        '桜の木はピンク',
        '樹皮は茶色',
    }
    math.randomseed(os.time())
    local index = math.random(#quotes)
    return quotes[index]
end
