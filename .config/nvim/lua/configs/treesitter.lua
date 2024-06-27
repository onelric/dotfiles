require('nvim-treesitter.configs').setup {
    ensure_installed = { 'cpp', 'c', 'rust', 'lua' },
    highlight = {
        enable = true,
    }
}
