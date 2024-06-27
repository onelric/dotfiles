require('nvim-lsp-installer').setup({
    automatic_installation = true,
    ui = {
        border = 'single',
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
