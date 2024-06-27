local color = require 'colorschemes.paradise'

local custom = '#101010'
--local custom = '#191919'

require('bufferline').setup {
    options = {
        offsets = {
            {
                filetype = 'neo-tree',
                text = 'File Explorer',
                highlight = "BufferLineOffset",
                padding = 1
            }
        },
        show_buffer_close_icons = true,
        modified_icon = '󰧟',
        close_icon = '',
        buffer_close_icon = '',
        show_close_icon = true,
        diagnostics = "nvim_lsp",
        indicator = {
            style = 'underline'
        },

    },
    highlights = {
        fill                 = { bg = color.base00 },
        background           = { bg = custom },
        --indicator_selected   = { fg = color.base0C },

        close_button         = { fg = color.base03, bg = custom },
        close_button_visible = { fg = color.base03, bg = color.base00 },

        --separator             = { fg = color.base000, bg = custom },
        --separator_visible     = { fg = color.base00, bg = color.base00 },
        --separator_selected    = { fg = color.base00, bg = color.base00 },

        warning              = { fg = color.base09, bg = custom, underline = true },
        warning_visible      = { fg = color.base09 },
        --warning_selected     = { fg = color.base09, underline = true },

        error                = { fg = color.base08, bg = custom, underline = true },
        error_visible        = { fg = color.base08 },
        error_selected       = { fg = color.base08, underline = true },

        --hint                  = { fg = color.base0D, bg = custom, underline = true },
        --hint_visible          = { fg = color.base0D },
        --hint_selected         = { fg = color.base0D, underline = true },
    }
}
