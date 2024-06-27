vim.opt.list = true
vim.opt.listchars:append("eol:↴")

local highlight = {
    "CursorColumn",
    "Whitespace",
}
require("ibl").setup {
    --indent = { char = "▐" },
    --whitespace = {
    --remove_blankline_trail = false,
    --},
    scope = {
        show_start = false
    },
}

local hooks = require("ibl.hooks")
hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
