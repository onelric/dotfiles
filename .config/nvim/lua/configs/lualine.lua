local color = require 'colorschemes.paradise'

local lualine = require('lualine')

local colors = {
    darkbg    = color.base00,
    bg        = color.base00,
    fg        = color.base07,
    gray      = color.base04,
    darkgray  = color.base03,
    yellow    = color.base09,
    green     = color.base0B,
    violet    = color.base0E,
    blue      = color.base0D,
    bluegreen = color.base0C,
    red       = color.base08,
}

local config = {
    options = {
        component_separators = '',
        section_separators = '',
        theme = {
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
    },
    sections = { lualine_a = {}, lualine_b = {}, lualine_y = {}, lualine_z = {}, lualine_c = {}, lualine_x = {} },
    inactive_sections = { lualine_a = {}, lualine_b = {}, lualine_y = {}, lualine_z = {}, lualine_c = {}, lualine_x = {} }
}

local function get_mode_color()
    local mode_color = {
        n = colors.yellow,
        i = colors.green,
        v = colors.blue,
        V = colors.violet,
        c = colors.red,
        t = colors.red,
        R = colors.bluegreen,
        ['^V'] = colors.violet
    }
    return { fg = mode_color[vim.fn.mode()], bg = colors.darkbg, gui = 'italic' }
end

local conditions = {
    not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    lsp_running = function()
        return next(vim.lsp.get_active_clients()) ~= nil
    end
}

local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

local function ins_mid(component)
    table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

local function ins_gap()
    ins_left({ function() return '%=' end })
end

local default_padding = { left = 2, right = 2 }

-- Left modules

-- Mode module
ins_left({
    'mode',
    color = get_mode_color,
    fmt = string.lower,
    padding = { left = 18, right = 2 },
})

-- Diagnostics module
ins_left({
    'diagnostics',
    symbols = { error = ' ', warn = '  ', hint = '  ' },
    sections = { 'error', 'warn', 'hint' },
    sources = { 'nvim_diagnostic', 'nvim_lsp' },
    always_visible = false,
    diagnostics_color = {
        color_error = { fg = colors.red, bg = colors.darkbg },
        color_warn = { fg = colors.yellow, bg = colors.darkbg },
        color_info = { fg = colors.blue, bg = colors.darkbg },
    },
    color = { bg = colors.darkbg },
    padding = default_padding,
    cond = conditions.lsp_running,
})

-- Insert gap in the middle
ins_gap()

-- Filename module
ins_left({
    function()
        local filename = vim.fn.expand('%:t')
        if filename == '' then
            filename = 'Unnamed Buffer'
        end
        local max_length = 14
        local fill
        local left_padding = {}
        local right_padding = {}
        if #filename > max_length then
            return string.sub(filename, 1, max_length) .. '..'
        end
        fill = (max_length + 2) - #filename
        for i = 1, fill / 2, 1 do
            table.insert(right_padding, ' ')
            table.insert(left_padding, ' ')
        end
        return table.concat(left_padding, '') .. filename .. table.concat(right_padding, '')
    end,
    color = { fg = colors.gray, bg = colors.darkbg, gui = 'italic' },
    padding = { left = default_padding.left },
})

-- Middle components

-- Display running lsp module
--ins_mid({
--function()
--local icon = '亮'
--local err = icon .. ' not running'
--local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
--local clients = vim.lsp.get_active_clients()
--if next(clients) == nil then
--return err
--end
--for _, client in ipairs(clients) do
--local filetypes = client.config.filetypes
--if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--return icon .. client.name .. ''
--end
--end
--return err
--end,
--color = { fg = colors.red, bg = colors.darkbg, gui = 'italic' },
--padding = { left = 1, right = 1 }
--})

-- Right side

-- Display file git changes
ins_right({
    'diff',
    symbols = { added = '  ', modified = '  ', removed = '  ' },
    diff_color = {
        added = { fg = colors.green, bg = colors.darkbg },
        modified = { fg = colors.yellow, bg = colors.darkbg },
        removed = { fg = colors.red, bg = colors.darkbg },
    },
    padding = default_padding
})

-- Diplsay git branch
ins_right({
    'branch',
    icon = '',
    color = { fg = colors.violet, bg = colors.darkbg, gui = 'bolditalic' },
    padding = default_padding
})

-- Display hostname
ins_right({
    'hostname',
    fmt = string.lower,
    color = { fg = colors.green, bg = colors.darkbg, gui = 'italic' },
    padding = { left = 2, right = 18 }
})

-- Complete!
lualine.setup(config)
