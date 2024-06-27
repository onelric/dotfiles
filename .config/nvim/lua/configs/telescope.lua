local actions = require 'telescope.actions'

local config = {
    defaults = {
        mappings = {
            n = {
                [":q<cr>"] = actions.close,
            },
        }
    },
    pickers = {
        find_files = { prompt_prefix = "   " },
        oldfiles = { prompt_prefix = "   " },
        treesitter = { prompt_prefix = "   " }
    },
    extensions = {
    },
}

require('telescope').setup(config)
