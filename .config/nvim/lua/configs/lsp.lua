local lsp = require('lspconfig')

local on_attach = function(client)
    require('completion').on_attach(client)
end

-- ---- Ccls ----
lsp.ccls.setup({
    autostart = false,
})

-- ---- Clangd ----
lsp.clangd.setup {
    cmd = {
        "clangd",
        "--background-index",
        "--suggest-missing-includes",
        --"--include-directory=include/"
    },
    filetypes = { "c", "cc", "cpp", "c++", "objc", "objcpp" },
    root_dir = require('lspconfig').util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
}

-- ---- Rust Analyzer ----
lsp.rust_analyzer.setup({
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = false
            },
        }
    }
})

local servers = require 'globals.lsp_servers'
for _, v in ipairs(servers) do
    lsp[v].setup {
        --handlers = handlers,
        on_attach = on_attach,
        autostart = true
    }
end
