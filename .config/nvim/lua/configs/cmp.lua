local cmp = require 'cmp'

local icons = {
    Text          = "",
    Method        = "m",
    Function      = "",
    Constructor   = "",
    Field         = "",
    Variable      = "",
    Class         = "",
    Interface     = "",
    Module        = "",
    Property      = "",
    Unit          = "",
    Value         = "",
    Enum          = "",
    Keyword       = "",
    Snippet       = "",
    Color         = "",
    File          = "",
    Reference     = "",
    Folder        = "",
    EnumMember    = "",
    Constant      = "",
    Struct        = "",
    Event         = "",
    Operator      = "",
    TypeParameter = "",
}


cmp.setup({
    mapping = {
        ['<C-k>']     = cmp.mapping.scroll_docs(-4),
        ['<C-j>']     = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>']     = cmp.mapping.abort(),
        ['<CR>']      = cmp.mapping.confirm({ select = true }),
        ["<Tab>"]     = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
        ["<S-Tab>"]   = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
    },

    window = {
        completion    = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, {
        { name = 'buffer' },
        { name = 'path' },
    }),


    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
            vim_item.menu = ({
                luasnip = "",
                buffer  = "",
                path    = "",
            })[entry.source.name]
            return vim_item
        end,
    },

    -- Command mode completion
    cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        })
    }),

    -- Path completion for command mode
    cmp.setup.cmdline('/', {
        sources = {
            { name = 'buffer' }
        }
    }),
})

local servers = require 'globals.lsp_servers'
local capabilities = require('cmp_nvim_lsp').default_capabilities()
for _, v in ipairs(servers) do
    require('lspconfig')[v].setup {
        capabilities = capabilities
    }
end
