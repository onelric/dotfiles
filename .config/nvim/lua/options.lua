local options = {
    backup = false,
    hlsearch = true,
    incsearch = true,
    showmode = false,
    showtabline = 2,
    ignorecase = true,
    smartindent = true,
    swapfile = false,
    termguicolors = true,
    shiftwidth = 4,
    tabstop = 4,
    softtabstop = 4,
    laststatus = 3, -- Always show at the bottom
    expandtab = true,
    cursorline = true,
    number = true,
    nu = true,
    relativenumber = true,
    numberwidth = 4,
    wrap = false,
    scrolloff = 8,
    sidescrolloff = 8,
    bg = 'dark'
}

vim.opt.shortmess:append "c"
for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Supported languages for auto formatting
local format_lang = { '*.cpp', '*.hpp', '*.c', '*.h', '*.lua', '*.rs', '*.py', '*.json', '*.md', '*.txt' }

-- Replace vertical split char
--vim.cmd('set fillchars+=vert:▐')

-- Map vim notifications to use the notify plugin
vim.notify = require("notify")

-- Auto attach colorizer
vim.api.nvim_create_autocmd("BufEnter", { command = 'ColorizerAttachToBuffer', pattern = "*" })

-- Auto formatting
vim.api.nvim_create_autocmd("BufWritePre", { command = 'lua FORMAT_DOCUMENT()', pattern = format_lang })

-- Change relative numbers
vim.api.nvim_create_autocmd("InsertEnter", { command = 'set norelativenumber', pattern = "*" })
vim.api.nvim_create_autocmd("InsertLeave", { command = 'set relativenumber', pattern = "*" })
vim.cmd("autocmd BufEnter * if &buftype ==# 'terminal' | stopinsert! | endif")
vim.cmd('autocmd BufRead,BufNewFile * setlocal signcolumn=yes')
