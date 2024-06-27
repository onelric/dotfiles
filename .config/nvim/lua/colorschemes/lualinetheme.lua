local colors = require 'colorschemes.paradise'

local c = {
    fg = colors.base05,
    gray = colors.base03,
    innerbg = nil,
    outerbg = colors.base02,
    normal = colors.base0D,
    insert = colors.base0B,
    visual = colors.base0E,
    replace = colors.base0C,
    command = colors.base08
}

return {
    inactive = {
        a = { fg = colors.fg, bg = colors.outerbg },
        b = { fg = colors.fg, bg = colors.outerbg },
        c = { fg = colors.fg, bg = colors.innerbg }
    },
    visual = {
        a = { fg = colors.gray, bg = colors.visual, gui = "bolditalic" },
        b = { fg = colors.fg, bg = colors.outerbg },
        c = { fg = colors.fg, bg = colors.innerbg }
    },
    replace = {
        a = { fg = colors.gray, bg = colors.replace, gui = "bolditalic" },
        b = { fg = colors.fg, bg = colors.outerbg },
        c = { fg = colors.fg, bg = colors.innerbg }
    },
    normal = {
        a = { fg = colors.gray, bg = colors.normal, gui = "bolditalic" },
        b = { fg = colors.fg, bg = colors.outerbg },
        c = { fg = colors.fg, bg = colors.innerbg }
    },
    insert = {
        a = { fg = colors.gray, bg = colors.insert, gui = "bolditalic" },
        b = { fg = colors.fg, bg = colors.outerbg },
        c = { fg = colors.fg, bg = colors.innerbg }
    },
    command = {
        a = { fg = colors.gray, bg = colors.command, gui = "bolditalic" },
        b = { fg = colors.fg, bg = colors.outerbg },
        c = { fg = colors.fg, bg = colors.innerbg }
    },
}
